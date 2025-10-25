package com.smartagriculture.utils;

import org.springframework.http.ResponseEntity;

public final class ResponseEntityUtil {

    private ResponseEntityUtil() {
    }

    public static <T> ResponseEntity<T> okOrNotFound(T body) {
        if (body == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(body);
    }
}
