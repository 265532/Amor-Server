package com.smartAmor.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ApiResponse<T> {
    private int status;
    private String message;
    private T data;
    private static final Logger logger = LoggerFactory.getLogger(ApiResponse.class);

    private ApiResponse(int status, String message, T data) {
        setStatus(status);
        setMessage(message);
        setData(data);
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

    public static <T> ApiResponse<T> auto(T data, Exception e) {
        if (e != null) {
            logger.error("发生异常: {}", e.getMessage(), e);
            return ApiResponse.error("服务器内部错误");
        }
        if (data == null) {
            logger.warn("无数据");
            return ApiResponse.error("无数据");
        }
        return new ApiResponse<>(200, "success", data);
    }

    public static <T> ApiResponse<T> auto(T data) {
        return auto(data, null);
    }

    // Getters
    public int getStatus() { return status; }
    public String getMessage() { return message; }
    public T getData() { return data; }

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