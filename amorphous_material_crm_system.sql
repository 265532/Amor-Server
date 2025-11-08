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

 Date: 08/11/2025 11:53:49
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
INSERT INTO `amorphous_alloys` VALUES ('AMA-001', '锆基非高晶强度合金', '优化版 v3.2', 1, 'Zr₅₅Cu₃₀Al₁₅', '{\"hardness\": 520, \"strength\": 1850, \"corrosion_resistance\": 22}', '2025-10-21 19:12:04', '2025-10-28 19:13:04');
INSERT INTO `amorphous_alloys` VALUES ('AMA-002', '锆基非晶高强度合金', '工业版 v5.7', 1, 'Zr₅₅Cu₃₀Al₁₅', '{\"hardness\": 480.0, \"strength\": 1600.0, \"corrosion_resistance\": 3.0}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-003', '锆基非晶高强度合金', '优化版 v1.1', 1, 'Zr₅₂.₅Cu₁₇.₉Ni₁₄.₆Al₁₀', '{\"hardness\": 500.0, \"strength\": 1650.0, \"corrosion_resistance\": 3.5}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-004', '锆基非晶高强度合金', '工业版 v2.1', 1, 'Zr₄₄Cu₁₂Ti₁₁Ni₁₀Be₂₃', '{\"hardness\": 550.0, \"strength\": 1900.0, \"corrosion_resistance\": 2.5}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-005', '锆基非晶高强度合金', '生产版 v6.0', 1, 'Zr₅₀Cu₂₀Al₁₀Ni₁₀Ti₁₀', '{\"hardness\": 520.0, \"strength\": 1700.0, \"corrosion_resistance\": 3.2}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-006', '锆基非晶高密度合金', '工业版 v1.5', 1, 'Zr₅₀Cu₃₀Al₁₀Ag₁₀', '{\"hardness\": 470.0, \"strength\": 1580.0, \"corrosion_resistance\": 4.0}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-007', '锆基非晶高强度合金', '农业版 v4.3', 1, 'Zr₅₅Cu₂₅Al₁₀Co₁₀', '{\"hardness\": 490.0, \"strength\": 1620.0, \"corrosion_resistance\": 3.8}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-008', '锆基非晶高密度合金', '农业版 v1.3', 1, 'Zr₅₆Cu₂₈Al₁₀Y₆', '{\"hardness\": 460.0, \"strength\": 1550.0, \"corrosion_resistance\": 4.5}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-009', '锆基非晶高强度合金', '优化版 v5.4', 1, 'Zr₅₃Cu₂₇Al₁₀Nb₁₀', '{\"hardness\": 510.0, \"strength\": 1680.0, \"corrosion_resistance\": 4.2}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-010', '锆基非晶高密度合金', '生产版 v4.5', 1, 'Zr₅₃Cu₂₇Al₁₀Ta₁₀', '{\"hardness\": 530.0, \"strength\": 1700.0, \"corrosion_resistance\": 4.5}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-011', '锆基非晶耐腐蚀合金', '工业版 v5.1', 1, 'Zr₅₄Cu₂₆Al₁₀Mo₁₀', '{\"hardness\": 540.0, \"strength\": 1720.0, \"corrosion_resistance\": 3.8}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-012', '锆基非晶高强度合金', '农业版 v1.6', 1, 'Zr₅₄Cu₂₆Al₁₀W₁₀', '{\"hardness\": 560.0, \"strength\": 1750.0, \"corrosion_resistance\": 3.5}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-013', '锆基非晶高强度合金', '农业版 v2.2', 1, 'Zr₅₅Cu₂₈Al₁₀Sn₇', '{\"hardness\": 465.0, \"strength\": 1570.0, \"corrosion_resistance\": 3.3}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-014', '锆基非晶高密度合金', '农业版 v2.9', 1, 'Zr₅₅Cu₂₈Al₁₀Si₇', '{\"hardness\": 510.0, \"strength\": 1650.0, \"corrosion_resistance\": 3.7}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-015', '锆基非晶耐腐蚀合金', '农业版 v1.5', 1, 'Zr₅₀Cu₂₅Al₁₀Pd₁₅', '{\"hardness\": 495.0, \"strength\": 1620.0, \"corrosion_resistance\": 5.5}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-016', '锆基非晶高强度合金', '生产版 v1.1', 1, 'Zr₅₅Cu₂₅Al₁₀Fe₁₀', '{\"hardness\": 500.0, \"strength\": 1640.0, \"corrosion_resistance\": 3.0}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-017', '锆基非晶高密度合金', '优化版 v5.6', 1, 'Zr₅₀Cu₂₀Al₁₀Ni₁₀Ti₁₀', '{\"hardness\": 520.0, \"strength\": 1700.0, \"corrosion_resistance\": 3.2}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-018', '锆基非晶高密度合金', '生产版 v1.1', 1, 'Zr₅₂Cu₁₈Ni₁₂Al₁₀Sn₈', '{\"hardness\": 490.0, \"strength\": 1630.0, \"corrosion_resistance\": 3.5}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-019', '锆基非晶耐腐蚀合金', '优化版 v2.9', 1, 'Zr₄₈Cu₂₀Ni₁₂Al₁₀Be₁₀', '{\"hardness\": 540.0, \"strength\": 1850.0, \"corrosion_resistance\": 2.8}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-020', '锆基非晶耐腐蚀合金', '生产版 v5.7', 1, 'Zr₅₀Cu₁₈Ni₁₂Al₁₀Nb₁₀', '{\"hardness\": 515.0, \"strength\": 1680.0, \"corrosion_resistance\": 4.3}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-021', '锆基非晶高强度合金', '农业版 v3.0', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Y₉', '{\"hardness\": 475.0, \"strength\": 1580.0, \"corrosion_resistance\": 4.8}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-022', '锆基非晶高强度合金', '生产版 v3.5', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Ag₉', '{\"hardness\": 485.0, \"strength\": 1600.0, \"corrosion_resistance\": 4.2}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-023', '锆基非晶高密度合金', '农业版 v1.3', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Co₉', '{\"hardness\": 505.0, \"strength\": 1650.0, \"corrosion_resistance\": 3.9}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-024', '锆基非晶耐腐蚀合金', '工业版 v2.8', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Cr₉', '{\"hardness\": 520.0, \"strength\": 1670.0, \"corrosion_resistance\": 4.0}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-025', '锆基非晶高强度合金', '生产版 v4.1', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Mo₉', '{\"hardness\": 525.0, \"strength\": 1690.0, \"corrosion_resistance\": 4.1}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-026', '锆基非晶高强度合金', '生产版 v5.1', 1, 'Zr₅₂Cu₁₈Ni₁₂Al₁₀Fe₈', '{\"hardness\": 510.0, \"strength\": 1660.0, \"corrosion_resistance\": 3.2}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-027', '锆基非晶耐腐蚀合金', '优化版 v1.5', 1, 'Zr₅₅Cu₂₀Ti₁₀Ni₁₅', '{\"hardness\": 490.0, \"strength\": 1620.0, \"corrosion_resistance\": 2.8}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-028', '锆基非晶耐腐蚀合金', '农业版 v1.3', 1, 'Zr₄₄Cu₁₂Ti₁₁Ni₁₀Be₂₃', '{\"hardness\": 550.0, \"strength\": 1900.0, \"corrosion_resistance\": 2.5}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-029', '锆基非晶耐腐蚀合金', '农业版 v1.7', 1, 'Zr₅₀Cu₂₀Ti₁₀Ni₁₀Al₁₀', '{\"hardness\": 525.0, \"strength\": 1720.0, \"corrosion_resistance\": 3.0}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-030', '锆基非晶高强度合金', '工业版 v2.0', 1, 'Zr₅₂Cu₂₀Ti₁₀Ni₁₀Sn₈', '{\"hardness\": 480.0, \"strength\": 1600.0, \"corrosion_resistance\": 3.2}', '2025-11-04 16:06:05', '2025-11-04 16:06:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-031', '锆基非晶高密度合金', '农业版 v2.4', 1, 'Zr₅₀Cu₂₀Ti₁₀Be₂₀', '{\"hardness\": 530.0, \"strength\": 1800.0, \"corrosion_resistance\": 2.3}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-032', '锆基非晶耐腐蚀合金', '农业版 v3.7', 1, 'Zr₅₂Cu₁₈Ni₁₂Ti₁₀Sn₈', '{\"hardness\": 470.0, \"strength\": 1580.0, \"corrosion_resistance\": 3.0}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-033', '锆基非晶高强度合金', '农业版 v3.3', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Y₉', '{\"hardness\": 475.0, \"strength\": 1580.0, \"corrosion_resistance\": 4.8}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-034', '锆基非晶高密度合金', '工业版 v2.1', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Gd₉', '{\"hardness\": 480.0, \"strength\": 1590.0, \"corrosion_resistance\": 5.0}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-035', '锆基非晶高密度合金', '生产版 v5.1', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Dy₉', '{\"hardness\": 485.0, \"strength\": 1600.0, \"corrosion_resistance\": 5.0}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-036', '锆基非晶耐腐蚀合金', '优化版 v2.2', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Er₉', '{\"hardness\": 490.0, \"strength\": 1610.0, \"corrosion_resistance\": 5.0}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-037', '锆基非晶耐腐蚀合金', '优化版 v2.6', 1, 'Zr₄₀Cu₁₈Ni₁₂Al₁₀Hf₂₀', '{\"hardness\": 545.0, \"strength\": 1750.0, \"corrosion_resistance\": 3.5}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-038', '锆基非晶耐腐蚀合金', '优化版 v4.8', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Sc₉', '{\"hardness\": 465.0, \"strength\": 1560.0, \"corrosion_resistance\": 4.0}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-039', '锆基非晶高密度合金', '优化版 v4.6', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀V₉', '{\"hardness\": 530.0, \"strength\": 1690.0, \"corrosion_resistance\": 3.3}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-040', '锆基非晶高强度合金', '优化版 v2.1', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Cr₉', '{\"hardness\": 520.0, \"strength\": 1670.0, \"corrosion_resistance\": 4.0}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-041', '锆基非晶高密度合金', '工业版 v2.1', 1, 'Zr₅₂Cu₁₈Ni₁₂Al₁₀Mn₈', '{\"hardness\": 495.0, \"strength\": 1630.0, \"corrosion_resistance\": 2.8}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-042', '锆基非晶耐腐蚀合金', '农业版 v3.6', 1, 'Zr₅₂Cu₁₈Ni₁₂Al₁₀Fe₈', '{\"hardness\": 510.0, \"strength\": 1660.0, \"corrosion_resistance\": 3.2}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-043', '锆基非晶高强度合金', '优化版 v2.7', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Co₉', '{\"hardness\": 505.0, \"strength\": 1650.0, \"corrosion_resistance\": 3.9}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-044', '锆基非晶高强度合金', '农业版 v2.0', 1, 'Zr₅₂Cu₁₈Ni₁₂Al₁₀Ga₈', '{\"hardness\": 475.0, \"strength\": 1590.0, \"corrosion_resistance\": 3.8}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-045', '锆基非晶耐腐蚀合金', '工业版 v4.8', 1, 'Zr₅₂Cu₁₈Ni₁₂Al₁₀Ge₈', '{\"hardness\": 505.0, \"strength\": 1640.0, \"corrosion_resistance\": 4.0}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-046', '锆基非晶高密度合金', '优化版 v2.8', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Pd₁₂', '{\"hardness\": 500.0, \"strength\": 1630.0, \"corrosion_resistance\": 6.0}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-047', '锆基非晶耐腐蚀合金', '优化版 v1.8', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Pt₁₂', '{\"hardness\": 510.0, \"strength\": 1650.0, \"corrosion_resistance\": 6.5}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-048', '锆基非晶高密度合金', '优化版 v5.7', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Au₁₂', '{\"hardness\": 485.0, \"strength\": 1580.0, \"corrosion_resistance\": 5.8}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-049', '锆基非晶高强度合金', '工业版 v5.2', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Ag₉', '{\"hardness\": 485.0, \"strength\": 1600.0, \"corrosion_resistance\": 4.2}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-050', '锆基非晶耐腐蚀合金', '生产版 v4.1', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Ta₉', '{\"hardness\": 525.0, \"strength\": 1680.0, \"corrosion_resistance\": 4.6}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-051', '锆基非晶高密度合金', '农业版 v2.6', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Mo₉', '{\"hardness\": 525.0, \"strength\": 1690.0, \"corrosion_resistance\": 4.1}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-052', '锆基非晶高强度合金', '农业版 v1.9', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀W₉', '{\"hardness\": 540.0, \"strength\": 1710.0, \"corrosion_resistance\": 3.8}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-053', '锆基非晶高密度合金', '农业版 v4.4', 1, 'Zr₅₀Cu₁₈Ni₁₂Al₁₀Nb₁₀', '{\"hardness\": 515.0, \"strength\": 1680.0, \"corrosion_resistance\": 4.3}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-054', '锆基非晶高密度合金', '工业版 v3.0', 1, 'Zr₄₅Cu₁₈Ni₁₂Al₁₀Ti₅Be₁₀', '{\"hardness\": 560.0, \"strength\": 1880.0, \"corrosion_resistance\": 2.7}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-055', '锆基非晶高密度合金', '工业版 v1.9', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Ti₅Nb₇', '{\"hardness\": 535.0, \"strength\": 1730.0, \"corrosion_resistance\": 4.0}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-056', '锆基非晶高强度合金', '工业版 v1.1', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Ti₅Ta₇', '{\"hardness\": 540.0, \"strength\": 1740.0, \"corrosion_resistance\": 4.3}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-057', '锆基非晶高密度合金', '生产版 v5.3', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Ti₅V₇', '{\"hardness\": 530.0, \"strength\": 1720.0, \"corrosion_resistance\": 3.5}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-058', '锆基非晶高强度合金', '优化版 v3.0', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Ti₅Cr₇', '{\"hardness\": 525.0, \"strength\": 1700.0, \"corrosion_resistance\": 3.8}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-059', '锆基非晶耐腐蚀合金', '生产版 v3.2', 1, 'Zr₅₆Cu₃₀Al₁₄', '{\"hardness\": 485.0, \"strength\": 1620.0, \"corrosion_resistance\": 3.1}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-060', '锆基非晶耐腐蚀合金', '优化版 v1.6', 1, 'Zr₅₅Cu₃₀Al₁₅', '{\"hardness\": 480.0, \"strength\": 1600.0, \"corrosion_resistance\": 3.0}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-061', '锆基非晶高强度合金', '工业版 v4.4', 1, 'Zr₅₂.₅Cu₂₅Al₂₂.₅', '{\"hardness\": 490.0, \"strength\": 1580.0, \"corrosion_resistance\": 3.4}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-062', '锆基非晶高强度合金', '生产版 v1.6', 1, 'Zr₅₀Cu₄₀Al₁₀', '{\"hardness\": 450.0, \"strength\": 1550.0, \"corrosion_resistance\": 2.5}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-063', '锆基非晶耐腐蚀合金', '生产版 v4.3', 1, 'Zr₅₀Cu₃₅Al₁₅', '{\"hardness\": 470.0, \"strength\": 1590.0, \"corrosion_resistance\": 2.8}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-064', '锆基非晶高强度合金', '农业版 v1.3', 1, 'Zr₅₀Cu₃₀Al₂₀', '{\"hardness\": 500.0, \"strength\": 1630.0, \"corrosion_resistance\": 3.2}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-065', '锆基非晶高强度合金', '农业版 v1.1', 1, 'Zr₄₈Cu₃₆Al₁₆', '{\"hardness\": 475.0, \"strength\": 1610.0, \"corrosion_resistance\": 2.7}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-066', '锆基非晶高强度合金', '生产版 v1.7', 1, 'Zr₄₇Cu₃₈Al₁₅', '{\"hardness\": 460.0, \"strength\": 1560.0, \"corrosion_resistance\": 2.5}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-067', '锆基非晶耐腐蚀合金', '农业版 v5.6', 1, 'Zr₄₆Cu₃₈Al₁₆', '{\"hardness\": 455.0, \"strength\": 1540.0, \"corrosion_resistance\": 2.4}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-068', '锆基非晶耐腐蚀合金', '工业版 v1.9', 1, 'Zr₄₅Cu₃₅Al₂₀', '{\"hardness\": 495.0, \"strength\": 1600.0, \"corrosion_resistance\": 3.1}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-069', '锆基非晶耐腐蚀合金', '优化版 v4.0', 1, 'Zr₄₅Cu₄₀Al₁₅', '{\"hardness\": 445.0, \"strength\": 1520.0, \"corrosion_resistance\": 2.3}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-070', '锆基非晶高强度合金', '优化版 v3.9', 1, 'Zr₄₄Cu₃₆Al₂₀', '{\"hardness\": 485.0, \"strength\": 1570.0, \"corrosion_resistance\": 3.0}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-071', '锆基非晶高强度合金', '生产版 v3.0', 1, 'Zr₄₂Cu₃₈Al₂₀', '{\"hardness\": 465.0, \"strength\": 1490.0, \"corrosion_resistance\": 2.8}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-072', '锆基非晶耐腐蚀合金', '优化版 v3.2', 1, 'Zr₆₀Cu₂₅Al₁₅', '{\"hardness\": 470.0, \"strength\": 1590.0, \"corrosion_resistance\": 3.5}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-073', '锆基非晶高密度合金', '农业版 v1.4', 1, 'Zr₆₅Cu₂₀Al₁₅', '{\"hardness\": 440.0, \"strength\": 1510.0, \"corrosion_resistance\": 4.0}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-074', '锆基非晶耐腐蚀合金', '优化版 v4.5', 1, 'Zr₆₀Cu₃₀Al₁₀', '{\"hardness\": 435.0, \"strength\": 1530.0, \"corrosion_resistance\": 3.0}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-075', '锆基非晶高密度合金', '农业版 v2.2', 1, 'Zr₅₈Cu₃₂Al₁₀', '{\"hardness\": 445.0, \"strength\": 1550.0, \"corrosion_resistance\": 2.8}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-076', '锆基非晶高密度合金', '优化版 v2.1', 1, 'Zr₅₇Cu₃₃Al₁₀', '{\"hardness\": 450.0, \"strength\": 1560.0, \"corrosion_resistance\": 2.7}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-077', '锆基非晶高密度合金', '生产版 v5.3', 1, 'Zr₅₆Cu₃₄Al₁₀', '{\"hardness\": 455.0, \"strength\": 1570.0, \"corrosion_resistance\": 2.6}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-078', '锆基非晶高密度合金', '农业版 v2.6', 1, 'Zr₅₅Cu₃₅Al₁₀', '{\"hardness\": 460.0, \"strength\": 1580.0, \"corrosion_resistance\": 2.5}', '2025-11-04 16:06:06', '2025-11-04 16:06:06');
INSERT INTO `amorphous_alloys` VALUES ('AMA-079', '铁基非晶高密度合金', '工业版 v1.3', 2, 'Fe₇₈Si₉B₁₃', '{\"hardness\": 980.0, \"strength\": 3000.0, \"corrosion_resistance\": 1.5}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-080', '铁基非晶高密度合金', '工业版 v3.7', 2, 'Fe₈₀P₁₃C₇', '{\"hardness\": 750.0, \"strength\": 2700.0, \"corrosion_resistance\": 1.2}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-081', '铁基非晶高密度合金', '优化版 v4.8', 2, 'Fe₇₂B₂₀Si₅Nb₃', '{\"hardness\": 1100.0, \"strength\": 3500.0, \"corrosion_resistance\": 2.0}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-082', '铁基非晶高密度合金', '农业版 v1.6', 2, 'Fe₇₉B₁₂Si₅P₄', '{\"hardness\": 900.0, \"strength\": 2900.0, \"corrosion_resistance\": 1.3}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-083', '铁基非晶耐腐蚀合金', '农业版 v2.0', 2, 'Fe₇₈B₁₂Si₇C₃', '{\"hardness\": 850.0, \"strength\": 2800.0, \"corrosion_resistance\": 1.2}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-084', '铁基非晶高密度合金', '农业版 v5.6', 2, 'Fe₆₇Cr₁₀B₁₅Si₈', '{\"hardness\": 1200.0, \"strength\": 3200.0, \"corrosion_resistance\": 15.0}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-085', '铁基非晶耐腐蚀合金', '农业版 v5.7', 2, 'Fe₇₆Mo₂B₁₅Si₇', '{\"hardness\": 1050.0, \"strength\": 3300.0, \"corrosion_resistance\": 3.0}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-086', '铁基非晶高密度合金', '生产版 v5.8', 2, 'Fe₇₀Ni₁₀B₁₅Si₅', '{\"hardness\": 800.0, \"strength\": 2800.0, \"corrosion_resistance\": 2.0}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-087', '铁基非晶高强度合金', '生产版 v4.9', 2, 'Fe₆₀Co₂₀B₁₅Si₅', '{\"hardness\": 820.0, \"strength\": 2800.0, \"corrosion_resistance\": 2.2}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-088', '铁基非晶耐腐蚀合金', '工业版 v5.8', 2, 'Fe₇₆B₁₅Si₆Al₃', '{\"hardness\": 830.0, \"strength\": 2700.0, \"corrosion_resistance\": 1.8}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-089', '铁基非晶高强度合金', '优化版 v4.7', 2, 'Fe₇₆B₁₅Si₆Ga₃', '{\"hardness\": 840.0, \"strength\": 2750.0, \"corrosion_resistance\": 2.0}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-090', '铁基非晶耐腐蚀合金', '农业版 v1.1', 2, 'Fe₇₆B₁₅Si₆Ge₃', '{\"hardness\": 880.0, \"strength\": 2850.0, \"corrosion_resistance\": 2.2}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-091', '铁基非晶高密度合金', '生产版 v1.5', 2, 'Fe₇₁B₁₅Si₅Nb₄Mo₅', '{\"hardness\": 1150.0, \"strength\": 3600.0, \"corrosion_resistance\": 3.5}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-092', '铁基非晶高密度合金', '优化版 v5.5', 2, 'Fe₆₈Cr₅B₁₅Si₅Nb₇', '{\"hardness\": 1250.0, \"strength\": 3800.0, \"corrosion_resistance\": 20.0}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-093', '铁基非晶耐腐蚀合金', '工业版 v2.5', 2, 'Fe₇₀B₁₅Si₅Nb₅W₅', '{\"hardness\": 1180.0, \"strength\": 3700.0, \"corrosion_resistance\": 4.0}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-094', '铁基非晶耐腐蚀合金', '生产版 v4.2', 2, 'Fe₇₁B₁₅Si₅Nb₄Ta₅', '{\"hardness\": 1160.0, \"strength\": 3650.0, \"corrosion_resistance\": 4.5}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-095', '铁基非晶高强度合金', '优化版 v5.7', 2, 'Fe₇₂.₅B₁₅Si₅Nb₂.₅Y₅', '{\"hardness\": 1050.0, \"strength\": 3400.0, \"corrosion_resistance\": 2.5}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-096', '铁基非晶高强度合金', '生产版 v4.0', 2, 'Fe₇₁B₁₅Si₅Nb₄Zr₅', '{\"hardness\": 1120.0, \"strength\": 3550.0, \"corrosion_resistance\": 3.0}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-097', '铁基非晶耐腐蚀合金', '生产版 v3.8', 2, 'Fe₇₁B₁₅Si₅Nb₄Hf₅', '{\"hardness\": 1130.0, \"strength\": 3580.0, \"corrosion_resistance\": 3.2}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-098', '铁基非晶高强度合金', '工业版 v4.6', 2, 'Fe₇₁B₁₅Si₅Nb₄Ti₅', '{\"hardness\": 1080.0, \"strength\": 3450.0, \"corrosion_resistance\": 2.8}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-099', '铁基非晶高强度合金', '农业版 v2.7', 2, 'Fe₆₅Cr₁₀Mo₅B₁₅Si₅', '{\"hardness\": 1220.0, \"strength\": 3500.0, \"corrosion_resistance\": 18.0}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-100', '铁基非晶耐腐蚀合金', '优化版 v1.1', 2, 'Fe₆₅Cr₁₀W₅B₁₅Si₅', '{\"hardness\": 1240.0, \"strength\": 3550.0, \"corrosion_resistance\": 19.0}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-101', '铁基非晶耐腐蚀合金', '农业版 v4.4', 2, 'Fe₅₅Cr₁₀Co₁₀B₁₅Si₁₀', '{\"hardness\": 1150.0, \"strength\": 3200.0, \"corrosion_resistance\": 16.0}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-102', '铁基非晶高强度合金', '工业版 v5.8', 2, 'Fe₅₅Cr₁₀Ni₁₀B₁₅Si₁₀', '{\"hardness\": 1100.0, \"strength\": 3100.0, \"corrosion_resistance\": 15.0}', '2025-11-04 16:06:53', '2025-11-04 16:06:53');
INSERT INTO `amorphous_alloys` VALUES ('AMA-103', '铁基非晶耐腐蚀合金', '生产版 v2.2', 2, 'Fe₆₂Cr₁₀Mn₃B₁₅Si₁₀', '{\"hardness\": 1050.0, \"strength\": 3000.0, \"corrosion_resistance\": 12.0}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-104', '铁基非晶耐腐蚀合金', '工业版 v3.0', 2, 'Fe₇₇B₁₂Si₅P₃C₃', '{\"hardness\": 820.0, \"strength\": 2750.0, \"corrosion_resistance\": 1.1}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-105', '铁基非晶耐腐蚀合金', '优化版 v2.6', 2, 'Fe₇₆B₁₂Si₅P₃Al₄', '{\"hardness\": 800.0, \"strength\": 2650.0, \"corrosion_resistance\": 1.5}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-106', '铁基非晶高强度合金', '工业版 v5.7', 2, 'Fe₈₀B₁₀P₇C₃', '{\"hardness\": 780.0, \"strength\": 2600.0, \"corrosion_resistance\": 1.0}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-107', '铁基非晶耐腐蚀合金', '生产版 v5.2', 2, 'Fe₇₉B₁₂Si₅P₄', '{\"hardness\": 900.0, \"strength\": 2900.0, \"corrosion_resistance\": 1.3}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-108', '铁基非晶高强度合金', '工业版 v5.2', 2, 'Fe₇₀Cr₁₀B₁₀P₁₀', '{\"hardness\": 950.0, \"strength\": 3000.0, \"corrosion_resistance\": 12.0}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-109', '铁基非晶高密度合金', '农业版 v3.8', 2, 'Fe₇₈Mo₂B₁₀P₁₀', '{\"hardness\": 1000.0, \"strength\": 3100.0, \"corrosion_resistance\": 2.5}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-110', '铁基非晶高强度合金', '工业版 v1.2', 2, 'Fe₇₆Nb₄B₁₀P₁₀', '{\"hardness\": 1020.0, \"strength\": 3200.0, \"corrosion_resistance\": 2.2}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-111', '铁基非晶高密度合金', '农业版 v4.9', 2, 'Fe₇₈Ga₂B₁₀P₁₀', '{\"hardness\": 810.0, \"strength\": 2650.0, \"corrosion_resistance\": 1.8}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-112', '铁基非晶高强度合金', '农业版 v3.5', 2, 'Fe₇₈Ge₂B₁₀P₁₀', '{\"hardness\": 830.0, \"strength\": 2700.0, \"corrosion_resistance\": 2.0}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-113', '铁基非晶高强度合金', '生产版 v3.4', 2, 'Fe₇₈Al₂B₁₀P₁₀', '{\"hardness\": 770.0, \"strength\": 2550.0, \"corrosion_resistance\": 1.6}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-114', '铁基非晶耐腐蚀合金', '优化版 v5.5', 2, 'Fe₆₅Cr₁₂Mo₅B₁₂C₆', '{\"hardness\": 1300.0, \"strength\": 2800.0, \"corrosion_resistance\": 25.0}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-115', '铁基非晶耐腐蚀合金', '优化版 v2.3', 2, 'Fe₆₂Cr₁₂Mo₅P₁₀C₅B₆', '{\"hardness\": 1100.0, \"strength\": 2700.0, \"corrosion_resistance\": 20.0}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-116', '铁基非晶高密度合金', '优化版 v4.1', 2, 'Fe₆₁Cr₁₂Mo₅P₁₀Si₅B₇', '{\"hardness\": 1150.0, \"strength\": 2900.0, \"corrosion_resistance\": 22.0}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-117', '铁基非晶耐腐蚀合金', '生产版 v4.1', 2, 'Fe₄₀Ni₄₀B₁₂Si₈', '{\"hardness\": 750.0, \"strength\": 2000.0, \"corrosion_resistance\": 5.0}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-118', '铁基非晶耐腐蚀合金', '工业版 v4.4', 2, 'Fe₃₆Ni₃₆B₁₅Si₅Nb₈', '{\"hardness\": 950.0, \"strength\": 2500.0, \"corrosion_resistance\": 6.0}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-119', '铁基非晶耐腐蚀合金', '农业版 v5.1', 2, 'Fe₄₀Co₄₀B₁₂Si₈', '{\"hardness\": 800.0, \"strength\": 2200.0, \"corrosion_resistance\": 5.5}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-120', '铁基非晶高强度合金', '工业版 v4.4', 2, 'Fe₃₆Co₃₆B₁₅Si₅Nb₈', '{\"hardness\": 1000.0, \"strength\": 2700.0, \"corrosion_resistance\": 6.5}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-121', '铁基非晶高密度合金', '生产版 v4.7', 2, 'Fe₃₆Co₃₆B₁₅Si₅Zr₈', '{\"hardness\": 980.0, \"strength\": 2600.0, \"corrosion_resistance\": 4.0}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-122', '铁基非晶耐腐蚀合金', '农业版 v4.1', 2, 'Fe₂₅Ni₂₅Co₂₅B₁₅Si₁₀', '{\"hardness\": 850.0, \"strength\": 2300.0, \"corrosion_resistance\": 6.0}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-123', '铁基非晶高强度合金', '优化版 v3.5', 2, 'Fe₂₀Ni₂₀Co₂₀B₂₀Si₁₀Nb₁₀', '{\"hardness\": 1100.0, \"strength\": 3000.0, \"corrosion_resistance\": 8.0}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-124', '铁基非晶高强度合金', '生产版 v3.3', 2, 'Fe₂₀Ni₂₀Co₂₀B₂₀Si₁₀Zr₁₀', '{\"hardness\": 1050.0, \"strength\": 2900.0, \"corrosion_resistance\": 5.0}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-125', '铁基非晶耐腐蚀合金', '优化版 v1.1', 2, 'Fe₅₀Mn₁₀Cr₁₅Mo₅B₁₀C₁₀', '{\"hardness\": 1000.0, \"strength\": 2500.0, \"corrosion_resistance\": 8.0}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-126', '铁基非晶高强度合金', '工业版 v4.5', 2, 'Fe₄₈Mn₁₀Cr₁₅Mo₅P₁₀C₆B₆', '{\"hardness\": 950.0, \"strength\": 2400.0, \"corrosion_resistance\": 7.0}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-127', '铁基非晶高强度合金', '农业版 v5.0', 2, 'Fe₇₅Ga₅P₁₀C₅B₅', '{\"hardness\": 600.0, \"strength\": 1800.0, \"corrosion_resistance\": 1.5}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-128', '铁基非晶高密度合金', '优化版 v2.8', 2, 'Fe₇₃Ga₅P₁₀Si₅B₇', '{\"hardness\": 620.0, \"strength\": 1850.0, \"corrosion_resistance\": 1.7}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-129', '铁基非晶高强度合金', '优化版 v3.1', 2, 'Fe₈₀Nd₁₀B₁₀', '{\"hardness\": 500.0, \"strength\": 1500.0, \"corrosion_resistance\": 0.5}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-130', '铁基非晶耐腐蚀合金', '生产版 v2.0', 2, 'Fe₈₀Dy₁₀B₁₀', '{\"hardness\": 520.0, \"strength\": 1550.0, \"corrosion_resistance\": 0.5}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-131', '铁基非晶高强度合金', '生产版 v3.2', 2, 'Fe₈₀Pr₁₀B₁₀', '{\"hardness\": 480.0, \"strength\": 1480.0, \"corrosion_resistance\": 0.5}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-132', '铁基非晶高强度合金', '工业版 v4.6', 2, 'Fe₈₀Tb₁₀B₁₀', '{\"hardness\": 510.0, \"strength\": 1530.0, \"corrosion_resistance\": 0.5}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-133', '铁基非晶高强度合金', '农业版 v5.8', 2, 'Fe₈₅Zr₅B₁₀', '{\"hardness\": 1050.0, \"strength\": 3200.0, \"corrosion_resistance\": 2.0}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-134', '铁基非晶高强度合金', '农业版 v1.9', 2, 'Fe₈₅Hf₅B₁₀', '{\"hardness\": 1080.0, \"strength\": 3250.0, \"corrosion_resistance\": 2.2}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-135', '铁基非晶耐腐蚀合金', '优化版 v2.0', 2, 'Fe₈₃Nb₇B₁₀', '{\"hardness\": 1120.0, \"strength\": 3350.0, \"corrosion_resistance\": 2.5}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-136', '铁基非晶高密度合金', '生产版 v5.4', 2, 'Fe₈₅Ti₅B₁₀', '{\"hardness\": 1000.0, \"strength\": 3100.0, \"corrosion_resistance\": 1.8}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-137', '铁基非晶耐腐蚀合金', '农业版 v3.1', 2, 'Fe₈₅V₅B₁₀', '{\"hardness\": 980.0, \"strength\": 3050.0, \"corrosion_resistance\": 1.7}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-138', '铁基非晶耐腐蚀合金', '工业版 v1.7', 2, 'Fe₇₅Cr₁₅B₁₀', '{\"hardness\": 950.0, \"strength\": 2800.0, \"corrosion_resistance\": 10.0}', '2025-11-04 16:06:54', '2025-11-04 16:06:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-139', '铜基非晶高密度合金', '优化版 v3.7', 3, 'Cu₅₀Zr₄₃Al₇', '{\"hardness\": 550.0, \"strength\": 2050.0, \"corrosion_resistance\": 2.0}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-140', '铜基非晶耐腐蚀合金', '生产版 v3.0', 3, 'Cu₅₀Zr₄₀Ti₁₀', '{\"hardness\": 570.0, \"strength\": 2100.0, \"corrosion_resistance\": 1.8}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-141', '铜基非晶高密度合金', '工业版 v1.1', 3, 'Cu₅₀Zr₃₅Hf₁₅', '{\"hardness\": 590.0, \"strength\": 2150.0, \"corrosion_resistance\": 2.2}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-142', '铜基非晶高强度合金', '优化版 v5.7', 3, 'Cu₄₈Zr₄₂Al₇Ag₃', '{\"hardness\": 540.0, \"strength\": 2000.0, \"corrosion_resistance\": 2.5}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-143', '铜基非晶高密度合金', '工业版 v4.7', 3, 'Cu₄₈Zr₄₂Al₇Y₃', '{\"hardness\": 530.0, \"strength\": 1950.0, \"corrosion_resistance\": 2.8}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-144', '铜基非晶高密度合金', '工业版 v3.8', 3, 'Cu₄₆Zr₄₂Al₇Ti₅', '{\"hardness\": 580.0, \"strength\": 2150.0, \"corrosion_resistance\": 2.0}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-145', '铜基非晶高强度合金', '农业版 v3.6', 3, 'Cu₄₆Zr₄₂Al₇Ni₅', '{\"hardness\": 560.0, \"strength\": 2080.0, \"corrosion_resistance\": 2.3}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-146', '铜基非晶高密度合金', '生产版 v5.7', 3, 'Cu₄₆Zr₄₂Al₇Co₅', '{\"hardness\": 555.0, \"strength\": 2060.0, \"corrosion_resistance\": 2.4}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-147', '铜基非晶高密度合金', '农业版 v5.5', 3, 'Cu₄₆Zr₄₂Al₇Fe₅', '{\"hardness\": 575.0, \"strength\": 2120.0, \"corrosion_resistance\": 1.9}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-148', '铜基非晶高强度合金', '生产版 v3.5', 3, 'Cu₄₆Zr₄₂Al₇Nb₅', '{\"hardness\": 600.0, \"strength\": 2200.0, \"corrosion_resistance\": 2.6}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-149', '铜基非晶耐腐蚀合金', '生产版 v1.3', 3, 'Cu₄₆Zr₄₂Al₇Ta₅', '{\"hardness\": 610.0, \"strength\": 2220.0, \"corrosion_resistance\": 2.7}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-150', '铜基非晶高强度合金', '工业版 v3.8', 3, 'Cu₄₆Zr₄₀Ti₇Ni₇', '{\"hardness\": 570.0, \"strength\": 2120.0, \"corrosion_resistance\": 2.1}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-151', '铜基非晶高强度合金', '优化版 v5.2', 3, 'Cu₄₈Zr₄₀Ti₁₀Sn₂', '{\"hardness\": 545.0, \"strength\": 2050.0, \"corrosion_resistance\": 2.0}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-152', '铜基非晶耐腐蚀合金', '工业版 v4.1', 3, 'Cu₄₆Zr₃₆Ti₁₀Be₈', '{\"hardness\": 620.0, \"strength\": 2300.0, \"corrosion_resistance\": 1.5}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-153', '铜基非晶高密度合金', '优化版 v1.8', 3, 'Cu₄₆Zr₄₀Ti₇Nb₇', '{\"hardness\": 590.0, \"strength\": 2180.0, \"corrosion_resistance\": 2.4}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-154', '铜基非晶高密度合金', '生产版 v5.6', 3, 'Cu₄₈Zr₄₀Ti₁₀Si₂', '{\"hardness\": 560.0, \"strength\": 2080.0, \"corrosion_resistance\": 1.9}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-155', '铜基非晶高密度合金', '工业版 v5.7', 3, 'Cu₄₆Zr₃₅Hf₁₀Ti₉', '{\"hardness\": 600.0, \"strength\": 2200.0, \"corrosion_resistance\": 2.3}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-156', '铜基非晶高强度合金', '农业版 v1.7', 3, 'Cu₄₈Zr₃₅Hf₁₀Al₇', '{\"hardness\": 590.0, \"strength\": 2180.0, \"corrosion_resistance\": 2.4}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-157', '铜基非晶高强度合金', '生产版 v5.1', 3, 'Cu₅₀Hf₄₂Al₈', '{\"hardness\": 600.0, \"strength\": 2200.0, \"corrosion_resistance\": 2.5}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-158', '铜基非晶耐腐蚀合金', '生产版 v5.1', 3, 'Cu₅₀Hf₃₅Ti₁₅', '{\"hardness\": 610.0, \"strength\": 2250.0, \"corrosion_resistance\": 2.2}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-159', '铜基非晶高强度合金', '工业版 v3.9', 3, 'Cu₄₆Ti₁₂Zr₁₂Ni₁₃Sn₁₁', '{\"hardness\": 520.0, \"strength\": 1950.0, \"corrosion_resistance\": 2.2}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-160', '铜基非晶高密度合金', '生产版 v3.1', 3, 'Cu₄₈Ti₁₂Zr₁₂Ni₁₃Si₁₅', '{\"hardness\": 510.0, \"strength\": 1900.0, \"corrosion_resistance\": 2.0}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-161', '铜基非晶耐腐蚀合金', '生产版 v4.1', 3, 'Cu₄₂Ti₁₂Zr₁₂Ni₁₂Be₂₂', '{\"hardness\": 650.0, \"strength\": 2350.0, \"corrosion_resistance\": 1.6}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-162', '铜基非晶高密度合金', '优化版 v2.8', 3, 'Cu₃₀Ni₁₅Zr₃₀Ti₁₀Al₅', '{\"hardness\": 540.0, \"strength\": 2000.0, \"corrosion_resistance\": 2.8}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-163', '铜基非晶耐腐蚀合金', '生产版 v4.6', 3, 'Cu₃₀Ni₁₅Zr₃₀Ti₁₀Sn₅', '{\"hardness\": 530.0, \"strength\": 1950.0, \"corrosion_resistance\": 2.5}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-164', '铜基非晶高强度合金', '农业版 v2.8', 3, 'Cu₃₀Ni₁₅Zr₃₀Ti₁₀Nb₅', '{\"hardness\": 570.0, \"strength\": 2100.0, \"corrosion_resistance\": 3.0}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-165', '铜基非晶高强度合金', '生产版 v2.0', 3, 'Cu₄₀Al₁₀Ni₂₀Zr₃₀', '{\"hardness\": 500.0, \"strength\": 1800.0, \"corrosion_resistance\": 2.5}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-166', '铜基非晶耐腐蚀合金', '农业版 v2.4', 3, 'Cu₄₀Al₁₀Fe₂₀Zr₃₀', '{\"hardness\": 520.0, \"strength\": 1850.0, \"corrosion_resistance\": 1.8}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-167', '铜基非晶高密度合金', '工业版 v1.1', 3, 'Cu₄₀Al₁₀Co₂₀Zr₃₀', '{\"hardness\": 510.0, \"strength\": 1820.0, \"corrosion_resistance\": 2.0}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-168', '铜基非晶高密度合金', '生产版 v2.4', 3, 'Cu₄₀Al₁₀Y₁₀Zr₄₀', '{\"hardness\": 480.0, \"strength\": 1700.0, \"corrosion_resistance\": 3.0}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-169', '铜基非晶高密度合金', '优化版 v1.3', 3, 'Cu₄₀Al₁₀Gd₁₀Zr₄₀', '{\"hardness\": 490.0, \"strength\": 1720.0, \"corrosion_resistance\": 3.2}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-170', '铜基非晶高强度合金', '工业版 v5.9', 3, 'Cu₄₀Al₁₀Dy₁₀Zr₄₀', '{\"hardness\": 495.0, \"strength\": 1730.0, \"corrosion_resistance\": 3.2}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-171', '铜基非晶耐腐蚀合金', '工业版 v4.0', 3, 'Cu₄₀Al₁₀Er₁₀Zr₄₀', '{\"hardness\": 500.0, \"strength\": 1750.0, \"corrosion_resistance\": 3.3}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-172', '铜基非晶高密度合金', '农业版 v4.5', 3, 'Cu₄₀Al₁₀Nb₁₀Zr₄₀', '{\"hardness\": 550.0, \"strength\": 1900.0, \"corrosion_resistance\": 2.8}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-173', '铜基非晶高强度合金', '生产版 v2.4', 3, 'Cu₄₀Al₁₀Ta₁₀Zr₄₀', '{\"hardness\": 560.0, \"strength\": 1920.0, \"corrosion_resistance\": 2.9}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-174', '铜基非晶耐腐蚀合金', '农业版 v3.7', 3, 'Cu₄₀Al₁₀Mo₁₀Zr₄₀', '{\"hardness\": 570.0, \"strength\": 1950.0, \"corrosion_resistance\": 2.5}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-175', '铜基非晶高密度合金', '农业版 v2.5', 3, 'Cu₄₀Al₁₀W₁₀Zr₄₀', '{\"hardness\": 580.0, \"strength\": 1980.0, \"corrosion_resistance\": 2.4}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-176', '铜基非晶耐腐蚀合金', '工业版 v4.2', 3, 'Cu₄₀Al₁₀Cr₁₀Zr₄₀', '{\"hardness\": 540.0, \"strength\": 1880.0, \"corrosion_resistance\": 3.5}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-177', '铜基非晶耐腐蚀合金', '工业版 v1.5', 3, 'Cu₄₀Al₁₀Mn₁₀Zr₄₀', '{\"hardness\": 510.0, \"strength\": 1750.0, \"corrosion_resistance\": 1.5}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-178', '铜基非晶耐腐蚀合金', '农业版 v1.7', 3, 'Cu₄₀Al₁₀V₁₀Zr₄₀', '{\"hardness\": 530.0, \"strength\": 1850.0, \"corrosion_resistance\": 1.8}', '2025-11-04 16:07:28', '2025-11-04 16:07:28');
INSERT INTO `amorphous_alloys` VALUES ('AMA-179', '镁基非晶高强度合金', '农业版 v4.8', 4, 'Mg₆₅Cu₂₅Y₁₀', '{\"hardness\": 250.0, \"strength\": 800.0, \"corrosion_resistance\": 1.5}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-180', '镁基非晶高强度合金', '农业版 v5.5', 4, 'Mg₆₅Cu₂₅Gd₁₀', '{\"hardness\": 260.0, \"strength\": 820.0, \"corrosion_resistance\": 1.6}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-181', '镁基非晶耐腐蚀合金', '优化版 v3.1', 4, 'Mg₆₅Cu₂₅Dy₁₀', '{\"hardness\": 265.0, \"strength\": 830.0, \"corrosion_resistance\": 1.6}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-182', '镁基非晶高密度合金', '生产版 v2.2', 4, 'Mg₇₀Cu₂₀Ni₁₀', '{\"hardness\": 230.0, \"strength\": 750.0, \"corrosion_resistance\": 1.0}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-183', '镁基非晶耐腐蚀合金', '农业版 v3.2', 4, 'Mg₆₅Cu₂₀Ag₁₅', '{\"hardness\": 240.0, \"strength\": 780.0, \"corrosion_resistance\": 1.8}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-184', '镁基非晶耐腐蚀合金', '生产版 v5.7', 4, 'Mg₆₀Cu₂₀Y₁₀Zn₁₀', '{\"hardness\": 280.0, \"strength\": 850.0, \"corrosion_resistance\": 1.7}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-185', '镁基非晶高密度合金', '生产版 v1.6', 4, 'Mg₆₀Cu₂₀Gd₁₀Zn₁₀', '{\"hardness\": 290.0, \"strength\": 870.0, \"corrosion_resistance\": 1.8}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-186', '镁基非晶高强度合金', '生产版 v1.8', 4, 'Mg₆₀Cu₂₀Dy₁₀Zn₁₀', '{\"hardness\": 295.0, \"strength\": 880.0, \"corrosion_resistance\": 1.8}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-187', '镁基非晶耐腐蚀合金', '农业版 v4.5', 4, 'Mg₆₀Cu₂₀Y₁₀Ag₁₀', '{\"hardness\": 270.0, \"strength\": 830.0, \"corrosion_resistance\": 2.0}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-188', '镁基非晶耐腐蚀合金', '优化版 v3.1', 4, 'Mg₆₀Cu₂₀Gd₁₀Ag₁₀', '{\"hardness\": 275.0, \"strength\": 850.0, \"corrosion_resistance\": 2.1}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-189', '镁基非晶耐腐蚀合金', '优化版 v4.0', 4, 'Mg₆₂Cu₂₀Y₁₀Ni₈', '{\"hardness\": 255.0, \"strength\": 780.0, \"corrosion_resistance\": 1.4}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-190', '镁基非晶高强度合金', '农业版 v4.6', 4, 'Mg₆₂Cu₂₀Gd₁₀Ni₈', '{\"hardness\": 265.0, \"strength\": 800.0, \"corrosion_resistance\": 1.5}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-191', '镁基非晶高强度合金', '优化版 v4.9', 4, 'Mg₇₅Ni₁₀Y₁₅', '{\"hardness\": 220.0, \"strength\": 700.0, \"corrosion_resistance\": 1.2}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-192', '镁基非晶耐腐蚀合金', '生产版 v5.4', 4, 'Mg₇₅Ni₁₀Gd₁₅', '{\"hardness\": 230.0, \"strength\": 720.0, \"corrosion_resistance\": 1.3}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-193', '镁基非晶高密度合金', '工业版 v5.1', 4, 'Mg₇₅Ni₁₀Dy₁₅', '{\"hardness\": 235.0, \"strength\": 730.0, \"corrosion_resistance\": 1.3}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-194', '镁基非晶高密度合金', '工业版 v5.3', 4, 'Mg₇₅Ni₁₀Nd₁₅', '{\"hardness\": 225.0, \"strength\": 710.0, \"corrosion_resistance\": 1.2}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-195', '镁基非晶高强度合金', '优化版 v5.7', 4, 'Mg₆₀Zn₃₅Ca₅', '{\"hardness\": 180.0, \"strength\": 600.0, \"corrosion_resistance\": 0.8}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-196', '镁基非晶耐腐蚀合金', '优化版 v4.2', 4, 'Mg₇₀Zn₂₅Ce₅', '{\"hardness\": 200.0, \"strength\": 650.0, \"corrosion_resistance\": 1.0}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-197', '镁基非晶高强度合金', '工业版 v3.2', 4, 'Mg₇₀Zn₂₅La₅', '{\"hardness\": 195.0, \"strength\": 640.0, \"corrosion_resistance\": 1.0}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-198', '镁基非晶高密度合金', '优化版 v2.4', 4, 'Mg₇₀Zn₂₅Nd₅', '{\"hardness\": 205.0, \"strength\": 660.0, \"corrosion_resistance\": 1.1}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-199', '镁基非晶高强度合金', '农业版 v5.0', 4, 'Mg₇₀Zn₂₅Y₅', '{\"hardness\": 215.0, \"strength\": 680.0, \"corrosion_resistance\": 1.3}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-200', '镁基非晶高密度合金', '工业版 v1.8', 4, 'Mg₇₀Zn₂₅Gd₅', '{\"hardness\": 220.0, \"strength\": 690.0, \"corrosion_resistance\": 1.4}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-201', '镁基非晶高强度合金', '生产版 v2.1', 4, 'Mg₆₅Ca₁₀Cu₂₅', '{\"hardness\": 240.0, \"strength\": 720.0, \"corrosion_resistance\": 0.7}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-202', '镁基非晶高密度合金', '优化版 v1.5', 4, 'Mg₇₀Ca₁₀Ni₂₀', '{\"hardness\": 210.0, \"strength\": 650.0, \"corrosion_resistance\": 0.6}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-203', '镁基非晶高强度合金', '农业版 v2.7', 4, 'Mg₇₅Ca₁₀Y₁₅', '{\"hardness\": 170.0, \"strength\": 580.0, \"corrosion_resistance\": 1.0}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-204', '镁基非晶高密度合金', '农业版 v5.6', 4, 'Mg₇₅Ca₁₀Gd₁₅', '{\"hardness\": 175.0, \"strength\": 590.0, \"corrosion_resistance\": 1.1}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-205', '镁基非晶耐腐蚀合金', '优化版 v3.1', 4, 'Mg₇₀Ca₁₀Ag₂₀', '{\"hardness\": 190.0, \"strength\": 600.0, \"corrosion_resistance\": 1.5}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-206', '镁基非晶高强度合金', '农业版 v2.3', 4, 'Mg₇₀Ca₁₀Zn₂₀', '{\"hardness\": 160.0, \"strength\": 550.0, \"corrosion_resistance\": 0.7}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-207', '镁基非晶高密度合金', '工业版 v2.9', 4, 'Mg₆₇Y₁₀Zn₂₀Ca₃', '{\"hardness\": 240.0, \"strength\": 720.0, \"corrosion_resistance\": 1.5}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-208', '镁基非晶高密度合金', '农业版 v1.5', 4, 'Mg₆₇Gd₁₀Zn₂₀Ca₃', '{\"hardness\": 250.0, \"strength\": 740.0, \"corrosion_resistance\": 1.6}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-209', '镁基非晶高密度合金', '工业版 v1.7', 4, 'Mg₆₇Dy₁₀Zn₂₀Ca₃', '{\"hardness\": 255.0, \"strength\": 750.0, \"corrosion_resistance\": 1.6}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-210', '镁基非晶耐腐蚀合金', '生产版 v5.2', 4, 'Mg₆₇Nd₁₀Zn₂₀Ca₃', '{\"hardness\": 235.0, \"strength\": 710.0, \"corrosion_resistance\": 1.4}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-211', '镁基非晶高强度合金', '工业版 v4.9', 4, 'Mg₆₀Y₁₀Cu₂₀Ag₁₀', '{\"hardness\": 290.0, \"strength\": 860.0, \"corrosion_resistance\": 2.2}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-212', '镁基非晶高强度合金', '工业版 v4.9', 4, 'Mg₆₀Gd₁₀Cu₂₀Ag₁₀', '{\"hardness\": 300.0, \"strength\": 880.0, \"corrosion_resistance\": 2.3}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-213', '镁基非晶高密度合金', '生产版 v4.5', 4, 'Mg₆₀Dy₁₀Cu₂₀Ag₁₀', '{\"hardness\": 305.0, \"strength\": 890.0, \"corrosion_resistance\": 2.3}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-214', '镁基非晶耐腐蚀合金', '生产版 v2.3', 4, 'Mg₆₀Nd₁₀Cu₂₀Ag₁₀', '{\"hardness\": 280.0, \"strength\": 840.0, \"corrosion_resistance\": 2.0}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-215', '镁基非晶高强度合金', '优化版 v5.7', 4, 'Mg₆₀Y₁₀Cu₂₀Ga₁₀', '{\"hardness\": 270.0, \"strength\": 820.0, \"corrosion_resistance\": 1.8}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-216', '镁基非晶高密度合金', '生产版 v2.2', 4, 'Mg₆₀Gd₁₀Cu₂₀Ga₁₀', '{\"hardness\": 275.0, \"strength\": 840.0, \"corrosion_resistance\": 1.9}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-217', '镁基非晶高强度合金', '农业版 v3.7', 4, 'Mg₆₀Cu₂₀Y₁₀Ge₁₀', '{\"hardness\": 295.0, \"strength\": 870.0, \"corrosion_resistance\": 1.5}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-218', '镁基非晶高强度合金', '工业版 v2.7', 4, 'Mg₆₀Cu₂₀Gd₁₀Ge₁₀', '{\"hardness\": 305.0, \"strength\": 890.0, \"corrosion_resistance\": 1.6}', '2025-11-04 16:07:59', '2025-11-04 16:07:59');
INSERT INTO `amorphous_alloys` VALUES ('AMA-219', '钯基非晶高密度合金', '农业版 v2.1', 5, 'Pd₇₇.₅Cu₆Si₁₆.₅', '{\"hardness\": 400.0, \"strength\": 1500.0, \"corrosion_resistance\": 8.0}', '2025-11-04 16:08:57', '2025-11-04 16:08:57');
INSERT INTO `amorphous_alloys` VALUES ('AMA-220', '钯基非晶耐腐蚀合金', '农业版 v1.1', 5, 'Pd₄₀Ni₄₀P₂₀', '{\"hardness\": 450.0, \"strength\": 1600.0, \"corrosion_resistance\": 6.0}', '2025-11-04 16:08:57', '2025-11-04 16:08:57');
INSERT INTO `amorphous_alloys` VALUES ('AMA-221', '钯基非晶耐腐蚀合金', '优化版 v2.6', 5, 'Pd₄₃Ni₁₀Cu₂₇P₂₀', '{\"hardness\": 480.0, \"strength\": 1700.0, \"corrosion_resistance\": 7.0}', '2025-11-04 16:08:57', '2025-11-04 16:08:57');
INSERT INTO `amorphous_alloys` VALUES ('AMA-222', '钯基非晶高密度合金', '农业版 v2.2', 5, 'Pd₇₅Ag₅Si₂₀', '{\"hardness\": 380.0, \"strength\": 1450.0, \"corrosion_resistance\": 9.0}', '2025-11-04 16:08:57', '2025-11-04 16:08:57');
INSERT INTO `amorphous_alloys` VALUES ('AMA-223', '钯基非晶高密度合金', '优化版 v5.8', 5, 'Pd₄₀Ag₄₀P₂₀', '{\"hardness\": 420.0, \"strength\": 1550.0, \"corrosion_resistance\": 8.5}', '2025-11-04 16:08:57', '2025-11-04 16:08:57');
INSERT INTO `amorphous_alloys` VALUES ('AMA-224', '钯基非晶高强度合金', '农业版 v2.0', 5, 'Pd₄₀Ag₄₀Ge₂₀', '{\"hardness\": 390.0, \"strength\": 1480.0, \"corrosion_resistance\": 8.0}', '2025-11-04 16:08:57', '2025-11-04 16:08:57');
INSERT INTO `amorphous_alloys` VALUES ('AMA-225', '钯基非晶高密度合金', '生产版 v3.4', 5, 'Pd₇₅Au₅Si₂₀', '{\"hardness\": 410.0, \"strength\": 1520.0, \"corrosion_resistance\": 10.0}', '2025-11-04 16:08:57', '2025-11-04 16:08:57');
INSERT INTO `amorphous_alloys` VALUES ('AMA-226', '钯基非晶耐腐蚀合金', '工业版 v5.7', 5, 'Pd₄₀Au₄₀P₂₀', '{\"hardness\": 430.0, \"strength\": 1580.0, \"corrosion_resistance\": 9.5}', '2025-11-04 16:08:57', '2025-11-04 16:08:57');
INSERT INTO `amorphous_alloys` VALUES ('AMA-227', '钯基非晶耐腐蚀合金', '生产版 v3.0', 5, 'Pd₄₀Pt₄₀P₂₀', '{\"hardness\": 460.0, \"strength\": 1650.0, \"corrosion_resistance\": 15.0}', '2025-11-04 16:08:57', '2025-11-04 16:08:57');
INSERT INTO `amorphous_alloys` VALUES ('AMA-228', '钯基非晶高强度合金', '生产版 v3.6', 5, 'Pd₄₀Pt₂₀Cu₂₀P₂₀', '{\"hardness\": 490.0, \"strength\": 1720.0, \"corrosion_resistance\": 14.0}', '2025-11-04 16:08:57', '2025-11-04 16:08:57');
INSERT INTO `amorphous_alloys` VALUES ('AMA-229', '钯基非晶耐腐蚀合金', '优化版 v2.4', 5, 'Pd₄₀Pt₂₀Ni₂₀P₂₀', '{\"hardness\": 500.0, \"strength\": 1750.0, \"corrosion_resistance\": 13.0}', '2025-11-04 16:08:57', '2025-11-04 16:08:57');
INSERT INTO `amorphous_alloys` VALUES ('AMA-230', '钯基非晶高强度合金', '农业版 v4.2', 5, 'Pd₄₀Fe₄₀P₂₀', '{\"hardness\": 520.0, \"strength\": 1800.0, \"corrosion_resistance\": 4.0}', '2025-11-04 16:08:57', '2025-11-04 16:08:57');
INSERT INTO `amorphous_alloys` VALUES ('AMA-231', '钯基非晶耐腐蚀合金', '工业版 v5.5', 5, 'Pd₄₀Co₄₀P₂₀', '{\"hardness\": 510.0, \"strength\": 1780.0, \"corrosion_resistance\": 5.0}', '2025-11-04 16:08:57', '2025-11-04 16:08:57');
INSERT INTO `amorphous_alloys` VALUES ('AMA-232', '钯基非晶耐腐蚀合金', '优化版 v3.1', 5, 'Pd₄₀Rh₄₀P₂₀', '{\"hardness\": 480.0, \"strength\": 1700.0, \"corrosion_resistance\": 16.0}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-233', '钯基非晶高强度合金', '生产版 v3.2', 5, 'Pd₄₀Ru₄₀P₂₀', '{\"hardness\": 540.0, \"strength\": 1850.0, \"corrosion_resistance\": 12.0}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-234', '钯基非晶高强度合金', '生产版 v1.7', 5, 'Pd₄₀Ir₄₀P₂₀', '{\"hardness\": 500.0, \"strength\": 1750.0, \"corrosion_resistance\": 17.0}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-235', '钯基非晶高强度合金', '优化版 v3.6', 5, 'Pd₄₂Cu₂₈Ni₁₀P₂₀', '{\"hardness\": 470.0, \"strength\": 1680.0, \"corrosion_resistance\": 7.5}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-236', '钯基非晶耐腐蚀合金', '农业版 v5.7', 5, 'Pd₄₂Cu₂₈Co₁₀P₂₀', '{\"hardness\": 465.0, \"strength\": 1660.0, \"corrosion_resistance\": 7.8}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-237', '钯基非晶耐腐蚀合金', '优化版 v4.3', 5, 'Pd₄₀Ni₃₀Fe₁₀P₂₀', '{\"hardness\": 510.0, \"strength\": 1750.0, \"corrosion_resistance\": 5.5}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-238', '钯基非晶高密度合金', '工业版 v3.1', 5, 'Pd₄₀Ag₃₀Cu₁₀P₂₀', '{\"hardness\": 440.0, \"strength\": 1600.0, \"corrosion_resistance\": 9.0}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-239', '钯基非晶耐腐蚀合金', '生产版 v3.2', 5, 'Pd₄₀Ag₃₀Ni₁₀P₂₀', '{\"hardness\": 450.0, \"strength\": 1620.0, \"corrosion_resistance\": 8.0}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-240', '钯基非晶高强度合金', '优化版 v2.1', 5, 'Pd₄₀Au₃₀Cu₁₀P₂₀', '{\"hardness\": 460.0, \"strength\": 1650.0, \"corrosion_resistance\": 10.5}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-241', '钯基非晶高密度合金', '生产版 v3.8', 5, 'Pd₄₀Au₃₀Ni₁₀P₂₀', '{\"hardness\": 470.0, \"strength\": 1670.0, \"corrosion_resistance\": 9.8}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-242', '钯基非晶耐腐蚀合金', '农业版 v4.3', 5, 'Pd₆₀Zr₁₀P₃₀', '{\"hardness\": 580.0, \"strength\": 1900.0, \"corrosion_resistance\": 6.0}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-243', '钯基非晶高密度合金', '工业版 v4.9', 5, 'Pd₅₀Zr₂₀Cu₁₀P₂₀', '{\"hardness\": 560.0, \"strength\": 1850.0, \"corrosion_resistance\": 6.5}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-244', '钯基非晶高强度合金', '生产版 v3.9', 5, 'Pd₆₀Ti₁₀P₃₀', '{\"hardness\": 550.0, \"strength\": 1800.0, \"corrosion_resistance\": 5.5}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-245', '钯基非晶耐腐蚀合金', '工业版 v1.8', 5, 'Pd₅₀Ti₂₀Cu₁₀P₂₀', '{\"hardness\": 540.0, \"strength\": 1780.0, \"corrosion_resistance\": 6.0}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-246', '钯基非晶高强度合金', '优化版 v4.4', 5, 'Pd₆₀Y₁₀P₃₀', '{\"hardness\": 470.0, \"strength\": 1550.0, \"corrosion_resistance\": 4.5}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-247', '钯基非晶高密度合金', '生产版 v3.6', 5, 'Pd₅₀Y₂₀Cu₁₀P₂₀', '{\"hardness\": 490.0, \"strength\": 1600.0, \"corrosion_resistance\": 5.0}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-248', '钯基非晶耐腐蚀合金', '农业版 v4.3', 5, 'Pd₆₀Gd₁₀P₃₀', '{\"hardness\": 480.0, \"strength\": 1580.0, \"corrosion_resistance\": 4.8}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-249', '钯基非晶高密度合金', '优化版 v4.4', 5, 'Pd₅₀Gd₂₀Cu₁₀P₂₀', '{\"hardness\": 500.0, \"strength\": 1630.0, \"corrosion_resistance\": 5.2}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-250', '钯基非晶高密度合金', '生产版 v3.2', 5, 'Pd₆₀Nd₁₀P₃₀', '{\"hardness\": 460.0, \"strength\": 1530.0, \"corrosion_resistance\": 4.3}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-251', '钯基非晶高密度合金', '生产版 v4.6', 5, 'Pd₅₀Nd₂₀Cu₁₀P₂₀', '{\"hardness\": 480.0, \"strength\": 1580.0, \"corrosion_resistance\": 4.8}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-252', '钯基非晶高密度合金', '生产版 v2.7', 5, 'Pd₆₀Ce₁₀P₃₀', '{\"hardness\": 450.0, \"strength\": 1500.0, \"corrosion_resistance\": 4.0}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-253', '钯基非晶高强度合金', '优化版 v3.3', 5, 'Pd₅₀Ce₂₀Cu₁₀P₂₀', '{\"hardness\": 470.0, \"strength\": 1550.0, \"corrosion_resistance\": 4.5}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-254', '钯基非晶耐腐蚀合金', '生产版 v3.5', 5, 'Pd₆₀La₁₀P₃₀', '{\"hardness\": 440.0, \"strength\": 1480.0, \"corrosion_resistance\": 3.8}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-255', '钯基非晶高密度合金', '生产版 v4.8', 5, 'Pd₅₀La₂₀Cu₁₀P₂₀', '{\"hardness\": 460.0, \"strength\": 1530.0, \"corrosion_resistance\": 4.2}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-256', '钯基非晶高密度合金', '工业版 v5.7', 5, 'Pd₆₀Sn₁₀P₃₀', '{\"hardness\": 400.0, \"strength\": 1400.0, \"corrosion_resistance\": 7.0}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-257', '钯基非晶高强度合金', '农业版 v2.8', 5, 'Pd₅₀Sn₂₀Cu₁₀P₂₀', '{\"hardness\": 420.0, \"strength\": 1450.0, \"corrosion_resistance\": 7.5}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-258', '钯基非晶高密度合金', '生产版 v2.6', 5, 'Pd₆₀Ge₁₀P₃₀', '{\"hardness\": 430.0, \"strength\": 1450.0, \"corrosion_resistance\": 7.2}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-259', '钯基非晶高密度合金', '优化版 v3.8', 5, 'Pd₅₀Ge₂₀Cu₁₀P₂₀', '{\"hardness\": 450.0, \"strength\": 1500.0, \"corrosion_resistance\": 7.8}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-260', '钯基非晶高密度合金', '农业版 v1.9', 5, 'Pd₅₀Si₂₀Cu₁₀P₂₀', '{\"hardness\": 480.0, \"strength\": 1650.0, \"corrosion_resistance\": 7.0}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-261', '钯基非晶高密度合金', '工业版 v2.4', 5, 'Pd₆₀B₁₀P₃₀', '{\"hardness\": 600.0, \"strength\": 1950.0, \"corrosion_resistance\": 5.5}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-262', '钯基非晶耐腐蚀合金', '农业版 v5.9', 5, 'Pd₅₀B₂₀Cu₁₀P₂₀', '{\"hardness\": 580.0, \"strength\": 1880.0, \"corrosion_resistance\": 6.0}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-263', '钯基非晶耐腐蚀合金', '工业版 v1.3', 5, 'Pd₆₀Al₁₀P₃₀', '{\"hardness\": 380.0, \"strength\": 1350.0, \"corrosion_resistance\": 6.5}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-264', '钯基非晶高密度合金', '工业版 v2.5', 5, 'Pd₅₀Al₂₀Cu₁₀P₂₀', '{\"hardness\": 410.0, \"strength\": 1420.0, \"corrosion_resistance\": 7.0}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-265', '钯基非晶耐腐蚀合金', '农业版 v2.4', 5, 'Pd₆₀Ga₁₀P₃₀', '{\"hardness\": 390.0, \"strength\": 1380.0, \"corrosion_resistance\": 7.5}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');
INSERT INTO `amorphous_alloys` VALUES ('AMA-266', '钯基非晶耐腐蚀合金', '生产版 v2.9', 5, 'Pd₅₀Ga₂₀Cu₁₀P₂₀', '{\"hardness\": 420.0, \"strength\": 1450.0, \"corrosion_resistance\": 8.0}', '2025-11-04 16:08:58', '2025-11-04 16:08:58');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '基体类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_types
-- ----------------------------
INSERT INTO `base_types` VALUES (1, '锆', NULL, '2025-10-21 19:12:04');
INSERT INTO `base_types` VALUES (2, '铁', NULL, '2025-10-27 19:58:45');
INSERT INTO `base_types` VALUES (3, '铜', NULL, '2025-10-27 19:59:00');
INSERT INTO `base_types` VALUES (4, '镁', NULL, '2025-10-27 19:59:23');
INSERT INTO `base_types` VALUES (5, '钯', NULL, '2025-10-27 19:59:31');

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

-- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `equipment_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备编号',
  `equipment_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备名称',
  `equipment_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备类型',
  `temperature` decimal(5, 2) NULL DEFAULT NULL COMMENT '设备温度',
  `pressure` decimal(6, 2) NULL DEFAULT NULL COMMENT '设备压力',
  `status` tinyint NULL DEFAULT 1 COMMENT '设备状态：1-运行中，0-停机，2-维修中',
  `manufacturer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '制造商',
  `purchase_date` date NULL DEFAULT NULL COMMENT '购买日期',
  `last_maintenance_date` date NULL DEFAULT NULL COMMENT '最后维护日期',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `equipment_code`(`equipment_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '设备信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES (1, 'TM-YJ-02', '压铸机02', '压铸设备', 185.50, 120.75, 1, '上海机械', '2022-03-15', '2023-10-20', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `equipment` VALUES (2, 'TM-YJ-01', '压铸机01', '压铸设备', 182.30, 118.60, 1, '上海机械', '2022-01-10', '2023-10-18', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `equipment` VALUES (3, 'TM-SX-03', '砂型机03', '砂型设备', 175.80, 95.40, 1, '北京重工', '2022-05-20', '2023-10-22', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `equipment` VALUES (4, 'TM-SX-04', '砂型机04', '砂型设备', 178.20, 98.10, 2, '北京重工', '2022-06-08', '2023-10-15', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `equipment` VALUES (5, 'TM-JG-05', '加工中心05', '加工设备', 25.00, 0.00, 1, '广州精工', '2022-08-12', '2023-10-25', '2025-11-05 17:01:10', '2025-11-05 17:01:10');

-- ----------------------------
-- Table structure for operators
-- ----------------------------
DROP TABLE IF EXISTS `operators`;
CREATE TABLE `operators`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作员姓名',
  `employee_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工号',
  `department` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门',
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职位',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态：1-在职，0-离职',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `employee_id`(`employee_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作员信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operators
-- ----------------------------
INSERT INTO `operators` VALUES (1, '王十二', 'EMP001', '生产一部', '高级操作员', 1, '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `operators` VALUES (2, '李四', 'EMP002', '生产一部', '操作员', 1, '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `operators` VALUES (3, '张三', 'EMP003', '生产二部', '操作员', 1, '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `operators` VALUES (4, '赵五', 'EMP004', '生产一部', '操作员', 1, '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `operators` VALUES (5, '钱六', 'EMP005', '生产二部', '组长', 1, '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `operators` VALUES (6, '孙七', 'EMP006', '质量部', '质检员', 1, '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `operators` VALUES (7, '周八', 'EMP007', '生产一部', '操作员', 0, '2025-11-05 17:01:10', '2025-11-05 17:01:10');

-- ----------------------------
-- Table structure for production_batches
-- ----------------------------
DROP TABLE IF EXISTS `production_batches`;
CREATE TABLE `production_batches`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `batch_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '批次号',
  `production_date` date NOT NULL COMMENT '生产日期',
  `equipment_id` int NOT NULL COMMENT '设备ID外键',
  `material` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '材料',
  `process` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工艺',
  `quality` tinyint NOT NULL COMMENT '质量：1-合格，0-不合格',
  `operator_id` int NOT NULL COMMENT '操作员ID外键',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `batch_no`(`batch_no` ASC) USING BTREE,
  INDEX `equipment_id`(`equipment_id` ASC) USING BTREE,
  INDEX `operator_id`(`operator_id` ASC) USING BTREE,
  INDEX `idx_production_date`(`production_date` ASC) USING BTREE,
  INDEX `idx_batch_no`(`batch_no` ASC) USING BTREE,
  INDEX `idx_quality`(`quality` ASC) USING BTREE,
  CONSTRAINT `production_batches_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `production_batches_ibfk_2` FOREIGN KEY (`operator_id`) REFERENCES `operators` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '生产批次记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of production_batches
-- ----------------------------
INSERT INTO `production_batches` VALUES (1, 'BATCH-20231026-01', '2023-10-26', 1, '铸铁HT250', '砂型铸造', 1, 1, '正常生产，质量稳定', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (2, 'BATCH-20231026-02', '2023-10-26', 1, '铸铁HT250', '砂型铸造', 1, 1, '无异常', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (3, 'BATCH-20231026-03', '2023-10-26', 2, '铝合金ADC12', '压铸成型', 1, 2, '表面光洁度良好', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (4, 'BATCH-20231027-01', '2023-10-27', 1, '铸铁HT250', '砂型铸造', 0, 1, '出现气孔，需要返工', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (5, 'BATCH-20231027-02', '2023-10-27', 3, '铸钢ZG270', '砂型铸造', 1, 3, '尺寸精度达标', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (6, 'BATCH-20231027-03', '2023-10-27', 2, '铝合金ADC12', '压铸成型', 1, 2, '生产效率较高', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (7, 'BATCH-20231028-01', '2023-10-28', 1, '铸铁HT250', '砂型铸造', 1, 4, '夜班生产', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (8, 'BATCH-20231028-02', '2023-10-28', 3, '铸钢ZG270', '砂型铸造', 1, 3, '材料配比调整', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (9, 'BATCH-20231028-03', '2023-10-28', 5, '铜合金H62', '精密加工', 1, 5, '加工精度0.01mm', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (10, 'BATCH-20231029-01', '2023-10-29', 1, '铸铁HT250', '砂型铸造', 1, 1, '周末加班生产', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (11, 'BATCH-20231029-02', '2023-10-29', 2, '铝合金ADC12', '压铸成型', 0, 2, '模具磨损，需要更换', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (12, 'BATCH-20231030-01', '2023-10-30', 1, '铸铁HT250', '砂型铸造', 1, 4, '批量生产', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (13, 'BATCH-20231030-02', '2023-10-30', 3, '铸钢ZG270', '砂型铸造', 1, 3, '新工艺试制', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (14, 'BATCH-20231030-03', '2023-10-30', 2, '镁合金AZ91', '压铸成型', 1, 2, '轻量化产品', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (15, 'BATCH-20231031-01', '2023-10-31', 1, '铸铁HT250', '砂型铸造', 1, 1, '月底生产任务', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (16, 'BATCH-20231031-02', '2023-10-31', 5, '铜合金H62', '精密加工', 0, 5, '刀具磨损影响精度', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (17, 'BATCH-20231101-01', '2023-11-01', 1, '铸铁HT250', '砂型铸造', 1, 4, '月初首检合格', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (18, 'BATCH-20231101-02', '2023-11-01', 3, '铸钢ZG270', '砂型铸造', 1, 3, '工艺参数优化', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (19, 'BATCH-20231101-03', '2023-11-01', 2, '铝合金ADC12', '压铸成型', 1, 2, '生产效率提升', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (20, 'BATCH-20231102-01', '2023-11-02', 1, '铸铁HT250', '砂型铸造', 1, 1, '正常生产', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (21, 'BATCH-20231102-02', '2023-11-02', 5, '不锈钢304', '精密加工', 1, 5, '高难度加工', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (22, 'BATCH-20231102-03', '2023-11-02', 3, '铸钢ZG270', '砂型铸造', 0, 3, '砂型强度不足', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (23, 'BATCH-20231103-01', '2023-11-03', 1, '铸铁HT250', '砂型铸造', 1, 4, '批量订单', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (24, 'BATCH-20231103-02', '2023-11-03', 2, '铝合金ADC12', '压铸成型', 1, 2, '外观质量优秀', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (25, 'BATCH-20231103-03', '2023-11-03', 5, '铜合金H62', '精密加工', 1, 5, '精密零件', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (26, 'BATCH-20231104-01', '2023-11-04', 1, '铸铁HT250', '砂型铸造', 1, 1, '周末生产', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (27, 'BATCH-20231104-02', '2023-11-04', 3, '铸钢ZG270', '砂型铸造', 1, 3, '工艺稳定', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (28, 'BATCH-20231104-03', '2023-11-04', 2, '镁合金AZ91', '压铸成型', 0, 2, '氧化问题', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (29, 'BATCH-20231105-01', '2023-11-05', 1, '铸铁HT250', '砂型铸造', 1, 4, '新订单开始', '2025-11-05 17:01:10', '2025-11-05 17:01:10');
INSERT INTO `production_batches` VALUES (30, 'BATCH-20231105-02', '2023-11-05', 5, '不锈钢304', '精密加工', 1, 5, '高精度要求', '2025-11-05 17:01:10', '2025-11-05 17:01:10');

SET FOREIGN_KEY_CHECKS = 1;
