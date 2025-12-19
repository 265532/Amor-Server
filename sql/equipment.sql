CREATE TABLE `equipment` (
	`id` INT NOT NULL COMMENT '主键',
	`created_at` TIMESTAMP NULL COMMENT '创建时间',
	`equipment_code` VARCHAR(255) NOT NULL COMMENT '设备编码',
	`equipment_name` VARCHAR(255) NOT NULL COMMENT '设备名称',
	`equipment_type` VARCHAR(255) COMMENT '设备类型',
	`last_maintenance_date` DATE COMMENT '最后维护日期',
	`manufacturer` VARCHAR(255) COMMENT '制造商',
	`pressure` DECIMAL(10, 2) COMMENT '压力',
	`purchase_date` DATE COMMENT '购买日期',
	`status` TINYINT COMMENT '状态',
	`temperature` DECIMAL(10, 2) COMMENT '温度',
	`updated_at` TIMESTAMP NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '设备表';