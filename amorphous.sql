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

 Date: 27/10/2025 20:09:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
INSERT INTO `amorphous_alloys` VALUES ('AMA-003', '锆基非晶合金', '优化版本 v3.21', 1, 'Zr55Cu20Al25', '{\"hardness\": 520.0, \"strength\": 1850.0, \"corrosion_resistance\": 22.0}', '2025-10-27 09:27:07', '2025-10-27 09:27:07');
INSERT INTO `amorphous_alloys` VALUES ('AMA-004', '锆基非晶合金', '优化版本 v3.21', 1, 'Zr55Cu20Al25', '{\"hardness\": 520.0, \"strength\": 1850.0, \"corrosion_resistance\": 22.0}', '2025-10-27 13:41:39', '2025-10-27 13:41:39');
INSERT INTO `amorphous_alloys` VALUES ('AMA-005', '锆基非晶合金', '优化版本 v3.21', 1, 'Zr55Cu20Al25', '{\"hardness\": 520.0, \"strength\": 1850.0, \"corrosion_resistance\": 22.0}', '2025-10-27 15:40:41', '2025-10-27 15:40:41');

SET FOREIGN_KEY_CHECKS = 1;
