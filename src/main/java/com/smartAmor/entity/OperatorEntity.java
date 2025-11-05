package com.smartAmor.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

/**
 * 操作员信息实体类
 * 对应表：operators
 */
@Data
@TableName("operators")
public class OperatorEntity {
    // Getter和Setter方法
    /**
     * 主键ID
     */
    private Integer id;

    /**
     * 操作员姓名
     */
    private String name;

    /**
     * 工号
     */
    private String employeeId;

    /**
     * 部门
     */
    private String department;

    /**
     * 职位
     */
    private String position;

    /**
     * 状态：1-在职，0-离职
     */
    private Integer status;

    /**
     * 创建时间
     */
    private LocalDateTime createdAt;

    /**
     * 更新时间
     */
    private LocalDateTime updatedAt;

    // 构造方法
    public OperatorEntity() {
    }

    public OperatorEntity(Integer id, String name, String employeeId, String department,
                          String position, Integer status, LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.id = id;
        this.name = name;
        this.employeeId = employeeId;
        this.department = department;
        this.position = position;
        this.status = status;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "Operator{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", employeeId='" + employeeId + '\'' +
                ", department='" + department + '\'' +
                ", position='" + position + '\'' +
                ", status=" + status +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}