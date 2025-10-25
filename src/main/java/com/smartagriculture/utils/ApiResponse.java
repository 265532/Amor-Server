package com.smartagriculture.utils;

import org.springframework.http.HttpStatus;

public class ApiResponse<T> {
    private final HttpStatus status;
    private final String message;
    private final T data;
    private final String errorCode; // 新增错误码字段

    private ApiResponse(HttpStatus status, String message, T data, String errorCode) {
        this.status = status;
        this.message = message;
        this.data = data;
        this.errorCode = errorCode;
    }

    // 成功响应（带数据）
    public static <T> ApiResponse<T> success(T data) {
        return new ApiResponse<>(HttpStatus.OK, null, data, null);
    }

    // 成功响应（带消息和数据）
    public static <T> ApiResponse<T> success(String message, T data) {
        return new ApiResponse<>(HttpStatus.OK, message, data, null);
    }

    // 错误响应（简单错误消息）
    public static <T> ApiResponse<T> error(String message) {
        return new ApiResponse<>(HttpStatus.BAD_REQUEST, message, null, null);
    }

    // 错误响应（带错误码和错误消息）
    public static <T> ApiResponse<T> error(String errorCode, String message) {
        return new ApiResponse<>(HttpStatus.BAD_REQUEST, message, null, errorCode);
    }

    // 错误响应（带错误码、错误消息和数据）
    public static <T> ApiResponse<T> error(String errorCode, String message, T data) {
        return new ApiResponse<>(HttpStatus.BAD_REQUEST, message, data, errorCode);
    }

    // Getters
    public HttpStatus getStatus() { return status; }
    public String getMessage() { return message; }
    public T getData() { return data; }
    public String getErrorCode() { return errorCode; }
}