package org.kardia.webapp.controller;

import org.kardia.webapp.service.impl.FileStorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class ImageController {
    private final FileStorageService fileStorageService;

    @GetMapping("/download/{fileName}")
    public ResponseEntity<Resource> get(@PathVariable String fileName) {
        try {
            Resource resource = fileStorageService.downloadFile(fileName);
            MediaType contentType = MediaType.IMAGE_JPEG;

            return ResponseEntity.ok()
                    .contentType(contentType)
                    .header(HttpHeaders.CONTENT_DISPOSITION, "inline;fileName" + resource.getFilename())
                    .body(resource);
        } catch (Exception ex) {
            throw new RuntimeException(ex.getMessage());
        }
    }
}
