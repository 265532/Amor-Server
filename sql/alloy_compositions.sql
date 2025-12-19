CREATE TABLE `alloy_compositions` (
	`alloy_id` VARCHAR(255) NOT NULL COMMENT '合金ID',
	`element` VARCHAR(255) NOT NULL COMMENT '元素',
	`percentage` DECIMAL(10, 2) NOT NULL COMMENT '百分比'
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '合金成分表';