package com.javaweb.controller.admin;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

@RestController
public class ImageController {

    private static final String IMAGE_DIRECTORY = "D:/uploads/building/";

    @GetMapping("/uploads/building/{imageName}")
    public ResponseEntity<byte[]> getImage(@PathVariable String imageName) throws IOException {
        File imageFile = new File(IMAGE_DIRECTORY +"building/" + imageName);

        if (imageFile.exists()) {
            try (InputStream inputStream = new FileInputStream(imageFile)) {
                // Đọc ảnh thủ công theo cách cũ (Java 8)
                byte[] imageBytes = new byte[(int) imageFile.length()];
                inputStream.read(imageBytes);

                // Trả về ảnh dưới dạng byte array với header đúng kiểu
                return ResponseEntity.ok()
                        .header(HttpHeaders.CONTENT_TYPE, MediaType.IMAGE_JPEG_VALUE)  // Hoặc MediaType.IMAGE_PNG_VALUE nếu là ảnh PNG
                        .body(imageBytes);
            }
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}

