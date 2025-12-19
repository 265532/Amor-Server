CREATE TABLE `base_types` (
	`id` INT NOT NULL COMMENT 'id',
	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'created_at',
	`description` TEXT COMMENT 'description',
	`name` VARCHAR(255) NOT NULL COMMENT 'name'
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT 'base_types';