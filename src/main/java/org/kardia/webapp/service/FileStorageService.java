package org.kardia.webapp.service;

import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

public interface FileStorageService {
    String storeProfile(MultipartFile file, String userName);
    Resource downloadFile(String fileName);
}
