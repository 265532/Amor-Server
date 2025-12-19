CREATE TABLE `elements` (
	`symbol` VARCHAR(255) NOT NULL COMMENT 'symbol',
	`atomic_number` TINYINT COMMENT 'atomic_number',
	`name` VARCHAR(255) NOT NULL COMMENT 'name'
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT 'elements';