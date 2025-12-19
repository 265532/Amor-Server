CREATE TABLE `amorphous_alloys` (
	`id` VARCHAR(255) NOT NULL COMMENT 'id',
	`base_type_id` INT NOT NULL COMMENT 'base_type_id',
	`created_at` TIMESTAMP NULL COMMENT 'created_at',
	`formula` VARCHAR(255) COMMENT 'formula',
	`name` VARCHAR(255) NOT NULL COMMENT 'name',
	`properties` JSON NOT NULL COMMENT 'properties',
	`updated_at` TIMESTAMP NULL COMMENT 'updated_at',
	`version` VARCHAR(255) COMMENT 'version'
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT 'amorphous_alloys';