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

 Date: 01/11/2025 10:53:45
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
INSERT INTO `amorphous_alloys` VALUES ('AMA-001', '锆基非高晶强度合金', '优化版 v3.2', 1, 'Zr₅₅Cu₃₀Al₁₅', '{\"hardness\": 520, \"strength\": 1850, \"corrosion_resistance\": 22}', '2025-10-21 19:12:04', '2025-10-28 19:13:04');
INSERT INTO `amorphous_alloys` VALUES ('AMA-002', '锆基非晶高强度合金', '生产版 v5.2', 1, 'Zr₅₅Cu₃₀Al₁₅', '{\"hardness\": 1600.0, \"strength\": 480.0, \"corrosion_resistance\": 3.0}', '2025-10-31 11:10:09', '2025-10-31 11:10:09');
INSERT INTO `amorphous_alloys` VALUES ('AMA-003', '锆基非晶高密度合金', '生产版 v1.6', 1, 'Zr₅₂.₅Cu₁₇.₉Ni₁₄.₆Al₁₀', '{\"hardness\": 1650.0, \"strength\": 500.0, \"corrosion_resistance\": 3.5}', '2025-10-31 11:10:10', '2025-10-31 11:10:10');
INSERT INTO `amorphous_alloys` VALUES ('AMA-004', '锆基非晶耐腐蚀合金', '优化版 v2.4', 1, 'Zr₄₄Cu₁₂Ti₁₁Ni₁₀Be₂₃', '{\"hardness\": 1900.0, \"strength\": 550.0, \"corrosion_resistance\": 2.5}', '2025-10-31 11:10:10', '2025-10-31 11:10:10');
INSERT INTO `amorphous_alloys` VALUES ('AMA-005', '锆基非晶高密度合金', '优化版 v3.4', 1, 'Zr₅₀Cu₂₀Al₁₀Ni₁₀Ti₁₀', '{\"hardness\": 1700.0, \"strength\": 520.0, \"corrosion_resistance\": 3.2}', '2025-10-31 11:10:10', '2025-10-31 11:10:10');
INSERT INTO `amorphous_alloys` VALUES ('AMA-006', '锆基非晶耐腐蚀合金', '农业版 v2.9', 1, 'Zr₅₀Cu₃₀Al₁₀Ag₁₀', '{\"hardness\": 1580.0, \"strength\": 470.0, \"corrosion_resistance\": 4.0}', '2025-10-31 11:10:10', '2025-10-31 11:10:10');
INSERT INTO `amorphous_alloys` VALUES ('AMA-007', '锆基非晶耐腐蚀合金', '农业版 v5.7', 1, 'Zr₅₅Cu₂₅Al₁₀Co₁₀', '{\"hardness\": 1620.0, \"strength\": 490.0, \"corrosion_resistance\": 3.8}', '2025-10-31 11:10:10', '2025-10-31 11:10:10');
INSERT INTO `amorphous_alloys` VALUES ('AMA-008', '锆基非晶高密度合金', '工业版 v3.1', 1, 'Zr₅₆Cu₂₈Al₁₀Y₆', '{\"hardness\": 1550.0, \"strength\": 460.0, \"corrosion_resistance\": 4.5}', '2025-10-31 11:30:54', '2025-10-31 11:30:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-009', '锆基非晶耐腐蚀合金', '优化版 v5.7', 1, 'Zr₅₃Cu₂₇Al₁₀Nb₁₀', '{\"hardness\": 1680.0, \"strength\": 510.0, \"corrosion_resistance\": 4.2}', '2025-10-31 11:30:54', '2025-10-31 11:30:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-010', '锆基非晶耐腐蚀合金', '农业版 v5.5', 1, 'Zr₅₃Cu₂₇Al₁₀Ta₁₀', '{\"hardness\": 1700.0, \"strength\": 530.0, \"corrosion_resistance\": 4.5}', '2025-10-31 11:30:54', '2025-10-31 11:30:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-011', '锆基非晶高强度合金', '工业版 v1.6', 1, 'Zr₅₄Cu₂₆Al₁₀Mo₁₀', '{\"hardness\": 1720.0, \"strength\": 540.0, \"corrosion_resistance\": 3.8}', '2025-10-31 11:30:54', '2025-10-31 11:30:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-012', '锆基非晶耐腐蚀合金', '农业版 v3.1', 1, 'Zr₅₄Cu₂₆Al₁₀W₁₀', '{\"hardness\": 1750.0, \"strength\": 560.0, \"corrosion_resistance\": 3.5}', '2025-10-31 11:30:54', '2025-10-31 11:30:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-013', '锆基非晶高密度合金', '工业版 v2.7', 1, 'Zr₅₅Cu₂₈Al₁₀Sn₇', '{\"hardness\": 1570.0, \"strength\": 465.0, \"corrosion_resistance\": 3.3}', '2025-10-31 11:30:54', '2025-10-31 11:30:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-014', '锆基非晶耐腐蚀合金', '生产版 v2.8', 1, 'Zr₅₅Cu₂₈Al₁₀Si₇', '{\"hardness\": 1650.0, \"strength\": 510.0, \"corrosion_resistance\": 3.7}', '2025-10-31 11:30:54', '2025-10-31 11:30:54');
INSERT INTO `amorphous_alloys` VALUES ('AMA-015', '锆基非晶高密度合金', '农业版 v3.0', 1, 'Zr₅₀Cu₂₅Al₁₀Pd₁₅', '{\"hardness\": 1620.0, \"strength\": 495.0, \"corrosion_resistance\": 5.5}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-016', '锆基非晶高密度合金', '生产版 v3.7', 1, 'Zr₅₅Cu₂₅Al₁₀Fe₁₀', '{\"hardness\": 1640.0, \"strength\": 500.0, \"corrosion_resistance\": 3.0}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-017', '锆基非晶高密度合金', '农业版 v5.6', 1, 'Zr₅₀Cu₂₀Al₁₀Ni₁₀Ti₁₀', '{\"hardness\": 1700.0, \"strength\": 520.0, \"corrosion_resistance\": 3.2}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-018', '锆基非晶耐腐蚀合金', '生产版 v1.3', 1, 'Zr₅₂Cu₁₈Ni₁₂Al₁₀Sn₈', '{\"hardness\": 1630.0, \"strength\": 490.0, \"corrosion_resistance\": 3.5}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-019', '锆基非晶高强度合金', '农业版 v1.2', 1, 'Zr₄₈Cu₂₀Ni₁₂Al₁₀Be₁₀', '{\"hardness\": 1850.0, \"strength\": 540.0, \"corrosion_resistance\": 2.8}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-020', '锆基非晶高强度合金', '工业版 v2.6', 1, 'Zr₅₀Cu₁₈Ni₁₂Al₁₀Nb₁₀', '{\"hardness\": 1680.0, \"strength\": 515.0, \"corrosion_resistance\": 4.3}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-021', '锆基非晶高强度合金', '优化版 v2.0', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Y₉', '{\"hardness\": 1580.0, \"strength\": 475.0, \"corrosion_resistance\": 4.8}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-022', '锆基非晶高强度合金', '优化版 v5.9', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Ag₉', '{\"hardness\": 1600.0, \"strength\": 485.0, \"corrosion_resistance\": 4.2}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-023', '锆基非晶高密度合金', '优化版 v2.9', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Co₉', '{\"hardness\": 1650.0, \"strength\": 505.0, \"corrosion_resistance\": 3.9}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-024', '锆基非晶耐腐蚀合金', '生产版 v5.1', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Cr₉', '{\"hardness\": 1670.0, \"strength\": 520.0, \"corrosion_resistance\": 4.0}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-025', '锆基非晶高密度合金', '优化版 v1.2', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Mo₉', '{\"hardness\": 1690.0, \"strength\": 525.0, \"corrosion_resistance\": 4.1}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-026', '锆基非晶耐腐蚀合金', '工业版 v5.8', 1, 'Zr₅₂Cu₁₈Ni₁₂Al₁₀Fe₈', '{\"hardness\": 1660.0, \"strength\": 510.0, \"corrosion_resistance\": 3.2}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-027', '锆基非晶耐腐蚀合金', '工业版 v3.8', 1, 'Zr₅₅Cu₂₀Ti₁₀Ni₁₅', '{\"hardness\": 1620.0, \"strength\": 490.0, \"corrosion_resistance\": 2.8}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-028', '锆基非晶高强度合金', '农业版 v4.8', 1, 'Zr₄₄Cu₁₂Ti₁₁Ni₁₀Be₂₃', '{\"hardness\": 1900.0, \"strength\": 550.0, \"corrosion_resistance\": 2.5}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-029', '锆基非晶耐腐蚀合金', '工业版 v4.7', 1, 'Zr₅₀Cu₂₀Ti₁₀Ni₁₀Al₁₀', '{\"hardness\": 1720.0, \"strength\": 525.0, \"corrosion_resistance\": 3.0}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-030', '锆基非晶高密度合金', '农业版 v3.8', 1, 'Zr₅₂Cu₂₀Ti₁₀Ni₁₀Sn₈', '{\"hardness\": 1600.0, \"strength\": 480.0, \"corrosion_resistance\": 3.2}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-031', '锆基非晶耐腐蚀合金', '工业版 v4.6', 1, 'Zr₅₀Cu₂₀Ti₁₀Be₂₀', '{\"hardness\": 1800.0, \"strength\": 530.0, \"corrosion_resistance\": 2.3}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-032', '锆基非晶高密度合金', '工业版 v2.3', 1, 'Zr₅₂Cu₁₈Ni₁₂Ti₁₀Sn₈', '{\"hardness\": 1580.0, \"strength\": 470.0, \"corrosion_resistance\": 3.0}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-033', '锆基非晶耐腐蚀合金', '生产版 v1.6', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Y₉', '{\"hardness\": 1580.0, \"strength\": 475.0, \"corrosion_resistance\": 4.8}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-034', '锆基非晶高密度合金', '优化版 v1.9', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Gd₉', '{\"hardness\": 1590.0, \"strength\": 480.0, \"corrosion_resistance\": 5.0}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-035', '锆基非晶耐腐蚀合金', '生产版 v4.6', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Dy₉', '{\"hardness\": 1600.0, \"strength\": 485.0, \"corrosion_resistance\": 5.0}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-036', '锆基非晶高密度合金', '优化版 v3.5', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Er₉', '{\"hardness\": 1610.0, \"strength\": 490.0, \"corrosion_resistance\": 5.0}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-037', '锆基非晶耐腐蚀合金', '工业版 v3.0', 1, 'Zr₄₀Cu₁₈Ni₁₂Al₁₀Hf₂₀', '{\"hardness\": 1750.0, \"strength\": 545.0, \"corrosion_resistance\": 3.5}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-038', '锆基非晶耐腐蚀合金', '优化版 v5.1', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Sc₉', '{\"hardness\": 1560.0, \"strength\": 465.0, \"corrosion_resistance\": 4.0}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-039', '锆基非晶高密度合金', '优化版 v1.3', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀V₉', '{\"hardness\": 1690.0, \"strength\": 530.0, \"corrosion_resistance\": 3.3}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-040', '锆基非晶耐腐蚀合金', '农业版 v5.0', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Cr₉', '{\"hardness\": 1670.0, \"strength\": 520.0, \"corrosion_resistance\": 4.0}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-041', '锆基非晶耐腐蚀合金', '优化版 v4.5', 1, 'Zr₅₂Cu₁₈Ni₁₂Al₁₀Mn₈', '{\"hardness\": 1630.0, \"strength\": 495.0, \"corrosion_resistance\": 2.8}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-042', '锆基非晶高密度合金', '生产版 v1.5', 1, 'Zr₅₂Cu₁₈Ni₁₂Al₁₀Fe₈', '{\"hardness\": 1660.0, \"strength\": 510.0, \"corrosion_resistance\": 3.2}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-043', '锆基非晶高密度合金', '工业版 v5.8', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Co₉', '{\"hardness\": 1650.0, \"strength\": 505.0, \"corrosion_resistance\": 3.9}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-044', '锆基非晶耐腐蚀合金', '工业版 v1.5', 1, 'Zr₅₂Cu₁₈Ni₁₂Al₁₀Ga₈', '{\"hardness\": 1590.0, \"strength\": 475.0, \"corrosion_resistance\": 3.8}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-045', '锆基非晶高强度合金', '工业版 v3.9', 1, 'Zr₅₂Cu₁₈Ni₁₂Al₁₀Ge₈', '{\"hardness\": 1640.0, \"strength\": 505.0, \"corrosion_resistance\": 4.0}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-046', '锆基非晶高强度合金', '农业版 v3.1', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Pd₁₂', '{\"hardness\": 1630.0, \"strength\": 500.0, \"corrosion_resistance\": 6.0}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-047', '锆基非晶耐腐蚀合金', '优化版 v1.1', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Pt₁₂', '{\"hardness\": 1650.0, \"strength\": 510.0, \"corrosion_resistance\": 6.5}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-048', '锆基非晶耐腐蚀合金', '农业版 v5.0', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Au₁₂', '{\"hardness\": 1580.0, \"strength\": 485.0, \"corrosion_resistance\": 5.8}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-049', '锆基非晶高密度合金', '工业版 v2.3', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Ag₉', '{\"hardness\": 1600.0, \"strength\": 485.0, \"corrosion_resistance\": 4.2}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-050', '锆基非晶高密度合金', '优化版 v3.6', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Ta₉', '{\"hardness\": 1680.0, \"strength\": 525.0, \"corrosion_resistance\": 4.6}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-051', '锆基非晶高密度合金', '优化版 v2.8', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Mo₉', '{\"hardness\": 1690.0, \"strength\": 525.0, \"corrosion_resistance\": 4.1}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-052', '锆基非晶高密度合金', '农业版 v1.6', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀W₉', '{\"hardness\": 1710.0, \"strength\": 540.0, \"corrosion_resistance\": 3.8}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-053', '锆基非晶高强度合金', '工业版 v2.3', 1, 'Zr₅₀Cu₁₈Ni₁₂Al₁₀Nb₁₀', '{\"hardness\": 1680.0, \"strength\": 515.0, \"corrosion_resistance\": 4.3}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-054', '锆基非晶耐腐蚀合金', '工业版 v1.4', 1, 'Zr₄₅Cu₁₈Ni₁₂Al₁₀Ti₅Be₁₀', '{\"hardness\": 1880.0, \"strength\": 560.0, \"corrosion_resistance\": 2.7}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-055', '锆基非晶高密度合金', '优化版 v4.3', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Ti₅Nb₇', '{\"hardness\": 1730.0, \"strength\": 535.0, \"corrosion_resistance\": 4.0}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-056', '锆基非晶耐腐蚀合金', '生产版 v4.2', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Ti₅Ta₇', '{\"hardness\": 1740.0, \"strength\": 540.0, \"corrosion_resistance\": 4.3}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-057', '锆基非晶耐腐蚀合金', '优化版 v3.1', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Ti₅V₇', '{\"hardness\": 1720.0, \"strength\": 530.0, \"corrosion_resistance\": 3.5}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-058', '锆基非晶耐腐蚀合金', '农业版 v3.2', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Ti₅Cr₇', '{\"hardness\": 1700.0, \"strength\": 525.0, \"corrosion_resistance\": 3.8}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-059', '锆基非晶高密度合金', '优化版 v3.5', 1, 'Zr₅₆Cu₃₀Al₁₄', '{\"hardness\": 1620.0, \"strength\": 485.0, \"corrosion_resistance\": 3.1}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-060', '锆基非晶耐腐蚀合金', '工业版 v5.3', 1, 'Zr₅₅Cu₃₀Al₁₅', '{\"hardness\": 1600.0, \"strength\": 480.0, \"corrosion_resistance\": 3.0}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-061', '锆基非晶高强度合金', '生产版 v2.1', 1, 'Zr₅₂.₅Cu₂₅Al₂₂.₅', '{\"hardness\": 1580.0, \"strength\": 490.0, \"corrosion_resistance\": 3.4}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-062', '锆基非晶高强度合金', '工业版 v4.3', 1, 'Zr₅₀Cu₄₀Al₁₀', '{\"hardness\": 1550.0, \"strength\": 450.0, \"corrosion_resistance\": 2.5}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-063', '锆基非晶高强度合金', '工业版 v5.5', 1, 'Zr₅₀Cu₃₅Al₁₅', '{\"hardness\": 1590.0, \"strength\": 470.0, \"corrosion_resistance\": 2.8}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-064', '锆基非晶耐腐蚀合金', '农业版 v3.6', 1, 'Zr₅₀Cu₃₀Al₂₀', '{\"hardness\": 1630.0, \"strength\": 500.0, \"corrosion_resistance\": 3.2}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-065', '锆基非晶高密度合金', '优化版 v3.0', 1, 'Zr₄₈Cu₃₆Al₁₆', '{\"hardness\": 1610.0, \"strength\": 475.0, \"corrosion_resistance\": 2.7}', '2025-10-31 11:30:55', '2025-10-31 11:30:55');
INSERT INTO `amorphous_alloys` VALUES ('AMA-066', '锆基非晶高密度合金', '优化版 v2.4', 1, 'Zr₄₇Cu₃₈Al₁₅', '{\"hardness\": 1560.0, \"strength\": 460.0, \"corrosion_resistance\": 2.5}', '2025-10-31 11:30:56', '2025-10-31 11:30:56');
INSERT INTO `amorphous_alloys` VALUES ('AMA-067', '锆基非晶耐腐蚀合金', '工业版 v5.2', 1, 'Zr₄₆Cu₃₈Al₁₆', '{\"hardness\": 1540.0, \"strength\": 455.0, \"corrosion_resistance\": 2.4}', '2025-10-31 11:30:56', '2025-10-31 11:30:56');
INSERT INTO `amorphous_alloys` VALUES ('AMA-068', '锆基非晶耐腐蚀合金', '工业版 v2.5', 1, 'Zr₄₅Cu₃₅Al₂₀', '{\"hardness\": 1600.0, \"strength\": 495.0, \"corrosion_resistance\": 3.1}', '2025-10-31 11:30:56', '2025-10-31 11:30:56');
INSERT INTO `amorphous_alloys` VALUES ('AMA-069', '锆基非晶耐腐蚀合金', '生产版 v3.7', 1, 'Zr₄₅Cu₄₀Al₁₅', '{\"hardness\": 1520.0, \"strength\": 445.0, \"corrosion_resistance\": 2.3}', '2025-10-31 11:30:56', '2025-10-31 11:30:56');
INSERT INTO `amorphous_alloys` VALUES ('AMA-070', '锆基非晶高密度合金', '生产版 v4.8', 1, 'Zr₄₄Cu₃₆Al₂₀', '{\"hardness\": 1570.0, \"strength\": 485.0, \"corrosion_resistance\": 3.0}', '2025-10-31 11:30:56', '2025-10-31 11:30:56');
INSERT INTO `amorphous_alloys` VALUES ('AMA-071', '锆基非晶耐腐蚀合金', '农业版 v1.5', 1, 'Zr₄₂Cu₃₈Al₂₀', '{\"hardness\": 1490.0, \"strength\": 465.0, \"corrosion_resistance\": 2.8}', '2025-10-31 11:30:56', '2025-10-31 11:30:56');
INSERT INTO `amorphous_alloys` VALUES ('AMA-072', '锆基非晶耐腐蚀合金', '生产版 v2.7', 1, 'Zr₆₀Cu₂₅Al₁₅', '{\"hardness\": 1590.0, \"strength\": 470.0, \"corrosion_resistance\": 3.5}', '2025-10-31 11:30:56', '2025-10-31 11:30:56');
INSERT INTO `amorphous_alloys` VALUES ('AMA-073', '锆基非晶耐腐蚀合金', '优化版 v2.6', 1, 'Zr₆₅Cu₂₀Al₁₅', '{\"hardness\": 1510.0, \"strength\": 440.0, \"corrosion_resistance\": 4.0}', '2025-10-31 11:30:56', '2025-10-31 11:30:56');
INSERT INTO `amorphous_alloys` VALUES ('AMA-074', '锆基非晶耐腐蚀合金', '生产版 v1.3', 1, 'Zr₆₀Cu₃₀Al₁₀', '{\"hardness\": 1530.0, \"strength\": 435.0, \"corrosion_resistance\": 3.0}', '2025-10-31 11:30:56', '2025-10-31 11:30:56');
INSERT INTO `amorphous_alloys` VALUES ('AMA-075', '锆基非晶耐腐蚀合金', '工业版 v4.6', 1, 'Zr₅₈Cu₃₂Al₁₀', '{\"hardness\": 1550.0, \"strength\": 445.0, \"corrosion_resistance\": 2.8}', '2025-10-31 11:30:56', '2025-10-31 11:30:56');
INSERT INTO `amorphous_alloys` VALUES ('AMA-076', '锆基非晶耐腐蚀合金', '生产版 v3.9', 1, 'Zr₅₇Cu₃₃Al₁₀', '{\"hardness\": 1560.0, \"strength\": 450.0, \"corrosion_resistance\": 2.7}', '2025-10-31 11:30:56', '2025-10-31 11:30:56');
INSERT INTO `amorphous_alloys` VALUES ('AMA-077', '锆基非晶耐腐蚀合金', '生产版 v5.9', 1, 'Zr₅₆Cu₃₄Al₁₀', '{\"hardness\": 1570.0, \"strength\": 455.0, \"corrosion_resistance\": 2.6}', '2025-10-31 11:30:56', '2025-10-31 11:30:56');
INSERT INTO `amorphous_alloys` VALUES ('AMA-078', '锆基非晶高密度合金', '生产版 v3.0', 1, 'Zr₅₅Cu₃₅Al₁₀', '{\"hardness\": 1580.0, \"strength\": 460.0, \"corrosion_resistance\": 2.5}', '2025-10-31 11:30:56', '2025-10-31 11:30:56');
INSERT INTO `amorphous_alloys` VALUES ('AMA-079', '铁基非晶耐腐蚀合金', '生产版 v3.6', 2, 'Fe₇₈Si₉B₁₃', '{\"hardness\": 3000.0, \"strength\": 980.0, \"corrosion_resistance\": 1.5}', '2025-10-31 11:32:04', '2025-10-31 11:32:04');
INSERT INTO `amorphous_alloys` VALUES ('AMA-080', '铁基非晶高密度合金', '农业版 v2.6', 2, 'Fe₈₀P₁₃C₇', '{\"hardness\": 2700.0, \"strength\": 750.0, \"corrosion_resistance\": 1.2}', '2025-10-31 11:32:04', '2025-10-31 11:32:04');
INSERT INTO `amorphous_alloys` VALUES ('AMA-081', '铁基非晶耐腐蚀合金', '农业版 v3.5', 2, 'Fe₇₂B₂₀Si₅Nb₃', '{\"hardness\": 3500.0, \"strength\": 1100.0, \"corrosion_resistance\": 2.0}', '2025-10-31 11:32:04', '2025-10-31 11:32:04');
INSERT INTO `amorphous_alloys` VALUES ('AMA-082', '铁基非晶高密度合金', '农业版 v4.4', 2, 'Fe₇₉B₁₂Si₅P₄', '{\"hardness\": 2900.0, \"strength\": 900.0, \"corrosion_resistance\": 1.3}', '2025-10-31 11:32:04', '2025-10-31 11:32:04');
INSERT INTO `amorphous_alloys` VALUES ('AMA-083', '铁基非晶高密度合金', '优化版 v2.0', 2, 'Fe₇₈B₁₂Si₇C₃', '{\"hardness\": 2800.0, \"strength\": 850.0, \"corrosion_resistance\": 1.2}', '2025-10-31 11:32:04', '2025-10-31 11:32:04');
INSERT INTO `amorphous_alloys` VALUES ('AMA-084', '铁基非晶耐腐蚀合金', '工业版 v4.3', 2, 'Fe₆₇Cr₁₀B₁₅Si₈', '{\"hardness\": 3200.0, \"strength\": 1200.0, \"corrosion_resistance\": 15.0}', '2025-10-31 11:32:04', '2025-10-31 11:32:04');
INSERT INTO `amorphous_alloys` VALUES ('AMA-085', '铁基非晶高强度合金', '农业版 v1.9', 2, 'Fe₇₆Mo₂B₁₅Si₇', '{\"hardness\": 3300.0, \"strength\": 1050.0, \"corrosion_resistance\": 3.0}', '2025-10-31 11:32:04', '2025-10-31 11:32:04');
INSERT INTO `amorphous_alloys` VALUES ('AMA-086', '铁基非晶高密度合金', '生产版 v1.3', 2, 'Fe₇₀Ni₁₀B₁₅Si₅', '{\"hardness\": 2800.0, \"strength\": 800.0, \"corrosion_resistance\": 2.0}', '2025-10-31 11:32:04', '2025-10-31 11:32:04');
INSERT INTO `amorphous_alloys` VALUES ('AMA-087', '铁基非晶高密度合金', '工业版 v3.6', 2, 'Fe₆₀Co₂₀B₁₅Si₅', '{\"hardness\": 2800.0, \"strength\": 820.0, \"corrosion_resistance\": 2.2}', '2025-10-31 11:32:04', '2025-10-31 11:32:04');
INSERT INTO `amorphous_alloys` VALUES ('AMA-088', '铁基非晶耐腐蚀合金', '农业版 v2.3', 2, 'Fe₇₆B₁₅Si₆Al₃', '{\"hardness\": 2700.0, \"strength\": 830.0, \"corrosion_resistance\": 1.8}', '2025-10-31 11:32:04', '2025-10-31 11:32:04');
INSERT INTO `amorphous_alloys` VALUES ('AMA-089', '铁基非晶耐腐蚀合金', '农业版 v3.1', 2, 'Fe₇₆B₁₅Si₆Ga₃', '{\"hardness\": 2750.0, \"strength\": 840.0, \"corrosion_resistance\": 2.0}', '2025-10-31 11:32:04', '2025-10-31 11:32:04');
INSERT INTO `amorphous_alloys` VALUES ('AMA-090', '铁基非晶耐腐蚀合金', '优化版 v3.3', 2, 'Fe₇₆B₁₅Si₆Ge₃', '{\"hardness\": 2850.0, \"strength\": 880.0, \"corrosion_resistance\": 2.2}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-091', '铁基非晶高密度合金', '工业版 v3.5', 2, 'Fe₇₁B₁₅Si₅Nb₄Mo₅', '{\"hardness\": 3600.0, \"strength\": 1150.0, \"corrosion_resistance\": 3.5}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-092', '铁基非晶耐腐蚀合金', '工业版 v2.3', 2, 'Fe₆₈Cr₅B₁₅Si₅Nb₇', '{\"hardness\": 3800.0, \"strength\": 1250.0, \"corrosion_resistance\": 20.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-093', '铁基非晶高密度合金', '优化版 v4.2', 2, 'Fe₇₀B₁₅Si₅Nb₅W₅', '{\"hardness\": 3700.0, \"strength\": 1180.0, \"corrosion_resistance\": 4.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-094', '铁基非晶高强度合金', '优化版 v3.9', 2, 'Fe₇₁B₁₅Si₅Nb₄Ta₅', '{\"hardness\": 3650.0, \"strength\": 1160.0, \"corrosion_resistance\": 4.5}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-095', '铁基非晶高强度合金', '优化版 v5.6', 2, 'Fe₇₂.₅B₁₅Si₅Nb₂.₅Y₅', '{\"hardness\": 3400.0, \"strength\": 1050.0, \"corrosion_resistance\": 2.5}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-096', '铁基非晶耐腐蚀合金', '优化版 v3.6', 2, 'Fe₇₁B₁₅Si₅Nb₄Zr₅', '{\"hardness\": 3550.0, \"strength\": 1120.0, \"corrosion_resistance\": 3.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-097', '铁基非晶高强度合金', '生产版 v2.4', 2, 'Fe₇₁B₁₅Si₅Nb₄Hf₅', '{\"hardness\": 3580.0, \"strength\": 1130.0, \"corrosion_resistance\": 3.2}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-098', '铁基非晶高强度合金', '生产版 v5.0', 2, 'Fe₇₁B₁₅Si₅Nb₄Ti₅', '{\"hardness\": 3450.0, \"strength\": 1080.0, \"corrosion_resistance\": 2.8}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-099', '铁基非晶高强度合金', '工业版 v3.7', 2, 'Fe₆₅Cr₁₀Mo₅B₁₅Si₅', '{\"hardness\": 3500.0, \"strength\": 1220.0, \"corrosion_resistance\": 18.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-100', '铁基非晶高强度合金', '生产版 v4.4', 2, 'Fe₆₅Cr₁₀W₅B₁₅Si₅', '{\"hardness\": 3550.0, \"strength\": 1240.0, \"corrosion_resistance\": 19.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-101', '铁基非晶高强度合金', '农业版 v1.4', 2, 'Fe₅₅Cr₁₀Co₁₀B₁₅Si₁₀', '{\"hardness\": 3200.0, \"strength\": 1150.0, \"corrosion_resistance\": 16.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-102', '铁基非晶高强度合金', '生产版 v5.6', 2, 'Fe₅₅Cr₁₀Ni₁₀B₁₅Si₁₀', '{\"hardness\": 3100.0, \"strength\": 1100.0, \"corrosion_resistance\": 15.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-103', '铁基非晶耐腐蚀合金', '工业版 v1.4', 2, 'Fe₆₂Cr₁₀Mn₃B₁₅Si₁₀', '{\"hardness\": 3000.0, \"strength\": 1050.0, \"corrosion_resistance\": 12.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-104', '铁基非晶高密度合金', '生产版 v5.6', 2, 'Fe₇₇B₁₂Si₅P₃C₃', '{\"hardness\": 2750.0, \"strength\": 820.0, \"corrosion_resistance\": 1.1}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-105', '铁基非晶耐腐蚀合金', '优化版 v4.6', 2, 'Fe₇₆B₁₂Si₅P₃Al₄', '{\"hardness\": 2650.0, \"strength\": 800.0, \"corrosion_resistance\": 1.5}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-106', '铁基非晶耐腐蚀合金', '工业版 v5.4', 2, 'Fe₈₀B₁₀P₇C₃', '{\"hardness\": 2600.0, \"strength\": 780.0, \"corrosion_resistance\": 1.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-107', '铁基非晶高密度合金', '优化版 v4.0', 2, 'Fe₇₉B₁₂Si₅P₄', '{\"hardness\": 2900.0, \"strength\": 900.0, \"corrosion_resistance\": 1.3}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-108', '铁基非晶高密度合金', '优化版 v4.6', 2, 'Fe₇₀Cr₁₀B₁₀P₁₀', '{\"hardness\": 3000.0, \"strength\": 950.0, \"corrosion_resistance\": 12.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-109', '铁基非晶耐腐蚀合金', '农业版 v2.3', 2, 'Fe₇₈Mo₂B₁₀P₁₀', '{\"hardness\": 3100.0, \"strength\": 1000.0, \"corrosion_resistance\": 2.5}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-110', '铁基非晶耐腐蚀合金', '农业版 v1.1', 2, 'Fe₇₆Nb₄B₁₀P₁₀', '{\"hardness\": 3200.0, \"strength\": 1020.0, \"corrosion_resistance\": 2.2}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-111', '铁基非晶高密度合金', '工业版 v1.2', 2, 'Fe₇₈Ga₂B₁₀P₁₀', '{\"hardness\": 2650.0, \"strength\": 810.0, \"corrosion_resistance\": 1.8}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-112', '铁基非晶高密度合金', '工业版 v2.1', 2, 'Fe₇₈Ge₂B₁₀P₁₀', '{\"hardness\": 2700.0, \"strength\": 830.0, \"corrosion_resistance\": 2.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-113', '铁基非晶高密度合金', '优化版 v1.2', 2, 'Fe₇₈Al₂B₁₀P₁₀', '{\"hardness\": 2550.0, \"strength\": 770.0, \"corrosion_resistance\": 1.6}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-114', '铁基非晶高密度合金', '优化版 v5.8', 2, 'Fe₆₅Cr₁₂Mo₅B₁₂C₆', '{\"hardness\": 2800.0, \"strength\": 1300.0, \"corrosion_resistance\": 25.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-115', '铁基非晶高强度合金', '农业版 v4.0', 2, 'Fe₆₂Cr₁₂Mo₅P₁₀C₅B₆', '{\"hardness\": 2700.0, \"strength\": 1100.0, \"corrosion_resistance\": 20.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-116', '铁基非晶高密度合金', '优化版 v1.6', 2, 'Fe₆₁Cr₁₂Mo₅P₁₀Si₅B₇', '{\"hardness\": 2900.0, \"strength\": 1150.0, \"corrosion_resistance\": 22.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-117', '铁基非晶耐腐蚀合金', '生产版 v1.9', 2, 'Fe₄₀Ni₄₀B₁₂Si₈', '{\"hardness\": 2000.0, \"strength\": 750.0, \"corrosion_resistance\": 5.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-118', '铁基非晶高强度合金', '农业版 v4.7', 2, 'Fe₃₆Ni₃₆B₁₅Si₅Nb₈', '{\"hardness\": 2500.0, \"strength\": 950.0, \"corrosion_resistance\": 6.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-119', '铁基非晶高强度合金', '生产版 v5.7', 2, 'Fe₄₀Co₄₀B₁₂Si₈', '{\"hardness\": 2200.0, \"strength\": 800.0, \"corrosion_resistance\": 5.5}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-120', '铁基非晶耐腐蚀合金', '工业版 v1.6', 2, 'Fe₃₆Co₃₆B₁₅Si₅Nb₈', '{\"hardness\": 2700.0, \"strength\": 1000.0, \"corrosion_resistance\": 6.5}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-121', '铁基非晶高密度合金', '工业版 v5.6', 2, 'Fe₃₆Co₃₆B₁₅Si₅Zr₈', '{\"hardness\": 2600.0, \"strength\": 980.0, \"corrosion_resistance\": 4.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-122', '铁基非晶高强度合金', '优化版 v3.4', 2, 'Fe₂₅Ni₂₅Co₂₅B₁₅Si₁₀', '{\"hardness\": 2300.0, \"strength\": 850.0, \"corrosion_resistance\": 6.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-123', '铁基非晶高密度合金', '农业版 v3.6', 2, 'Fe₂₀Ni₂₀Co₂₀B₂₀Si₁₀Nb₁₀', '{\"hardness\": 3000.0, \"strength\": 1100.0, \"corrosion_resistance\": 8.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-124', '铁基非晶高强度合金', '农业版 v4.8', 2, 'Fe₂₀Ni₂₀Co₂₀B₂₀Si₁₀Zr₁₀', '{\"hardness\": 2900.0, \"strength\": 1050.0, \"corrosion_resistance\": 5.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-125', '铁基非晶高密度合金', '优化版 v4.2', 2, 'Fe₅₀Mn₁₀Cr₁₅Mo₅B₁₀C₁₀', '{\"hardness\": 2500.0, \"strength\": 1000.0, \"corrosion_resistance\": 8.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-126', '铁基非晶高密度合金', '农业版 v2.9', 2, 'Fe₄₈Mn₁₀Cr₁₅Mo₅P₁₀C₆B₆', '{\"hardness\": 2400.0, \"strength\": 950.0, \"corrosion_resistance\": 7.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-127', '铁基非晶耐腐蚀合金', '农业版 v5.3', 2, 'Fe₇₅Ga₅P₁₀C₅B₅', '{\"hardness\": 1800.0, \"strength\": 600.0, \"corrosion_resistance\": 1.5}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-128', '铁基非晶高强度合金', '工业版 v2.7', 2, 'Fe₇₃Ga₅P₁₀Si₅B₇', '{\"hardness\": 1850.0, \"strength\": 620.0, \"corrosion_resistance\": 1.7}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-129', '铁基非晶高密度合金', '工业版 v4.0', 2, 'Fe₈₀Nd₁₀B₁₀', '{\"hardness\": 1500.0, \"strength\": 500.0, \"corrosion_resistance\": 0.5}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-130', '铁基非晶高强度合金', '生产版 v2.4', 2, 'Fe₈₀Dy₁₀B₁₀', '{\"hardness\": 1550.0, \"strength\": 520.0, \"corrosion_resistance\": 0.5}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-131', '铁基非晶高密度合金', '工业版 v2.9', 2, 'Fe₈₀Pr₁₀B₁₀', '{\"hardness\": 1480.0, \"strength\": 480.0, \"corrosion_resistance\": 0.5}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-132', '铁基非晶耐腐蚀合金', '农业版 v2.0', 2, 'Fe₈₀Tb₁₀B₁₀', '{\"hardness\": 1530.0, \"strength\": 510.0, \"corrosion_resistance\": 0.5}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-133', '铁基非晶耐腐蚀合金', '优化版 v5.7', 2, 'Fe₈₅Zr₅B₁₀', '{\"hardness\": 3200.0, \"strength\": 1050.0, \"corrosion_resistance\": 2.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-134', '铁基非晶耐腐蚀合金', '优化版 v2.1', 2, 'Fe₈₅Hf₅B₁₀', '{\"hardness\": 3250.0, \"strength\": 1080.0, \"corrosion_resistance\": 2.2}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-135', '铁基非晶高强度合金', '生产版 v3.5', 2, 'Fe₈₃Nb₇B₁₀', '{\"hardness\": 3350.0, \"strength\": 1120.0, \"corrosion_resistance\": 2.5}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-136', '铁基非晶耐腐蚀合金', '农业版 v5.3', 2, 'Fe₈₅Ti₅B₁₀', '{\"hardness\": 3100.0, \"strength\": 1000.0, \"corrosion_resistance\": 1.8}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-137', '铁基非晶高密度合金', '生产版 v3.1', 2, 'Fe₈₅V₅B₁₀', '{\"hardness\": 3050.0, \"strength\": 980.0, \"corrosion_resistance\": 1.7}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-138', '铁基非晶高强度合金', '生产版 v1.7', 2, 'Fe₇₅Cr₁₅B₁₀', '{\"hardness\": 2800.0, \"strength\": 950.0, \"corrosion_resistance\": 10.0}', '2025-10-31 11:32:05', '2025-10-31 11:32:05');
INSERT INTO `amorphous_alloys` VALUES ('AMA-139', '铜基非晶高强度合金', '农业版 v5.5', 3, 'Cu₅₀Zr₄₃Al₇', '{\"hardness\": 2050.0, \"strength\": 550.0, \"corrosion_resistance\": 2.0}', '2025-10-31 11:34:31', '2025-10-31 11:34:31');
INSERT INTO `amorphous_alloys` VALUES ('AMA-140', '铜基非晶高强度合金', '优化版 v2.5', 3, 'Cu₅₀Zr₄₀Ti₁₀', '{\"hardness\": 2100.0, \"strength\": 570.0, \"corrosion_resistance\": 1.8}', '2025-10-31 11:34:31', '2025-10-31 11:34:31');
INSERT INTO `amorphous_alloys` VALUES ('AMA-141', '铜基非晶耐腐蚀合金', '农业版 v3.5', 3, 'Cu₅₀Zr₃₅Hf₁₅', '{\"hardness\": 2150.0, \"strength\": 590.0, \"corrosion_resistance\": 2.2}', '2025-10-31 11:34:31', '2025-10-31 11:34:31');
INSERT INTO `amorphous_alloys` VALUES ('AMA-142', '铜基非晶高强度合金', '生产版 v2.3', 3, 'Cu₄₈Zr₄₂Al₇Ag₃', '{\"hardness\": 2000.0, \"strength\": 540.0, \"corrosion_resistance\": 2.5}', '2025-10-31 11:34:31', '2025-10-31 11:34:31');
INSERT INTO `amorphous_alloys` VALUES ('AMA-143', '铜基非晶高密度合金', '农业版 v2.4', 3, 'Cu₄₈Zr₄₂Al₇Y₃', '{\"hardness\": 1950.0, \"strength\": 530.0, \"corrosion_resistance\": 2.8}', '2025-10-31 11:34:31', '2025-10-31 11:34:31');
INSERT INTO `amorphous_alloys` VALUES ('AMA-144', '铜基非晶高强度合金', '优化版 v3.0', 3, 'Cu₄₆Zr₄₂Al₇Ti₅', '{\"hardness\": 2150.0, \"strength\": 580.0, \"corrosion_resistance\": 2.0}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-145', '铜基非晶高密度合金', '生产版 v5.5', 3, 'Cu₄₆Zr₄₂Al₇Ni₅', '{\"hardness\": 2080.0, \"strength\": 560.0, \"corrosion_resistance\": 2.3}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-146', '铜基非晶高密度合金', '优化版 v5.5', 3, 'Cu₄₆Zr₄₂Al₇Co₅', '{\"hardness\": 2060.0, \"strength\": 555.0, \"corrosion_resistance\": 2.4}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-147', '铜基非晶耐腐蚀合金', '农业版 v1.5', 3, 'Cu₄₆Zr₄₂Al₇Fe₅', '{\"hardness\": 2120.0, \"strength\": 575.0, \"corrosion_resistance\": 1.9}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-148', '铜基非晶高强度合金', '优化版 v4.7', 3, 'Cu₄₆Zr₄₂Al₇Nb₅', '{\"hardness\": 2200.0, \"strength\": 600.0, \"corrosion_resistance\": 2.6}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-149', '铜基非晶高密度合金', '生产版 v1.3', 3, 'Cu₄₆Zr₄₂Al₇Ta₅', '{\"hardness\": 2220.0, \"strength\": 610.0, \"corrosion_resistance\": 2.7}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-150', '铜基非晶高强度合金', '工业版 v3.2', 3, 'Cu₄₆Zr₄₀Ti₇Ni₇', '{\"hardness\": 2120.0, \"strength\": 570.0, \"corrosion_resistance\": 2.1}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-151', '铜基非晶高密度合金', '优化版 v5.3', 3, 'Cu₄₈Zr₄₀Ti₁₀Sn₂', '{\"hardness\": 2050.0, \"strength\": 545.0, \"corrosion_resistance\": 2.0}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-152', '铜基非晶耐腐蚀合金', '工业版 v5.9', 3, 'Cu₄₆Zr₃₆Ti₁₀Be₈', '{\"hardness\": 2300.0, \"strength\": 620.0, \"corrosion_resistance\": 1.5}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-153', '铜基非晶高密度合金', '工业版 v4.6', 3, 'Cu₄₆Zr₄₀Ti₇Nb₇', '{\"hardness\": 2180.0, \"strength\": 590.0, \"corrosion_resistance\": 2.4}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-154', '铜基非晶高强度合金', '生产版 v1.8', 3, 'Cu₄₈Zr₄₀Ti₁₀Si₂', '{\"hardness\": 2080.0, \"strength\": 560.0, \"corrosion_resistance\": 1.9}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-155', '铜基非晶耐腐蚀合金', '农业版 v3.1', 3, 'Cu₄₆Zr₃₅Hf₁₀Ti₉', '{\"hardness\": 2200.0, \"strength\": 600.0, \"corrosion_resistance\": 2.3}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-156', '铜基非晶耐腐蚀合金', '优化版 v4.2', 3, 'Cu₄₈Zr₃₅Hf₁₀Al₇', '{\"hardness\": 2180.0, \"strength\": 590.0, \"corrosion_resistance\": 2.4}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-157', '铜基非晶耐腐蚀合金', '工业版 v5.9', 3, 'Cu₅₀Hf₄₂Al₈', '{\"hardness\": 2200.0, \"strength\": 600.0, \"corrosion_resistance\": 2.5}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-158', '铜基非晶耐腐蚀合金', '工业版 v4.2', 3, 'Cu₅₀Hf₃₅Ti₁₅', '{\"hardness\": 2250.0, \"strength\": 610.0, \"corrosion_resistance\": 2.2}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-159', '铜基非晶高强度合金', '农业版 v1.7', 3, 'Cu₄₆Ti₁₂Zr₁₂Ni₁₃Sn₁₁', '{\"hardness\": 1950.0, \"strength\": 520.0, \"corrosion_resistance\": 2.2}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-160', '铜基非晶高强度合金', '工业版 v3.9', 3, 'Cu₄₈Ti₁₂Zr₁₂Ni₁₃Si₁₅', '{\"hardness\": 1900.0, \"strength\": 510.0, \"corrosion_resistance\": 2.0}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-161', '铜基非晶高强度合金', '优化版 v4.4', 3, 'Cu₄₂Ti₁₂Zr₁₂Ni₁₂Be₂₂', '{\"hardness\": 2350.0, \"strength\": 650.0, \"corrosion_resistance\": 1.6}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-162', '铜基非晶高密度合金', '农业版 v1.9', 3, 'Cu₃₀Ni₁₅Zr₃₀Ti₁₀Al₅', '{\"hardness\": 2000.0, \"strength\": 540.0, \"corrosion_resistance\": 2.8}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-163', '铜基非晶高密度合金', '农业版 v4.7', 3, 'Cu₃₀Ni₁₅Zr₃₀Ti₁₀Sn₅', '{\"hardness\": 1950.0, \"strength\": 530.0, \"corrosion_resistance\": 2.5}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-164', '铜基非晶高密度合金', '生产版 v4.8', 3, 'Cu₃₀Ni₁₅Zr₃₀Ti₁₀Nb₅', '{\"hardness\": 2100.0, \"strength\": 570.0, \"corrosion_resistance\": 3.0}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-165', '铜基非晶高密度合金', '优化版 v2.4', 3, 'Cu₄₀Al₁₀Ni₂₀Zr₃₀', '{\"hardness\": 1800.0, \"strength\": 500.0, \"corrosion_resistance\": 2.5}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-166', '铜基非晶耐腐蚀合金', '工业版 v5.3', 3, 'Cu₄₀Al₁₀Fe₂₀Zr₃₀', '{\"hardness\": 1850.0, \"strength\": 520.0, \"corrosion_resistance\": 1.8}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-167', '铜基非晶高密度合金', '农业版 v5.1', 3, 'Cu₄₀Al₁₀Co₂₀Zr₃₀', '{\"hardness\": 1820.0, \"strength\": 510.0, \"corrosion_resistance\": 2.0}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-168', '铜基非晶高密度合金', '生产版 v5.4', 3, 'Cu₄₀Al₁₀Y₁₀Zr₄₀', '{\"hardness\": 1700.0, \"strength\": 480.0, \"corrosion_resistance\": 3.0}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-169', '铜基非晶耐腐蚀合金', '工业版 v5.9', 3, 'Cu₄₀Al₁₀Gd₁₀Zr₄₀', '{\"hardness\": 1720.0, \"strength\": 490.0, \"corrosion_resistance\": 3.2}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-170', '铜基非晶耐腐蚀合金', '优化版 v3.2', 3, 'Cu₄₀Al₁₀Dy₁₀Zr₄₀', '{\"hardness\": 1730.0, \"strength\": 495.0, \"corrosion_resistance\": 3.2}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-171', '铜基非晶高密度合金', '优化版 v1.9', 3, 'Cu₄₀Al₁₀Er₁₀Zr₄₀', '{\"hardness\": 1750.0, \"strength\": 500.0, \"corrosion_resistance\": 3.3}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-172', '铜基非晶耐腐蚀合金', '农业版 v4.4', 3, 'Cu₄₀Al₁₀Nb₁₀Zr₄₀', '{\"hardness\": 1900.0, \"strength\": 550.0, \"corrosion_resistance\": 2.8}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-173', '铜基非晶高强度合金', '优化版 v5.4', 3, 'Cu₄₀Al₁₀Ta₁₀Zr₄₀', '{\"hardness\": 1920.0, \"strength\": 560.0, \"corrosion_resistance\": 2.9}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-174', '铜基非晶耐腐蚀合金', '优化版 v1.7', 3, 'Cu₄₀Al₁₀Mo₁₀Zr₄₀', '{\"hardness\": 1950.0, \"strength\": 570.0, \"corrosion_resistance\": 2.5}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-175', '铜基非晶耐腐蚀合金', '农业版 v4.2', 3, 'Cu₄₀Al₁₀W₁₀Zr₄₀', '{\"hardness\": 1980.0, \"strength\": 580.0, \"corrosion_resistance\": 2.4}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-176', '铜基非晶高密度合金', '优化版 v1.9', 3, 'Cu₄₀Al₁₀Cr₁₀Zr₄₀', '{\"hardness\": 1880.0, \"strength\": 540.0, \"corrosion_resistance\": 3.5}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-177', '铜基非晶耐腐蚀合金', '生产版 v1.4', 3, 'Cu₄₀Al₁₀Mn₁₀Zr₄₀', '{\"hardness\": 1750.0, \"strength\": 510.0, \"corrosion_resistance\": 1.5}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-178', '铜基非晶高强度合金', '工业版 v4.4', 3, 'Cu₄₀Al₁₀V₁₀Zr₄₀', '{\"hardness\": 1850.0, \"strength\": 530.0, \"corrosion_resistance\": 1.8}', '2025-10-31 11:34:32', '2025-10-31 11:34:32');
INSERT INTO `amorphous_alloys` VALUES ('AMA-179', '镁基非晶高密度合金', '工业版 v4.1', 4, 'Mg₆₅Cu₂₅Y₁₀', '{\"hardness\": 800.0, \"strength\": 250.0, \"corrosion_resistance\": 1.5}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-180', '镁基非晶高强度合金', '生产版 v1.6', 4, 'Mg₆₅Cu₂₅Gd₁₀', '{\"hardness\": 820.0, \"strength\": 260.0, \"corrosion_resistance\": 1.6}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-181', '镁基非晶高密度合金', '生产版 v5.8', 4, 'Mg₆₅Cu₂₅Dy₁₀', '{\"hardness\": 830.0, \"strength\": 265.0, \"corrosion_resistance\": 1.6}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-182', '镁基非晶高强度合金', '农业版 v1.5', 4, 'Mg₇₀Cu₂₀Ni₁₀', '{\"hardness\": 750.0, \"strength\": 230.0, \"corrosion_resistance\": 1.0}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-183', '镁基非晶高强度合金', '优化版 v2.3', 4, 'Mg₆₅Cu₂₀Ag₁₅', '{\"hardness\": 780.0, \"strength\": 240.0, \"corrosion_resistance\": 1.8}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-184', '镁基非晶高强度合金', '生产版 v1.2', 4, 'Mg₆₀Cu₂₀Y₁₀Zn₁₀', '{\"hardness\": 850.0, \"strength\": 280.0, \"corrosion_resistance\": 1.7}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-185', '镁基非晶高密度合金', '生产版 v4.6', 4, 'Mg₆₀Cu₂₀Gd₁₀Zn₁₀', '{\"hardness\": 870.0, \"strength\": 290.0, \"corrosion_resistance\": 1.8}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-186', '镁基非晶高密度合金', '农业版 v1.1', 4, 'Mg₆₀Cu₂₀Dy₁₀Zn₁₀', '{\"hardness\": 880.0, \"strength\": 295.0, \"corrosion_resistance\": 1.8}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-187', '镁基非晶高强度合金', '生产版 v2.1', 4, 'Mg₆₀Cu₂₀Y₁₀Ag₁₀', '{\"hardness\": 830.0, \"strength\": 270.0, \"corrosion_resistance\": 2.0}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-188', '镁基非晶耐腐蚀合金', '优化版 v4.8', 4, 'Mg₆₀Cu₂₀Gd₁₀Ag₁₀', '{\"hardness\": 850.0, \"strength\": 275.0, \"corrosion_resistance\": 2.1}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-189', '镁基非晶耐腐蚀合金', '优化版 v2.7', 4, 'Mg₆₂Cu₂₀Y₁₀Ni₈', '{\"hardness\": 780.0, \"strength\": 255.0, \"corrosion_resistance\": 1.4}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-190', '镁基非晶高密度合金', '农业版 v5.1', 4, 'Mg₆₂Cu₂₀Gd₁₀Ni₈', '{\"hardness\": 800.0, \"strength\": 265.0, \"corrosion_resistance\": 1.5}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-191', '镁基非晶耐腐蚀合金', '优化版 v3.4', 4, 'Mg₇₅Ni₁₀Y₁₅', '{\"hardness\": 700.0, \"strength\": 220.0, \"corrosion_resistance\": 1.2}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-192', '镁基非晶耐腐蚀合金', '优化版 v5.6', 4, 'Mg₇₅Ni₁₀Gd₁₅', '{\"hardness\": 720.0, \"strength\": 230.0, \"corrosion_resistance\": 1.3}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-193', '镁基非晶高强度合金', '工业版 v2.8', 4, 'Mg₇₅Ni₁₀Dy₁₅', '{\"hardness\": 730.0, \"strength\": 235.0, \"corrosion_resistance\": 1.3}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-194', '镁基非晶高强度合金', '优化版 v1.2', 4, 'Mg₇₅Ni₁₀Nd₁₅', '{\"hardness\": 710.0, \"strength\": 225.0, \"corrosion_resistance\": 1.2}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-195', '镁基非晶高密度合金', '优化版 v3.9', 4, 'Mg₆₀Zn₃₅Ca₅', '{\"hardness\": 600.0, \"strength\": 180.0, \"corrosion_resistance\": 0.8}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-196', '镁基非晶高强度合金', '农业版 v1.6', 4, 'Mg₇₀Zn₂₅Ce₅', '{\"hardness\": 650.0, \"strength\": 200.0, \"corrosion_resistance\": 1.0}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-197', '镁基非晶高密度合金', '优化版 v5.2', 4, 'Mg₇₀Zn₂₅La₅', '{\"hardness\": 640.0, \"strength\": 195.0, \"corrosion_resistance\": 1.0}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-198', '镁基非晶高强度合金', '生产版 v5.2', 4, 'Mg₇₀Zn₂₅Nd₅', '{\"hardness\": 660.0, \"strength\": 205.0, \"corrosion_resistance\": 1.1}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-199', '镁基非晶耐腐蚀合金', '生产版 v3.7', 4, 'Mg₇₀Zn₂₅Y₅', '{\"hardness\": 680.0, \"strength\": 215.0, \"corrosion_resistance\": 1.3}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-200', '镁基非晶高密度合金', '工业版 v2.7', 4, 'Mg₇₀Zn₂₅Gd₅', '{\"hardness\": 690.0, \"strength\": 220.0, \"corrosion_resistance\": 1.4}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-201', '镁基非晶高强度合金', '生产版 v3.0', 4, 'Mg₆₅Ca₁₀Cu₂₅', '{\"hardness\": 720.0, \"strength\": 240.0, \"corrosion_resistance\": 0.7}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-202', '镁基非晶高密度合金', '工业版 v3.2', 4, 'Mg₇₀Ca₁₀Ni₂₀', '{\"hardness\": 650.0, \"strength\": 210.0, \"corrosion_resistance\": 0.6}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-203', '镁基非晶耐腐蚀合金', '优化版 v4.8', 4, 'Mg₇₅Ca₁₀Y₁₅', '{\"hardness\": 580.0, \"strength\": 170.0, \"corrosion_resistance\": 1.0}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-204', '镁基非晶高密度合金', '优化版 v2.6', 4, 'Mg₇₅Ca₁₀Gd₁₅', '{\"hardness\": 590.0, \"strength\": 175.0, \"corrosion_resistance\": 1.1}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-205', '镁基非晶高强度合金', '优化版 v5.0', 4, 'Mg₇₀Ca₁₀Ag₂₀', '{\"hardness\": 600.0, \"strength\": 190.0, \"corrosion_resistance\": 1.5}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-206', '镁基非晶耐腐蚀合金', '工业版 v1.9', 4, 'Mg₇₀Ca₁₀Zn₂₀', '{\"hardness\": 550.0, \"strength\": 160.0, \"corrosion_resistance\": 0.7}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-207', '镁基非晶高强度合金', '农业版 v4.2', 4, 'Mg₆₇Y₁₀Zn₂₀Ca₃', '{\"hardness\": 720.0, \"strength\": 240.0, \"corrosion_resistance\": 1.5}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-208', '镁基非晶高强度合金', '工业版 v5.3', 4, 'Mg₆₇Gd₁₀Zn₂₀Ca₃', '{\"hardness\": 740.0, \"strength\": 250.0, \"corrosion_resistance\": 1.6}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-209', '镁基非晶高强度合金', '生产版 v4.9', 4, 'Mg₆₇Dy₁₀Zn₂₀Ca₃', '{\"hardness\": 750.0, \"strength\": 255.0, \"corrosion_resistance\": 1.6}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-210', '镁基非晶耐腐蚀合金', '农业版 v3.6', 4, 'Mg₆₇Nd₁₀Zn₂₀Ca₃', '{\"hardness\": 710.0, \"strength\": 235.0, \"corrosion_resistance\": 1.4}', '2025-10-31 11:35:08', '2025-10-31 11:35:08');
INSERT INTO `amorphous_alloys` VALUES ('AMA-211', '镁基非晶高密度合金', '优化版 v1.8', 4, 'Mg₆₀Y₁₀Cu₂₀Ag₁₀', '{\"hardness\": 860.0, \"strength\": 290.0, \"corrosion_resistance\": 2.2}', '2025-10-31 11:35:09', '2025-10-31 11:35:09');
INSERT INTO `amorphous_alloys` VALUES ('AMA-212', '镁基非晶高密度合金', '工业版 v3.6', 4, 'Mg₆₀Gd₁₀Cu₂₀Ag₁₀', '{\"hardness\": 880.0, \"strength\": 300.0, \"corrosion_resistance\": 2.3}', '2025-10-31 11:35:09', '2025-10-31 11:35:09');
INSERT INTO `amorphous_alloys` VALUES ('AMA-213', '镁基非晶耐腐蚀合金', '农业版 v3.5', 4, 'Mg₆₀Dy₁₀Cu₂₀Ag₁₀', '{\"hardness\": 890.0, \"strength\": 305.0, \"corrosion_resistance\": 2.3}', '2025-10-31 11:35:09', '2025-10-31 11:35:09');
INSERT INTO `amorphous_alloys` VALUES ('AMA-214', '镁基非晶高密度合金', '生产版 v2.5', 4, 'Mg₆₀Nd₁₀Cu₂₀Ag₁₀', '{\"hardness\": 840.0, \"strength\": 280.0, \"corrosion_resistance\": 2.0}', '2025-10-31 11:35:09', '2025-10-31 11:35:09');
INSERT INTO `amorphous_alloys` VALUES ('AMA-215', '镁基非晶高密度合金', '优化版 v1.0', 4, 'Mg₆₀Y₁₀Cu₂₀Ga₁₀', '{\"hardness\": 820.0, \"strength\": 270.0, \"corrosion_resistance\": 1.8}', '2025-10-31 11:35:09', '2025-10-31 11:35:09');
INSERT INTO `amorphous_alloys` VALUES ('AMA-216', '镁基非晶高密度合金', '工业版 v2.7', 4, 'Mg₆₀Gd₁₀Cu₂₀Ga₁₀', '{\"hardness\": 840.0, \"strength\": 275.0, \"corrosion_resistance\": 1.9}', '2025-10-31 11:35:09', '2025-10-31 11:35:09');
INSERT INTO `amorphous_alloys` VALUES ('AMA-217', '镁基非晶高强度合金', '农业版 v1.6', 4, 'Mg₆₀Cu₂₀Y₁₀Ge₁₀', '{\"hardness\": 870.0, \"strength\": 295.0, \"corrosion_resistance\": 1.5}', '2025-10-31 11:35:09', '2025-10-31 11:35:09');
INSERT INTO `amorphous_alloys` VALUES ('AMA-218', '镁基非晶高强度合金', '农业版 v1.8', 4, 'Mg₆₀Cu₂₀Gd₁₀Ge₁₀', '{\"hardness\": 890.0, \"strength\": 305.0, \"corrosion_resistance\": 1.6}', '2025-10-31 11:35:09', '2025-10-31 11:35:09');
INSERT INTO `amorphous_alloys` VALUES ('AMA-219', '钯基非晶高强度合金', '农业版 v4.5', 5, 'Pd₇₇.₅Cu₆Si₁₆.₅', '{\"hardness\": 1500.0, \"strength\": 400.0, \"corrosion_resistance\": 8.0}', '2025-10-31 11:39:12', '2025-10-31 11:39:12');
INSERT INTO `amorphous_alloys` VALUES ('AMA-220', '钯基非晶耐腐蚀合金', '工业版 v3.6', 5, 'Pd₄₀Ni₄₀P₂₀', '{\"hardness\": 1600.0, \"strength\": 450.0, \"corrosion_resistance\": 6.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-221', '钯基非晶耐腐蚀合金', '生产版 v3.2', 5, 'Pd₄₃Ni₁₀Cu₂₇P₂₀', '{\"hardness\": 1700.0, \"strength\": 480.0, \"corrosion_resistance\": 7.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-222', '钯基非晶高密度合金', '优化版 v2.2', 5, 'Pd₇₅Ag₅Si₂₀', '{\"hardness\": 1450.0, \"strength\": 380.0, \"corrosion_resistance\": 9.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-223', '钯基非晶耐腐蚀合金', '优化版 v1.7', 5, 'Pd₄₀Ag₄₀P₂₀', '{\"hardness\": 1550.0, \"strength\": 420.0, \"corrosion_resistance\": 8.5}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-224', '钯基非晶高强度合金', '工业版 v5.5', 5, 'Pd₄₀Ag₄₀Ge₂₀', '{\"hardness\": 1480.0, \"strength\": 390.0, \"corrosion_resistance\": 8.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-225', '钯基非晶高强度合金', '优化版 v1.4', 5, 'Pd₇₅Au₅Si₂₀', '{\"hardness\": 1520.0, \"strength\": 410.0, \"corrosion_resistance\": 10.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-226', '钯基非晶耐腐蚀合金', '工业版 v1.9', 5, 'Pd₄₀Au₄₀P₂₀', '{\"hardness\": 1580.0, \"strength\": 430.0, \"corrosion_resistance\": 9.5}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-227', '钯基非晶高强度合金', '工业版 v5.4', 5, 'Pd₄₀Pt₄₀P₂₀', '{\"hardness\": 1650.0, \"strength\": 460.0, \"corrosion_resistance\": 15.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-228', '钯基非晶耐腐蚀合金', '生产版 v4.8', 5, 'Pd₄₀Pt₂₀Cu₂₀P₂₀', '{\"hardness\": 1720.0, \"strength\": 490.0, \"corrosion_resistance\": 14.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-229', '钯基非晶高密度合金', '优化版 v5.4', 5, 'Pd₄₀Pt₂₀Ni₂₀P₂₀', '{\"hardness\": 1750.0, \"strength\": 500.0, \"corrosion_resistance\": 13.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-230', '钯基非晶高强度合金', '生产版 v5.9', 5, 'Pd₄₀Fe₄₀P₂₀', '{\"hardness\": 1800.0, \"strength\": 520.0, \"corrosion_resistance\": 4.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-231', '钯基非晶耐腐蚀合金', '工业版 v5.0', 5, 'Pd₄₀Co₄₀P₂₀', '{\"hardness\": 1780.0, \"strength\": 510.0, \"corrosion_resistance\": 5.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-232', '钯基非晶高密度合金', '优化版 v1.8', 5, 'Pd₄₀Rh₄₀P₂₀', '{\"hardness\": 1700.0, \"strength\": 480.0, \"corrosion_resistance\": 16.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-233', '钯基非晶高强度合金', '生产版 v1.4', 5, 'Pd₄₀Ru₄₀P₂₀', '{\"hardness\": 1850.0, \"strength\": 540.0, \"corrosion_resistance\": 12.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-234', '钯基非晶高强度合金', '优化版 v5.7', 5, 'Pd₄₀Ir₄₀P₂₀', '{\"hardness\": 1750.0, \"strength\": 500.0, \"corrosion_resistance\": 17.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-235', '钯基非晶耐腐蚀合金', '生产版 v4.8', 5, 'Pd₄₂Cu₂₈Ni₁₀P₂₀', '{\"hardness\": 1680.0, \"strength\": 470.0, \"corrosion_resistance\": 7.5}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-236', '钯基非晶耐腐蚀合金', '生产版 v3.7', 5, 'Pd₄₂Cu₂₈Co₁₀P₂₀', '{\"hardness\": 1660.0, \"strength\": 465.0, \"corrosion_resistance\": 7.8}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-237', '钯基非晶高密度合金', '优化版 v5.7', 5, 'Pd₄₀Ni₃₀Fe₁₀P₂₀', '{\"hardness\": 1750.0, \"strength\": 510.0, \"corrosion_resistance\": 5.5}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-238', '钯基非晶高密度合金', '工业版 v1.9', 5, 'Pd₄₀Ag₃₀Cu₁₀P₂₀', '{\"hardness\": 1600.0, \"strength\": 440.0, \"corrosion_resistance\": 9.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-239', '钯基非晶高强度合金', '生产版 v1.3', 5, 'Pd₄₀Ag₃₀Ni₁₀P₂₀', '{\"hardness\": 1620.0, \"strength\": 450.0, \"corrosion_resistance\": 8.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-240', '钯基非晶耐腐蚀合金', '生产版 v5.1', 5, 'Pd₄₀Au₃₀Cu₁₀P₂₀', '{\"hardness\": 1650.0, \"strength\": 460.0, \"corrosion_resistance\": 10.5}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-241', '钯基非晶高强度合金', '生产版 v5.9', 5, 'Pd₄₀Au₃₀Ni₁₀P₂₀', '{\"hardness\": 1670.0, \"strength\": 470.0, \"corrosion_resistance\": 9.8}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-242', '钯基非晶高密度合金', '工业版 v4.5', 5, 'Pd₆₀Zr₁₀P₃₀', '{\"hardness\": 1900.0, \"strength\": 580.0, \"corrosion_resistance\": 6.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-243', '钯基非晶高强度合金', '工业版 v3.4', 5, 'Pd₅₀Zr₂₀Cu₁₀P₂₀', '{\"hardness\": 1850.0, \"strength\": 560.0, \"corrosion_resistance\": 6.5}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-244', '钯基非晶耐腐蚀合金', '优化版 v4.3', 5, 'Pd₆₀Ti₁₀P₃₀', '{\"hardness\": 1800.0, \"strength\": 550.0, \"corrosion_resistance\": 5.5}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-245', '钯基非晶耐腐蚀合金', '工业版 v3.5', 5, 'Pd₅₀Ti₂₀Cu₁₀P₂₀', '{\"hardness\": 1780.0, \"strength\": 540.0, \"corrosion_resistance\": 6.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-246', '钯基非晶耐腐蚀合金', '农业版 v3.5', 5, 'Pd₆₀Y₁₀P₃₀', '{\"hardness\": 1550.0, \"strength\": 470.0, \"corrosion_resistance\": 4.5}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-247', '钯基非晶高密度合金', '工业版 v5.0', 5, 'Pd₅₀Y₂₀Cu₁₀P₂₀', '{\"hardness\": 1600.0, \"strength\": 490.0, \"corrosion_resistance\": 5.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-248', '钯基非晶高强度合金', '工业版 v3.5', 5, 'Pd₆₀Gd₁₀P₃₀', '{\"hardness\": 1580.0, \"strength\": 480.0, \"corrosion_resistance\": 4.8}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-249', '钯基非晶高强度合金', '生产版 v5.6', 5, 'Pd₅₀Gd₂₀Cu₁₀P₂₀', '{\"hardness\": 1630.0, \"strength\": 500.0, \"corrosion_resistance\": 5.2}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-250', '钯基非晶高密度合金', '工业版 v5.1', 5, 'Pd₆₀Nd₁₀P₃₀', '{\"hardness\": 1530.0, \"strength\": 460.0, \"corrosion_resistance\": 4.3}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-251', '钯基非晶高强度合金', '农业版 v3.6', 5, 'Pd₅₀Nd₂₀Cu₁₀P₂₀', '{\"hardness\": 1580.0, \"strength\": 480.0, \"corrosion_resistance\": 4.8}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-252', '钯基非晶高强度合金', '生产版 v4.6', 5, 'Pd₆₀Ce₁₀P₃₀', '{\"hardness\": 1500.0, \"strength\": 450.0, \"corrosion_resistance\": 4.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-253', '钯基非晶高强度合金', '工业版 v4.1', 5, 'Pd₅₀Ce₂₀Cu₁₀P₂₀', '{\"hardness\": 1550.0, \"strength\": 470.0, \"corrosion_resistance\": 4.5}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-254', '钯基非晶高密度合金', '工业版 v3.8', 5, 'Pd₆₀La₁₀P₃₀', '{\"hardness\": 1480.0, \"strength\": 440.0, \"corrosion_resistance\": 3.8}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-255', '钯基非晶高密度合金', '农业版 v5.9', 5, 'Pd₅₀La₂₀Cu₁₀P₂₀', '{\"hardness\": 1530.0, \"strength\": 460.0, \"corrosion_resistance\": 4.2}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-256', '钯基非晶高密度合金', '优化版 v5.5', 5, 'Pd₆₀Sn₁₀P₃₀', '{\"hardness\": 1400.0, \"strength\": 400.0, \"corrosion_resistance\": 7.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-257', '钯基非晶高强度合金', '农业版 v1.8', 5, 'Pd₅₀Sn₂₀Cu₁₀P₂₀', '{\"hardness\": 1450.0, \"strength\": 420.0, \"corrosion_resistance\": 7.5}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-258', '钯基非晶高密度合金', '生产版 v4.6', 5, 'Pd₆₀Ge₁₀P₃₀', '{\"hardness\": 1450.0, \"strength\": 430.0, \"corrosion_resistance\": 7.2}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-259', '钯基非晶耐腐蚀合金', '工业版 v4.6', 5, 'Pd₅₀Ge₂₀Cu₁₀P₂₀', '{\"hardness\": 1500.0, \"strength\": 450.0, \"corrosion_resistance\": 7.8}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-260', '钯基非晶耐腐蚀合金', '生产版 v4.1', 5, 'Pd₅₀Si₂₀Cu₁₀P₂₀', '{\"hardness\": 1650.0, \"strength\": 480.0, \"corrosion_resistance\": 7.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-261', '钯基非晶高密度合金', '生产版 v5.8', 5, 'Pd₆₀B₁₀P₃₀', '{\"hardness\": 1950.0, \"strength\": 600.0, \"corrosion_resistance\": 5.5}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-262', '钯基非晶高强度合金', '工业版 v1.2', 5, 'Pd₅₀B₂₀Cu₁₀P₂₀', '{\"hardness\": 1880.0, \"strength\": 580.0, \"corrosion_resistance\": 6.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-263', '钯基非晶高密度合金', '工业版 v1.5', 5, 'Pd₆₀Al₁₀P₃₀', '{\"hardness\": 1350.0, \"strength\": 380.0, \"corrosion_resistance\": 6.5}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-264', '钯基非晶高强度合金', '生产版 v4.1', 5, 'Pd₅₀Al₂₀Cu₁₀P₂₀', '{\"hardness\": 1420.0, \"strength\": 410.0, \"corrosion_resistance\": 7.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-265', '钯基非晶高密度合金', '优化版 v5.6', 5, 'Pd₆₀Ga₁₀P₃₀', '{\"hardness\": 1380.0, \"strength\": 390.0, \"corrosion_resistance\": 7.5}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');
INSERT INTO `amorphous_alloys` VALUES ('AMA-266', '钯基非晶耐腐蚀合金', '农业版 v2.8', 5, 'Pd₅₀Ga₂₀Cu₁₀P₂₀', '{\"hardness\": 1450.0, \"strength\": 420.0, \"corrosion_resistance\": 8.0}', '2025-10-31 11:39:13', '2025-10-31 11:39:13');

SET FOREIGN_KEY_CHECKS = 1;
