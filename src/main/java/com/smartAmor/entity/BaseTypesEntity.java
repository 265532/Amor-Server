package com.smartAmor.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@TableName(value = "base_types", autoResultMap = true)
public class BaseTypesEntity {
    private Integer id;
    private String name;
    private String description;
    private LocalDateTime createdAt;
}