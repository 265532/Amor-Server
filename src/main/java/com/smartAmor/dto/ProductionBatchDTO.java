package com.smartAmor.dto;

import lombok.Data;

@Data
public class ProductionBatchDTO {
    private String batchNo;
    private String productionDate;
    private String equipmentId;
    private String material;
    private String process;
    private String quality;
    private String operatorId;
    private String notes;
    private String createTime;
    private String updateTime;
    private String deleteTime;
    private String isDeleted;
}
