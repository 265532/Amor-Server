package com.smartAmor.utils;

import org.springframework.http.HttpStatus;

public class ApiResponse<T> {
    private int status;
    private String message;
    private T data;
    private long timestamp;

    private ApiResponse(int status, String message, T data) {
        this.status = status;
        this.message = message;
        this.data = data;
        this.timestamp = System.currentTimeMillis();
    }

    // 成功响应（带数据）
    public static <T> ApiResponse<T> success(T data) {
        return new ApiResponse<>(HttpStatus.OK.value(), null, data);
    }

    // 成功响应（带消息和数据）
    public static <T> ApiResponse<T> success(String message, T data) {
        return new ApiResponse<>(HttpStatus.OK.value(), message, data);
    }

    // 成功响应（仅消息，无数据）
    public static <T> ApiResponse<T> success(String message) {
        return new ApiResponse<>(HttpStatus.OK.value(), message, null);
    }

    // 创建成功响应（201状态码）
    public static <T> ApiResponse<T> created(String message, T data) {
        return new ApiResponse<>(HttpStatus.CREATED.value(), message, data);
    }

    // 错误响应（简单错误消息）
    public static <T> ApiResponse<T> error(String message) {
        return new ApiResponse<>(HttpStatus.BAD_REQUEST.value(), message, null);
    }

    // 错误响应（带状态码和错误消息）
    public static <T> ApiResponse<T> error(int status, String message) {
        return new ApiResponse<>(status, message, null);
    }

    // 错误响应（带状态码、错误消息和数据）
    public static <T> ApiResponse<T> error(int status, String message, T data) {
        return new ApiResponse<>(status, message, data);
    }

    // 错误响应（带HttpStatus枚举）
    public static <T> ApiResponse<T> error(HttpStatus status, String message) {
        return new ApiResponse<>(status.value(), message, null);
    }

    // 未找到资源
    public static <T> ApiResponse<T> notFound(String message) {
        return new ApiResponse<>(HttpStatus.NOT_FOUND.value(), message, null);
    }

    // 无权限
    public static <T> ApiResponse<T> forbidden(String message) {
        return new ApiResponse<>(HttpStatus.FORBIDDEN.value(), message, null);
    }

    // 服务器内部错误
    public static <T> ApiResponse<T> internalError(String message) {
        return new ApiResponse<>(HttpStatus.INTERNAL_SERVER_ERROR.value(), message, null);
    }

    // Getters
    public int getStatus() { return status; }
    public String getMessage() { return message; }
    public T getData() { return data; }
    public long getTimestamp() { return timestamp; }

    // Setters（可根据需要设置为private或删除setter）
    public void setStatus(int status) {
        this.status = status;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setData(T data) {
        this.data = data;
    }
}