CREATE TABLE `prompts` (
	`id` INT NOT NULL COMMENT '主键',
	`created_at` DATETIME NOT NULL COMMENT '创建时间',
	`description` VARCHAR(255) COMMENT '描述',
	`prompt` TEXT COMMENT '提示词',
	`type` VARCHAR(255) COMMENT '类型',
	`updated_at` DATETIME NOT NULL COMMENT '更新时间',
	`version` INT COMMENT '版本号'
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '提示词表';