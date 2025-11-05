package com.smartAmor.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@TableName("production_batches")
public class ProductionBatchEntity {
    // Getter和Setter方法
    /**
     * 主键ID
     */
    private Integer id;

    /**
     * 批次号
     */
    private String batchNo;

    /**
     * 生产日期
     */
    private LocalDate productionDate;

    /**
     * 设备ID外键
     */
    private Integer equipmentId;

    /**
     * 材料
     */
    private String material;

    /**
     * 工艺
     */
    private String process;

    /**
     * 质量：1-合格，0-不合格
     */
    private Integer quality;

    /**
     * 操作员ID外键
     */
    private Integer operatorId;

    /**
     * 备注
     */
    private String notes;

    /**
     * 创建时间
     */
    private LocalDateTime createdAt;

    /**
     * 更新时间
     */
    private LocalDateTime updatedAt;

    // 构造方法
    public ProductionBatchEntity() {
    }

    public ProductionBatchEntity(Integer id, String batchNo, LocalDate productionDate, Integer equipmentId,
                                 String material, String process, Integer quality, Integer operatorId,
                                 String notes, LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.id = id;
        this.batchNo = batchNo;
        this.productionDate = productionDate;
        this.equipmentId = equipmentId;
        this.material = material;
        this.process = process;
        this.quality = quality;
        this.operatorId = operatorId;
        this.notes = notes;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return STR."ProductionBatch{id=\{id}, batchNo='\{batchNo}', productionDate=\{productionDate}, equipmentId=\{equipmentId}, material='\{material}', process='\{process}', quality=\{quality}, operatorId=\{operatorId}, notes='\{notes}', createdAt=\{createdAt}, updatedAt=\{updatedAt}}";
    }
}