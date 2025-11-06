package com.smartAmor.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 设备信息实体类
 * 对应表：equipment
 */
@Data
@TableName("equipment")
public class EquipmentEntity {
    // Getter和Setter方法
    /**
     * 主键ID
     */
    private Integer id;

    /**
     * 设备编号
     */
    private String equipmentCode;

    /**
     * 设备名称
     */
    private String equipmentName;

    /**
     * 设备类型
     */
    private String equipmentType;

    /**
     * 设备温度
     */
    private BigDecimal temperature;

    /**
     * 设备压力
     */
    private BigDecimal pressure;

    /**
     * 设备状态：1-运行中，0-停机，2-维修中
     */
    private Integer status;

    /**
     * 制造商
     */
    private String manufacturer;

    /**
     * 购买日期
     */
    private LocalDate purchaseDate;

    /**
     * 最后维护日期
     */
    private LocalDate lastMaintenanceDate;

    /**
     * 创建时间
     */
    private LocalDateTime createdAt;

    /**
     * 更新时间
     */
    private LocalDateTime updatedAt;

    // 构造方法
    public EquipmentEntity() {
    }

    public EquipmentEntity(Integer id, String equipmentCode, String equipmentName, String equipmentType,
                     BigDecimal temperature, BigDecimal pressure, Integer status, String manufacturer,
                     LocalDate purchaseDate, LocalDate lastMaintenanceDate, LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.id = id;
        this.equipmentCode = equipmentCode;
        this.equipmentName = equipmentName;
        this.equipmentType = equipmentType;
        this.temperature = temperature;
        this.pressure = pressure;
        this.status = status;
        this.manufacturer = manufacturer;
        this.purchaseDate = purchaseDate;
        this.lastMaintenanceDate = lastMaintenanceDate;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "Equipment{" +
                "id=" + id +
                ", equipmentCode='" + equipmentCode + '\'' +
                ", equipmentName='" + equipmentName + '\'' +
                ", equipmentType='" + equipmentType + '\'' +
                ", temperature=" + temperature +
                ", pressure=" + pressure +
                ", status=" + status +
                ", manufacturer='" + manufacturer + '\'' +
                ", purchaseDate=" + purchaseDate +
                ", lastMaintenanceDate=" + lastMaintenanceDate +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}