CREATE TABLE `production_batches` (
	`id` int NOT NULL COMMENT '主键ID',
	`batch_no` varchar(255) NOT NULL COMMENT '批次编号',
	`created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`equipment_id` int NOT NULL COMMENT '设备ID',
	`material` varchar(255) NOT NULL COMMENT '材料',
	`notes` text COMMENT '备注',
	`operator_id` int NOT NULL COMMENT '操作员ID',
	`process` varchar(255) NOT NULL COMMENT '工艺',
	`production_date` date NOT NULL COMMENT '生产日期',
	`quality` tinyint NOT NULL COMMENT '质量状态',
	`updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '生产批次表';