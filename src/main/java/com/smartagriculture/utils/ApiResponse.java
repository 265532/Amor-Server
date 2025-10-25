package com.smartagriculture.utils;

import org.springframework.http.HttpStatus;

public class ApiResponse<T> {
    private final int status;
    private final String message;
    private final T data;

    private ApiResponse(int status, String message, T data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }

    // 成功响应（带数据）
    public static <T> ApiResponse<T> success(T data) {
        return new ApiResponse<>(200, null, data);
    }

    // 成功响应（带消息和数据）
    public static <T> ApiResponse<T> success(String message, T data) {
        return new ApiResponse<>(200, message, data);
    }

    // 错误响应（简单错误消息）
    public static <T> ApiResponse<T> error(String message) {
        return new ApiResponse<>(400, message, null);
    }

    // 错误响应（带错误码和数据）
    public static <T> ApiResponse<T> error(String message, T data) {
        return new ApiResponse<>(400, message, data);
    }

    // Getters
    public int getStatus() { return status; }
    public String getMessage() { return message; }
    public T getData() { return data; }
}