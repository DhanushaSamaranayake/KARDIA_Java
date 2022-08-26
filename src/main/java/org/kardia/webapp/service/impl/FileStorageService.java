package org.kardia.webapp.service.impl;

import org.kardia.webapp.model.User;
import org.kardia.webapp.repo.UserRepository;
import org.kardia.webapp.service.SecurityService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.transaction.Transactional;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Objects;

@Service
public class FileStorageService implements org.kardia.webapp.service.FileStorageService {
    private final Path fileStoragePath;
    private final String fileStorageLocation;
    private final SecurityService securityService;
    private final UserRepository UserRepository;

    public FileStorageService(@Value("${spring.servlet.multipart.location:temp}") String fileStorageLocation, SecurityService securityService,
                              UserRepository UserRepository) throws IOException {
        this.fileStorageLocation = fileStorageLocation;
        this.securityService = securityService;
        this.UserRepository = UserRepository;
        fileStoragePath = Paths.get(fileStorageLocation).toAbsolutePath().normalize();
        Files.createDirectories(fileStoragePath);
    }

    @Transactional
    public String storeProfile(MultipartFile file, String userName) {
        String fileName;
        try {
            fileName = StringUtils.cleanPath(Objects.requireNonNull(file.getOriginalFilename()));
            Path filePath = Paths.get(fileStoragePath + "/" + securityService.findLoggedInUsername() + "_" + fileName);
            String url = ServletUriComponentsBuilder.fromCurrentContextPath()
                    .path("/download/")
                    .path(securityService.findLoggedInUsername() + "_")
                    .path(fileName)
                    .toUriString();
            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
            User user = UserRepository.findUserByEmail(securityService.findLoggedInUsername()).orElse(null);
            if (user != null) {
                user.setProfileUri(url);
                UserRepository.save(user);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return fileName;
    }

    @Override
    public Resource downloadFile(String fileName) {
        Path path = Paths.get(fileStorageLocation).toAbsolutePath().resolve(fileName);
        Resource resource;
        try {
            resource = new UrlResource(path.toUri());
        } catch (MalformedURLException e) {
            throw new RuntimeException(e);
        }
        if (resource.exists() && resource.isReadable()) {
            return resource;
        } else {
            throw new RuntimeException("the file doesn't exist or not readable");
        }
    }
}
