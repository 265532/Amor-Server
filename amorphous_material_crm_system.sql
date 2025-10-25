/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80043 (8.0.43)
 Source Host           : localhost:3306
 Source Schema         : amorphous_material_crm_system

 Target Server Type    : MySQL
 Target Server Version : 80043 (8.0.43)
 File Encoding         : 65001

 Date: 25/10/2025 14:17:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alloy_compositions
-- ----------------------------
DROP TABLE IF EXISTS `alloy_compositions`;
CREATE TABLE `alloy_compositions`  (
  `alloy_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '材料ID',
  `element` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '元素符号',
  `percentage` decimal(5, 2) NOT NULL COMMENT '百分比',
  PRIMARY KEY (`alloy_id`, `element`) USING BTREE,
  INDEX `element`(`element` ASC) USING BTREE,
  CONSTRAINT `alloy_compositions_ibfk_1` FOREIGN KEY (`alloy_id`) REFERENCES `amorphous_alloys` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `alloy_compositions_ibfk_2` FOREIGN KEY (`element`) REFERENCES `elements` (`symbol`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `alloy_compositions_chk_1` CHECK (`percentage` between 0 and 100)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '材料元素组成表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alloy_compositions
-- ----------------------------
INSERT INTO `alloy_compositions` VALUES ('AMA-001', 'Al', 15.00);
INSERT INTO `alloy_compositions` VALUES ('AMA-001', 'Cu', 30.00);
INSERT INTO `alloy_compositions` VALUES ('AMA-001', 'Zr', 55.00);

-- ----------------------------
-- Table structure for amorphous_alloys
-- ----------------------------
DROP TABLE IF EXISTS `amorphous_alloys`;
CREATE TABLE `amorphous_alloys`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '材料唯一标识符',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '材料名称',
  `version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '版本信息',
  `base_type_id` int NOT NULL COMMENT '基体类型ID',
  `formula` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分子式',
  `properties` json NOT NULL COMMENT '材料性能',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `base_type_id`(`base_type_id` ASC) USING BTREE,
  CONSTRAINT `amorphous_alloys_ibfk_1` FOREIGN KEY (`base_type_id`) REFERENCES `base_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '非晶合金材料表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of amorphous_alloys
-- ----------------------------
INSERT INTO `amorphous_alloys` VALUES ('AMA-001', '锆基非晶合金', '优化版本 v3.2', 1, 'Zr55Cu30Al15', '{\"hardness\": 520, \"strength\": 1850, \"corrosion_resistance\": 22}', '2025-10-21 19:12:04', '2025-10-21 19:12:04');

-- ----------------------------
-- Table structure for base_types
-- ----------------------------
DROP TABLE IF EXISTS `base_types`;
CREATE TABLE `base_types`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '基体类型名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '详细描述',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '基体类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_types
-- ----------------------------
INSERT INTO `base_types` VALUES (1, '锆基', NULL, '2025-10-21 19:12:04');

-- ----------------------------
-- Table structure for elements
-- ----------------------------
DROP TABLE IF EXISTS `elements`;
CREATE TABLE `elements`  (
  `symbol` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '元素符号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '元素名称',
  `atomic_number` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '原子序数',
  PRIMARY KEY (`symbol`) USING BTREE,
  UNIQUE INDEX `atomic_number`(`atomic_number` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '化学元素表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of elements
-- ----------------------------
INSERT INTO `elements` VALUES ('Al', '铝', 13);
INSERT INTO `elements` VALUES ('Cu', '铜', 29);
INSERT INTO `elements` VALUES ('Zr', '锆', 40);

SET FOREIGN_KEY_CHECKS = 1;
