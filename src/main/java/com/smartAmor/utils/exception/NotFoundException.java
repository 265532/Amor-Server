package com.smartAmor.utils.exception;

// 更细粒度的异常类
public class NotFoundException extends BusinessException {
    public NotFoundException(String message) {
        super(message);
    }
}
