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

 Date: 31/10/2025 11:01:11
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
INSERT INTO `amorphous_alloys` VALUES ('AMA-0010', '锆基非晶高强度合金', '农业版 v3.4', 1, 'Zr₅₄Cu₂₆Al₁₀Mo₁₀', '{\"hardness\": 540.0, \"strength\": 1720.0, \"corrosion_resistance\": 3.8}', '2025-10-28 19:19:18', '2025-10-28 19:19:18');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00100', '铁基非晶高密度合金', '生产版 v5.3', 1, 'Fe₅₅Cr₁₀Co₁₀B₁₅Si₁₀', '{\"hardness\": 1150.0, \"strength\": 3200.0, \"corrosion_resistance\": 16.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00101', '铁基非晶耐腐蚀合金', '生产版 v4.0', 1, 'Fe₅₅Cr₁₀Ni₁₀B₁₅Si₁₀', '{\"hardness\": 1100.0, \"strength\": 3100.0, \"corrosion_resistance\": 15.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00102', '铁基非晶高密度合金', '工业版 v2.7', 1, 'Fe₆₂Cr₁₀Mn₃B₁₅Si₁₀', '{\"hardness\": 1050.0, \"strength\": 3000.0, \"corrosion_resistance\": 12.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00103', '铁基非晶耐腐蚀合金', '农业版 v5.2', 1, 'Fe₇₇B₁₂Si₅P₃C₃', '{\"hardness\": 820.0, \"strength\": 2750.0, \"corrosion_resistance\": 1.1}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00104', '铁基非晶耐腐蚀合金', '生产版 v1.2', 1, 'Fe₇₆B₁₂Si₅P₃Al₄', '{\"hardness\": 800.0, \"strength\": 2650.0, \"corrosion_resistance\": 1.5}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00105', '铁基非晶耐腐蚀合金', '工业版 v5.3', 1, 'Fe₈₀B₁₀P₇C₃', '{\"hardness\": 780.0, \"strength\": 2600.0, \"corrosion_resistance\": 1.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00106', '铁基非晶高密度合金', '优化版 v3.8', 1, 'Fe₇₉B₁₂Si₅P₄', '{\"hardness\": 900.0, \"strength\": 2900.0, \"corrosion_resistance\": 1.3}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00107', '铁基非晶耐腐蚀合金', '生产版 v1.5', 1, 'Fe₇₀Cr₁₀B₁₀P₁₀', '{\"hardness\": 950.0, \"strength\": 3000.0, \"corrosion_resistance\": 12.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00108', '铁基非晶高密度合金', '优化版 v4.6', 1, 'Fe₇₈Mo₂B₁₀P₁₀', '{\"hardness\": 1000.0, \"strength\": 3100.0, \"corrosion_resistance\": 2.5}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00109', '铁基非晶高强度合金', '农业版 v2.1', 1, 'Fe₇₆Nb₄B₁₀P₁₀', '{\"hardness\": 1020.0, \"strength\": 3200.0, \"corrosion_resistance\": 2.2}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0011', '锆基非晶高强度合金', '农业版 v5.7', 1, 'Zr₅₄Cu₂₆Al₁₀W₁₀', '{\"hardness\": 560.0, \"strength\": 1750.0, \"corrosion_resistance\": 3.5}', '2025-10-28 19:19:18', '2025-10-28 19:19:18');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00110', '铁基非晶高强度合金', '优化版 v3.6', 1, 'Fe₇₈Ga₂B₁₀P₁₀', '{\"hardness\": 810.0, \"strength\": 2650.0, \"corrosion_resistance\": 1.8}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00111', '铁基非晶耐腐蚀合金', '生产版 v4.4', 1, 'Fe₇₈Ge₂B₁₀P₁₀', '{\"hardness\": 830.0, \"strength\": 2700.0, \"corrosion_resistance\": 2.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00112', '铁基非晶高密度合金', '生产版 v5.2', 1, 'Fe₇₈Al₂B₁₀P₁₀', '{\"hardness\": 770.0, \"strength\": 2550.0, \"corrosion_resistance\": 1.6}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00113', '铁基非晶高密度合金', '优化版 v4.1', 1, 'Fe₆₅Cr₁₂Mo₅B₁₂C₆', '{\"hardness\": 1300.0, \"strength\": 2800.0, \"corrosion_resistance\": 25.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00114', '铁基非晶高密度合金', '农业版 v5.3', 1, 'Fe₆₂Cr₁₂Mo₅P₁₀C₅B₆', '{\"hardness\": 1100.0, \"strength\": 2700.0, \"corrosion_resistance\": 20.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00115', '铁基非晶耐腐蚀合金', '优化版 v4.8', 1, 'Fe₆₁Cr₁₂Mo₅P₁₀Si₅B₇', '{\"hardness\": 1150.0, \"strength\": 2900.0, \"corrosion_resistance\": 22.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00116', '铁基非晶高密度合金', '生产版 v3.0', 1, 'Fe₄₀Ni₄₀B₁₂Si₈', '{\"hardness\": 750.0, \"strength\": 2000.0, \"corrosion_resistance\": 5.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00117', '铁基非晶高密度合金', '农业版 v5.9', 1, 'Fe₃₆Ni₃₆B₁₅Si₅Nb₈', '{\"hardness\": 950.0, \"strength\": 2500.0, \"corrosion_resistance\": 6.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00118', '铁基非晶耐腐蚀合金', '生产版 v4.0', 1, 'Fe₄₀Co₄₀B₁₂Si₈', '{\"hardness\": 800.0, \"strength\": 2200.0, \"corrosion_resistance\": 5.5}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00119', '铁基非晶耐腐蚀合金', '生产版 v4.4', 1, 'Fe₃₆Co₃₆B₁₅Si₅Nb₈', '{\"hardness\": 1000.0, \"strength\": 2700.0, \"corrosion_resistance\": 6.5}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0012', '锆基非晶高密度合金', '优化版 v3.8', 1, 'Zr₅₅Cu₂₈Al₁₀Sn₇', '{\"hardness\": 465.0, \"strength\": 1570.0, \"corrosion_resistance\": 3.3}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00120', '铁基非晶高强度合金', '生产版 v4.2', 1, 'Fe₃₆Co₃₆B₁₅Si₅Zr₈', '{\"hardness\": 980.0, \"strength\": 2600.0, \"corrosion_resistance\": 4.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00121', '铁基非晶高强度合金', '优化版 v4.9', 1, 'Fe₂₅Ni₂₅Co₂₅B₁₅Si₁₀', '{\"hardness\": 850.0, \"strength\": 2300.0, \"corrosion_resistance\": 6.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00122', '铁基非晶高密度合金', '生产版 v2.1', 1, 'Fe₂₀Ni₂₀Co₂₀B₂₀Si₁₀Nb₁₀', '{\"hardness\": 1100.0, \"strength\": 3000.0, \"corrosion_resistance\": 8.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00123', '铁基非晶高密度合金', '优化版 v2.3', 1, 'Fe₂₀Ni₂₀Co₂₀B₂₀Si₁₀Zr₁₀', '{\"hardness\": 1050.0, \"strength\": 2900.0, \"corrosion_resistance\": 5.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00124', '铁基非晶高强度合金', '生产版 v2.2', 1, 'Fe₅₀Mn₁₀Cr₁₅Mo₅B₁₀C₁₀', '{\"hardness\": 1000.0, \"strength\": 2500.0, \"corrosion_resistance\": 8.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00125', '铁基非晶高强度合金', '农业版 v5.6', 1, 'Fe₄₈Mn₁₀Cr₁₅Mo₅P₁₀C₆B₆', '{\"hardness\": 950.0, \"strength\": 2400.0, \"corrosion_resistance\": 7.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00126', '铁基非晶高强度合金', '生产版 v5.5', 1, 'Fe₇₅Ga₅P₁₀C₅B₅', '{\"hardness\": 600.0, \"strength\": 1800.0, \"corrosion_resistance\": 1.5}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00127', '铁基非晶高密度合金', '工业版 v1.5', 1, 'Fe₇₃Ga₅P₁₀Si₅B₇', '{\"hardness\": 620.0, \"strength\": 1850.0, \"corrosion_resistance\": 1.7}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00128', '铁基非晶高强度合金', '农业版 v5.3', 1, 'Fe₈₀Nd₁₀B₁₀', '{\"hardness\": 500.0, \"strength\": 1500.0, \"corrosion_resistance\": 0.5}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00129', '铁基非晶高强度合金', '工业版 v4.3', 1, 'Fe₈₀Dy₁₀B₁₀', '{\"hardness\": 520.0, \"strength\": 1550.0, \"corrosion_resistance\": 0.5}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0013', '锆基非晶高密度合金', '优化版 v2.8', 1, 'Zr₅₅Cu₂₈Al₁₀Si₇', '{\"hardness\": 510.0, \"strength\": 1650.0, \"corrosion_resistance\": 3.7}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00130', '铁基非晶耐腐蚀合金', '农业版 v1.2', 1, 'Fe₈₀Pr₁₀B₁₀', '{\"hardness\": 480.0, \"strength\": 1480.0, \"corrosion_resistance\": 0.5}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00131', '铁基非晶高密度合金', '农业版 v3.7', 1, 'Fe₈₀Tb₁₀B₁₀', '{\"hardness\": 510.0, \"strength\": 1530.0, \"corrosion_resistance\": 0.5}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00132', '铁基非晶高密度合金', '生产版 v1.7', 1, 'Fe₈₅Zr₅B₁₀', '{\"hardness\": 1050.0, \"strength\": 3200.0, \"corrosion_resistance\": 2.0}', '2025-10-28 19:22:48', '2025-10-28 19:22:48');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00133', '铁基非晶耐腐蚀合金', '生产版 v2.9', 1, 'Fe₈₅Hf₅B₁₀', '{\"hardness\": 1080.0, \"strength\": 3250.0, \"corrosion_resistance\": 2.2}', '2025-10-28 19:22:48', '2025-10-28 19:22:48');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00134', '铁基非晶高密度合金', '生产版 v4.9', 1, 'Fe₈₃Nb₇B₁₀', '{\"hardness\": 1120.0, \"strength\": 3350.0, \"corrosion_resistance\": 2.5}', '2025-10-28 19:22:48', '2025-10-28 19:22:48');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00135', '铁基非晶耐腐蚀合金', '生产版 v5.8', 1, 'Fe₈₅Ti₅B₁₀', '{\"hardness\": 1000.0, \"strength\": 3100.0, \"corrosion_resistance\": 1.8}', '2025-10-28 19:22:48', '2025-10-28 19:22:48');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00136', '铁基非晶耐腐蚀合金', '农业版 v5.3', 1, 'Fe₈₅V₅B₁₀', '{\"hardness\": 980.0, \"strength\": 3050.0, \"corrosion_resistance\": 1.7}', '2025-10-28 19:22:48', '2025-10-28 19:22:48');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00137', '铁基非晶高强度合金', '工业版 v2.0', 1, 'Fe₇₅Cr₁₅B₁₀', '{\"hardness\": 950.0, \"strength\": 2800.0, \"corrosion_resistance\": 10.0}', '2025-10-28 19:22:48', '2025-10-28 19:22:48');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00138', '铜基非晶耐腐蚀合金', '农业版 v4.7', 1, 'Cu₅₀Zr₄₃Al₇', '{\"hardness\": 550.0, \"strength\": 2050.0, \"corrosion_resistance\": 2.0}', '2025-10-28 19:24:49', '2025-10-28 19:24:49');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00139', '铜基非晶高密度合金', '生产版 v4.2', 1, 'Cu₅₀Zr₄₀Ti₁₀', '{\"hardness\": 570.0, \"strength\": 2100.0, \"corrosion_resistance\": 1.8}', '2025-10-28 19:24:49', '2025-10-28 19:24:49');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0014', '锆基非晶耐腐蚀合金', '农业版 v3.0', 1, 'Zr₅₀Cu₂₅Al₁₀Pd₁₅', '{\"hardness\": 495.0, \"strength\": 1620.0, \"corrosion_resistance\": 5.5}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00140', '铜基非晶高密度合金', '优化版 v4.2', 1, 'Cu₅₀Zr₃₅Hf₁₅', '{\"hardness\": 590.0, \"strength\": 2150.0, \"corrosion_resistance\": 2.2}', '2025-10-28 19:24:49', '2025-10-28 19:24:49');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00141', '铜基非晶耐腐蚀合金', '优化版 v4.9', 1, 'Cu₄₈Zr₄₂Al₇Ag₃', '{\"hardness\": 540.0, \"strength\": 2000.0, \"corrosion_resistance\": 2.5}', '2025-10-28 19:24:49', '2025-10-28 19:24:49');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00142', '铜基非晶耐腐蚀合金', '农业版 v4.7', 1, 'Cu₄₈Zr₄₂Al₇Y₃', '{\"hardness\": 530.0, \"strength\": 1950.0, \"corrosion_resistance\": 2.8}', '2025-10-28 19:24:49', '2025-10-28 19:24:49');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00143', '铜基非晶高密度合金', '农业版 v1.2', 1, 'Cu₄₆Zr₄₂Al₇Ti₅', '{\"hardness\": 580.0, \"strength\": 2150.0, \"corrosion_resistance\": 2.0}', '2025-10-28 19:24:49', '2025-10-28 19:24:49');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00144', '铜基非晶耐腐蚀合金', '农业版 v5.0', 1, 'Cu₄₆Zr₄₂Al₇Ni₅', '{\"hardness\": 560.0, \"strength\": 2080.0, \"corrosion_resistance\": 2.3}', '2025-10-28 19:24:49', '2025-10-28 19:24:49');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00145', '铜基非晶耐腐蚀合金', '生产版 v1.6', 1, 'Cu₄₆Zr₄₂Al₇Co₅', '{\"hardness\": 555.0, \"strength\": 2060.0, \"corrosion_resistance\": 2.4}', '2025-10-28 19:24:49', '2025-10-28 19:24:49');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00146', '铜基非晶高密度合金', '生产版 v4.0', 1, 'Cu₄₆Zr₄₂Al₇Fe₅', '{\"hardness\": 575.0, \"strength\": 2120.0, \"corrosion_resistance\": 1.9}', '2025-10-28 19:24:49', '2025-10-28 19:24:49');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00147', '铜基非晶高强度合金', '优化版 v4.7', 1, 'Cu₄₆Zr₄₂Al₇Nb₅', '{\"hardness\": 600.0, \"strength\": 2200.0, \"corrosion_resistance\": 2.6}', '2025-10-28 19:24:49', '2025-10-28 19:24:49');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00148', '铜基非晶高密度合金', '工业版 v2.9', 1, 'Cu₄₆Zr₄₂Al₇Ta₅', '{\"hardness\": 610.0, \"strength\": 2220.0, \"corrosion_resistance\": 2.7}', '2025-10-28 19:24:49', '2025-10-28 19:24:49');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00149', '铜基非晶耐腐蚀合金', '优化版 v4.3', 1, 'Cu₄₆Zr₄₀Ti₇Ni₇', '{\"hardness\": 570.0, \"strength\": 2120.0, \"corrosion_resistance\": 2.1}', '2025-10-28 19:24:49', '2025-10-28 19:24:49');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0015', '锆基非晶高密度合金', '农业版 v4.2', 1, 'Zr₅₅Cu₂₅Al₁₀Fe₁₀', '{\"hardness\": 500.0, \"strength\": 1640.0, \"corrosion_resistance\": 3.0}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00150', '铜基非晶耐腐蚀合金', '优化版 v1.2', 1, 'Cu₄₈Zr₄₀Ti₁₀Sn₂', '{\"hardness\": 545.0, \"strength\": 2050.0, \"corrosion_resistance\": 2.0}', '2025-10-28 19:24:49', '2025-10-28 19:24:49');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00151', '铜基非晶高密度合金', '工业版 v2.3', 1, 'Cu₄₆Zr₃₆Ti₁₀Be₈', '{\"hardness\": 620.0, \"strength\": 2300.0, \"corrosion_resistance\": 1.5}', '2025-10-28 19:24:49', '2025-10-28 19:24:49');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00152', '铜基非晶耐腐蚀合金', '工业版 v1.5', 1, 'Cu₄₆Zr₄₀Ti₇Nb₇', '{\"hardness\": 590.0, \"strength\": 2180.0, \"corrosion_resistance\": 2.4}', '2025-10-28 19:24:49', '2025-10-28 19:24:49');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00153', '铜基非晶高密度合金', '生产版 v4.2', 1, 'Cu₄₈Zr₄₀Ti₁₀Si₂', '{\"hardness\": 560.0, \"strength\": 2080.0, \"corrosion_resistance\": 1.9}', '2025-10-28 19:24:49', '2025-10-28 19:24:49');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00154', '铜基非晶高强度合金', '农业版 v2.8', 1, 'Cu₄₆Zr₃₅Hf₁₀Ti₉', '{\"hardness\": 600.0, \"strength\": 2200.0, \"corrosion_resistance\": 2.3}', '2025-10-28 19:24:49', '2025-10-28 19:24:49');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00155', '铜基非晶耐腐蚀合金', '农业版 v2.0', 1, 'Cu₄₈Zr₃₅Hf₁₀Al₇', '{\"hardness\": 590.0, \"strength\": 2180.0, \"corrosion_resistance\": 2.4}', '2025-10-28 19:24:49', '2025-10-28 19:24:49');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00156', '铜基非晶耐腐蚀合金', '生产版 v5.0', 1, 'Cu₅₀Hf₄₂Al₈', '{\"hardness\": 600.0, \"strength\": 2200.0, \"corrosion_resistance\": 2.5}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00157', '铜基非晶高强度合金', '农业版 v2.0', 1, 'Cu₅₀Hf₃₅Ti₁₅', '{\"hardness\": 610.0, \"strength\": 2250.0, \"corrosion_resistance\": 2.2}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00158', '铜基非晶高强度合金', '优化版 v3.7', 1, 'Cu₄₆Ti₁₂Zr₁₂Ni₁₃Sn₁₁', '{\"hardness\": 520.0, \"strength\": 1950.0, \"corrosion_resistance\": 2.2}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00159', '铜基非晶高密度合金', '工业版 v4.3', 1, 'Cu₄₈Ti₁₂Zr₁₂Ni₁₃Si₁₅', '{\"hardness\": 510.0, \"strength\": 1900.0, \"corrosion_resistance\": 2.0}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0016', '锆基非晶高密度合金', '农业版 v3.2', 1, 'Zr₅₀Cu₂₀Al₁₀Ni₁₀Ti₁₀', '{\"hardness\": 520.0, \"strength\": 1700.0, \"corrosion_resistance\": 3.2}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00160', '铜基非晶高强度合金', '工业版 v1.8', 1, 'Cu₄₂Ti₁₂Zr₁₂Ni₁₂Be₂₂', '{\"hardness\": 650.0, \"strength\": 2350.0, \"corrosion_resistance\": 1.6}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00161', '铜基非晶高密度合金', '生产版 v2.3', 1, 'Cu₃₀Ni₁₅Zr₃₀Ti₁₀Al₅', '{\"hardness\": 540.0, \"strength\": 2000.0, \"corrosion_resistance\": 2.8}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00162', '铜基非晶高密度合金', '优化版 v5.3', 1, 'Cu₃₀Ni₁₅Zr₃₀Ti₁₀Sn₅', '{\"hardness\": 530.0, \"strength\": 1950.0, \"corrosion_resistance\": 2.5}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00163', '铜基非晶耐腐蚀合金', '优化版 v2.0', 1, 'Cu₃₀Ni₁₅Zr₃₀Ti₁₀Nb₅', '{\"hardness\": 570.0, \"strength\": 2100.0, \"corrosion_resistance\": 3.0}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00164', '铜基非晶高密度合金', '生产版 v3.0', 1, 'Cu₄₀Al₁₀Ni₂₀Zr₃₀', '{\"hardness\": 500.0, \"strength\": 1800.0, \"corrosion_resistance\": 2.5}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00165', '铜基非晶高强度合金', '生产版 v2.3', 1, 'Cu₄₀Al₁₀Fe₂₀Zr₃₀', '{\"hardness\": 520.0, \"strength\": 1850.0, \"corrosion_resistance\": 1.8}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00166', '铜基非晶高强度合金', '优化版 v4.1', 1, 'Cu₄₀Al₁₀Co₂₀Zr₃₀', '{\"hardness\": 510.0, \"strength\": 1820.0, \"corrosion_resistance\": 2.0}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00167', '铜基非晶耐腐蚀合金', '优化版 v5.9', 1, 'Cu₄₀Al₁₀Y₁₀Zr₄₀', '{\"hardness\": 480.0, \"strength\": 1700.0, \"corrosion_resistance\": 3.0}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00168', '铜基非晶耐腐蚀合金', '生产版 v4.7', 1, 'Cu₄₀Al₁₀Gd₁₀Zr₄₀', '{\"hardness\": 490.0, \"strength\": 1720.0, \"corrosion_resistance\": 3.2}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00169', '铜基非晶耐腐蚀合金', '生产版 v3.6', 1, 'Cu₄₀Al₁₀Dy₁₀Zr₄₀', '{\"hardness\": 495.0, \"strength\": 1730.0, \"corrosion_resistance\": 3.2}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0017', '锆基非晶耐腐蚀合金', '农业版 v4.4', 1, 'Zr₅₂Cu₁₈Ni₁₂Al₁₀Sn₈', '{\"hardness\": 490.0, \"strength\": 1630.0, \"corrosion_resistance\": 3.5}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00170', '铜基非晶高强度合金', '优化版 v2.1', 1, 'Cu₄₀Al₁₀Er₁₀Zr₄₀', '{\"hardness\": 500.0, \"strength\": 1750.0, \"corrosion_resistance\": 3.3}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00171', '铜基非晶高强度合金', '生产版 v5.7', 1, 'Cu₄₀Al₁₀Nb₁₀Zr₄₀', '{\"hardness\": 550.0, \"strength\": 1900.0, \"corrosion_resistance\": 2.8}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00172', '铜基非晶高强度合金', '工业版 v2.7', 1, 'Cu₄₀Al₁₀Ta₁₀Zr₄₀', '{\"hardness\": 560.0, \"strength\": 1920.0, \"corrosion_resistance\": 2.9}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00173', '铜基非晶高密度合金', '生产版 v5.0', 1, 'Cu₄₀Al₁₀Mo₁₀Zr₄₀', '{\"hardness\": 570.0, \"strength\": 1950.0, \"corrosion_resistance\": 2.5}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00174', '铜基非晶高密度合金', '工业版 v4.9', 1, 'Cu₄₀Al₁₀W₁₀Zr₄₀', '{\"hardness\": 580.0, \"strength\": 1980.0, \"corrosion_resistance\": 2.4}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00175', '铜基非晶高密度合金', '生产版 v1.4', 1, 'Cu₄₀Al₁₀Cr₁₀Zr₄₀', '{\"hardness\": 540.0, \"strength\": 1880.0, \"corrosion_resistance\": 3.5}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00176', '铜基非晶高强度合金', '农业版 v1.1', 1, 'Cu₄₀Al₁₀Mn₁₀Zr₄₀', '{\"hardness\": 510.0, \"strength\": 1750.0, \"corrosion_resistance\": 1.5}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00177', '铜基非晶高密度合金', '农业版 v2.5', 1, 'Cu₄₀Al₁₀V₁₀Zr₄₀', '{\"hardness\": 530.0, \"strength\": 1850.0, \"corrosion_resistance\": 1.8}', '2025-10-28 19:24:50', '2025-10-28 19:24:50');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00178', '镁基非晶高密度合金', '生产版 v4.6', 1, 'Mg₆₅Cu₂₅Y₁₀', '{\"hardness\": 250.0, \"strength\": 800.0, \"corrosion_resistance\": 1.5}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00179', '镁基非晶耐腐蚀合金', '工业版 v3.2', 1, 'Mg₆₅Cu₂₅Gd₁₀', '{\"hardness\": 260.0, \"strength\": 820.0, \"corrosion_resistance\": 1.6}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0018', '锆基非晶高密度合金', '农业版 v3.6', 1, 'Zr₄₈Cu₂₀Ni₁₂Al₁₀Be₁₀', '{\"hardness\": 540.0, \"strength\": 1850.0, \"corrosion_resistance\": 2.8}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00180', '镁基非晶高强度合金', '农业版 v1.2', 1, 'Mg₆₅Cu₂₅Dy₁₀', '{\"hardness\": 265.0, \"strength\": 830.0, \"corrosion_resistance\": 1.6}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00181', '镁基非晶高强度合金', '工业版 v2.5', 1, 'Mg₇₀Cu₂₀Ni₁₀', '{\"hardness\": 230.0, \"strength\": 750.0, \"corrosion_resistance\": 1.0}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00182', '镁基非晶耐腐蚀合金', '农业版 v4.5', 1, 'Mg₆₅Cu₂₀Ag₁₅', '{\"hardness\": 240.0, \"strength\": 780.0, \"corrosion_resistance\": 1.8}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00183', '镁基非晶高强度合金', '工业版 v5.5', 1, 'Mg₆₀Cu₂₀Y₁₀Zn₁₀', '{\"hardness\": 280.0, \"strength\": 850.0, \"corrosion_resistance\": 1.7}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00184', '镁基非晶高密度合金', '生产版 v2.6', 1, 'Mg₆₀Cu₂₀Gd₁₀Zn₁₀', '{\"hardness\": 290.0, \"strength\": 870.0, \"corrosion_resistance\": 1.8}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00185', '镁基非晶耐腐蚀合金', '工业版 v3.3', 1, 'Mg₆₀Cu₂₀Dy₁₀Zn₁₀', '{\"hardness\": 295.0, \"strength\": 880.0, \"corrosion_resistance\": 1.8}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00186', '镁基非晶高密度合金', '生产版 v3.5', 1, 'Mg₆₀Cu₂₀Y₁₀Ag₁₀', '{\"hardness\": 270.0, \"strength\": 830.0, \"corrosion_resistance\": 2.0}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00187', '镁基非晶耐腐蚀合金', '优化版 v4.6', 1, 'Mg₆₀Cu₂₀Gd₁₀Ag₁₀', '{\"hardness\": 275.0, \"strength\": 850.0, \"corrosion_resistance\": 2.1}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00188', '镁基非晶耐腐蚀合金', '农业版 v5.1', 1, 'Mg₆₂Cu₂₀Y₁₀Ni₈', '{\"hardness\": 255.0, \"strength\": 780.0, \"corrosion_resistance\": 1.4}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00189', '镁基非晶高强度合金', '优化版 v5.2', 1, 'Mg₆₂Cu₂₀Gd₁₀Ni₈', '{\"hardness\": 265.0, \"strength\": 800.0, \"corrosion_resistance\": 1.5}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0019', '锆基非晶高密度合金', '优化版 v2.4', 1, 'Zr₅₀Cu₁₈Ni₁₂Al₁₀Nb₁₀', '{\"hardness\": 515.0, \"strength\": 1680.0, \"corrosion_resistance\": 4.3}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00190', '镁基非晶高密度合金', '优化版 v4.0', 1, 'Mg₇₅Ni₁₀Y₁₅', '{\"hardness\": 220.0, \"strength\": 700.0, \"corrosion_resistance\": 1.2}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00191', '镁基非晶高强度合金', '工业版 v3.9', 1, 'Mg₇₅Ni₁₀Gd₁₅', '{\"hardness\": 230.0, \"strength\": 720.0, \"corrosion_resistance\": 1.3}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00192', '镁基非晶耐腐蚀合金', '农业版 v3.5', 1, 'Mg₇₅Ni₁₀Dy₁₅', '{\"hardness\": 235.0, \"strength\": 730.0, \"corrosion_resistance\": 1.3}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00193', '镁基非晶耐腐蚀合金', '优化版 v2.7', 1, 'Mg₇₅Ni₁₀Nd₁₅', '{\"hardness\": 225.0, \"strength\": 710.0, \"corrosion_resistance\": 1.2}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00194', '镁基非晶耐腐蚀合金', '生产版 v5.8', 1, 'Mg₆₀Zn₃₅Ca₅', '{\"hardness\": 180.0, \"strength\": 600.0, \"corrosion_resistance\": 0.8}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00195', '镁基非晶高强度合金', '农业版 v1.8', 1, 'Mg₇₀Zn₂₅Ce₅', '{\"hardness\": 200.0, \"strength\": 650.0, \"corrosion_resistance\": 1.0}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00196', '镁基非晶耐腐蚀合金', '工业版 v4.4', 1, 'Mg₇₀Zn₂₅La₅', '{\"hardness\": 195.0, \"strength\": 640.0, \"corrosion_resistance\": 1.0}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00197', '镁基非晶高强度合金', '生产版 v1.9', 1, 'Mg₇₀Zn₂₅Nd₅', '{\"hardness\": 205.0, \"strength\": 660.0, \"corrosion_resistance\": 1.1}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00198', '镁基非晶高密度合金', '生产版 v3.7', 1, 'Mg₇₀Zn₂₅Y₅', '{\"hardness\": 215.0, \"strength\": 680.0, \"corrosion_resistance\": 1.3}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00199', '镁基非晶高密度合金', '优化版 v5.7', 1, 'Mg₇₀Zn₂₅Gd₅', '{\"hardness\": 220.0, \"strength\": 690.0, \"corrosion_resistance\": 1.4}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-002', '锆基非晶高强度合金', '生产版 v3.0', 1, 'Zr₅₂.₅Cu₁₇.₉Ni₁₄.₆Al₁₀', '{\"hardness\": 500.0, \"strength\": 1650.0, \"corrosion_resistance\": 3.5}', '2025-10-28 19:19:18', '2025-10-28 19:19:18');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0020', '锆基非晶耐腐蚀合金', '农业版 v3.4', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Y₉', '{\"hardness\": 475.0, \"strength\": 1580.0, \"corrosion_resistance\": 4.8}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00200', '镁基非晶高密度合金', '优化版 v1.4', 1, 'Mg₆₅Ca₁₀Cu₂₅', '{\"hardness\": 240.0, \"strength\": 720.0, \"corrosion_resistance\": 0.7}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00201', '镁基非晶高密度合金', '生产版 v4.8', 1, 'Mg₇₀Ca₁₀Ni₂₀', '{\"hardness\": 210.0, \"strength\": 650.0, \"corrosion_resistance\": 0.6}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00202', '镁基非晶高密度合金', '生产版 v5.5', 1, 'Mg₇₅Ca₁₀Y₁₅', '{\"hardness\": 170.0, \"strength\": 580.0, \"corrosion_resistance\": 1.0}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00203', '镁基非晶高密度合金', '农业版 v2.6', 1, 'Mg₇₅Ca₁₀Gd₁₅', '{\"hardness\": 175.0, \"strength\": 590.0, \"corrosion_resistance\": 1.1}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00204', '镁基非晶高密度合金', '优化版 v2.9', 1, 'Mg₇₀Ca₁₀Ag₂₀', '{\"hardness\": 190.0, \"strength\": 600.0, \"corrosion_resistance\": 1.5}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00205', '镁基非晶高密度合金', '生产版 v4.7', 1, 'Mg₇₀Ca₁₀Zn₂₀', '{\"hardness\": 160.0, \"strength\": 550.0, \"corrosion_resistance\": 0.7}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00206', '镁基非晶耐腐蚀合金', '生产版 v2.1', 1, 'Mg₆₇Y₁₀Zn₂₀Ca₃', '{\"hardness\": 240.0, \"strength\": 720.0, \"corrosion_resistance\": 1.5}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00207', '镁基非晶高密度合金', '优化版 v2.2', 1, 'Mg₆₇Gd₁₀Zn₂₀Ca₃', '{\"hardness\": 250.0, \"strength\": 740.0, \"corrosion_resistance\": 1.6}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00208', '镁基非晶耐腐蚀合金', '生产版 v2.9', 1, 'Mg₆₇Dy₁₀Zn₂₀Ca₃', '{\"hardness\": 255.0, \"strength\": 750.0, \"corrosion_resistance\": 1.6}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00209', '镁基非晶高密度合金', '农业版 v1.3', 1, 'Mg₆₇Nd₁₀Zn₂₀Ca₃', '{\"hardness\": 235.0, \"strength\": 710.0, \"corrosion_resistance\": 1.4}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0021', '锆基非晶耐腐蚀合金', '优化版 v1.6', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Ag₉', '{\"hardness\": 485.0, \"strength\": 1600.0, \"corrosion_resistance\": 4.2}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00210', '镁基非晶高强度合金', '优化版 v5.9', 1, 'Mg₆₀Y₁₀Cu₂₀Ag₁₀', '{\"hardness\": 290.0, \"strength\": 860.0, \"corrosion_resistance\": 2.2}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00211', '镁基非晶耐腐蚀合金', '工业版 v1.0', 1, 'Mg₆₀Gd₁₀Cu₂₀Ag₁₀', '{\"hardness\": 300.0, \"strength\": 880.0, \"corrosion_resistance\": 2.3}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00212', '镁基非晶耐腐蚀合金', '农业版 v4.5', 1, 'Mg₆₀Dy₁₀Cu₂₀Ag₁₀', '{\"hardness\": 305.0, \"strength\": 890.0, \"corrosion_resistance\": 2.3}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00213', '镁基非晶高强度合金', '农业版 v3.5', 1, 'Mg₆₀Nd₁₀Cu₂₀Ag₁₀', '{\"hardness\": 280.0, \"strength\": 840.0, \"corrosion_resistance\": 2.0}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00214', '镁基非晶耐腐蚀合金', '生产版 v2.0', 1, 'Mg₆₀Y₁₀Cu₂₀Ga₁₀', '{\"hardness\": 270.0, \"strength\": 820.0, \"corrosion_resistance\": 1.8}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00215', '镁基非晶耐腐蚀合金', '农业版 v2.0', 1, 'Mg₆₀Gd₁₀Cu₂₀Ga₁₀', '{\"hardness\": 275.0, \"strength\": 840.0, \"corrosion_resistance\": 1.9}', '2025-10-28 19:27:30', '2025-10-28 19:27:30');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00216', '镁基非晶高密度合金', '工业版 v5.4', 1, 'Mg₆₀Cu₂₀Y₁₀Ge₁₀', '{\"hardness\": 295.0, \"strength\": 870.0, \"corrosion_resistance\": 1.5}', '2025-10-28 19:27:31', '2025-10-28 19:27:31');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00217', '镁基非晶高密度合金', '农业版 v4.5', 1, 'Mg₆₀Cu₂₀Gd₁₀Ge₁₀', '{\"hardness\": 305.0, \"strength\": 890.0, \"corrosion_resistance\": 1.6}', '2025-10-28 19:27:31', '2025-10-28 19:27:31');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00218', '钯基非晶高密度合金', '优化版 v2.8', 1, 'Pd₇₇.₅Cu₆Si₁₆.₅', '{\"hardness\": 400.0, \"strength\": 1500.0, \"corrosion_resistance\": 8.0}', '2025-10-28 19:29:39', '2025-10-28 19:29:39');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00219', '钯基非晶高强度合金', '农业版 v4.6', 1, 'Pd₄₀Ni₄₀P₂₀', '{\"hardness\": 450.0, \"strength\": 1600.0, \"corrosion_resistance\": 6.0}', '2025-10-28 19:29:39', '2025-10-28 19:29:39');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0022', '锆基非晶耐腐蚀合金', '生产版 v2.7', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Co₉', '{\"hardness\": 505.0, \"strength\": 1650.0, \"corrosion_resistance\": 3.9}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00220', '钯基非晶高强度合金', '农业版 v4.5', 1, 'Pd₄₃Ni₁₀Cu₂₇P₂₀', '{\"hardness\": 480.0, \"strength\": 1700.0, \"corrosion_resistance\": 7.0}', '2025-10-28 19:29:39', '2025-10-28 19:29:39');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00221', '钯基非晶高强度合金', '优化版 v4.8', 1, 'Pd₇₅Ag₅Si₂₀', '{\"hardness\": 380.0, \"strength\": 1450.0, \"corrosion_resistance\": 9.0}', '2025-10-28 19:29:39', '2025-10-28 19:29:39');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00222', '钯基非晶耐腐蚀合金', '生产版 v1.5', 1, 'Pd₄₀Ag₄₀P₂₀', '{\"hardness\": 420.0, \"strength\": 1550.0, \"corrosion_resistance\": 8.5}', '2025-10-28 19:29:39', '2025-10-28 19:29:39');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00223', '钯基非晶耐腐蚀合金', '农业版 v2.5', 1, 'Pd₄₀Ag₄₀Ge₂₀', '{\"hardness\": 390.0, \"strength\": 1480.0, \"corrosion_resistance\": 8.0}', '2025-10-28 19:29:39', '2025-10-28 19:29:39');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00224', '钯基非晶耐腐蚀合金', '生产版 v1.7', 1, 'Pd₇₅Au₅Si₂₀', '{\"hardness\": 410.0, \"strength\": 1520.0, \"corrosion_resistance\": 10.0}', '2025-10-28 19:29:39', '2025-10-28 19:29:39');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00225', '钯基非晶高密度合金', '生产版 v5.7', 1, 'Pd₄₀Au₄₀P₂₀', '{\"hardness\": 430.0, \"strength\": 1580.0, \"corrosion_resistance\": 9.5}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00226', '钯基非晶高强度合金', '农业版 v5.9', 1, 'Pd₄₀Pt₄₀P₂₀', '{\"hardness\": 460.0, \"strength\": 1650.0, \"corrosion_resistance\": 15.0}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00227', '钯基非晶耐腐蚀合金', '优化版 v5.1', 1, 'Pd₄₀Pt₂₀Cu₂₀P₂₀', '{\"hardness\": 490.0, \"strength\": 1720.0, \"corrosion_resistance\": 14.0}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00228', '钯基非晶高密度合金', '工业版 v4.2', 1, 'Pd₄₀Pt₂₀Ni₂₀P₂₀', '{\"hardness\": 500.0, \"strength\": 1750.0, \"corrosion_resistance\": 13.0}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00229', '钯基非晶耐腐蚀合金', '工业版 v6.0', 1, 'Pd₄₀Fe₄₀P₂₀', '{\"hardness\": 520.0, \"strength\": 1800.0, \"corrosion_resistance\": 4.0}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0023', '锆基非晶耐腐蚀合金', '农业版 v5.1', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Cr₉', '{\"hardness\": 520.0, \"strength\": 1670.0, \"corrosion_resistance\": 4.0}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00230', '钯基非晶高密度合金', '生产版 v3.2', 1, 'Pd₄₀Co₄₀P₂₀', '{\"hardness\": 510.0, \"strength\": 1780.0, \"corrosion_resistance\": 5.0}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00231', '钯基非晶耐腐蚀合金', '工业版 v3.0', 1, 'Pd₄₀Rh₄₀P₂₀', '{\"hardness\": 480.0, \"strength\": 1700.0, \"corrosion_resistance\": 16.0}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00232', '钯基非晶高密度合金', '农业版 v2.1', 1, 'Pd₄₀Ru₄₀P₂₀', '{\"hardness\": 540.0, \"strength\": 1850.0, \"corrosion_resistance\": 12.0}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00233', '钯基非晶耐腐蚀合金', '工业版 v2.4', 1, 'Pd₄₀Ir₄₀P₂₀', '{\"hardness\": 500.0, \"strength\": 1750.0, \"corrosion_resistance\": 17.0}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00234', '钯基非晶高强度合金', '农业版 v3.5', 1, 'Pd₄₂Cu₂₈Ni₁₀P₂₀', '{\"hardness\": 470.0, \"strength\": 1680.0, \"corrosion_resistance\": 7.5}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00235', '钯基非晶耐腐蚀合金', '农业版 v1.2', 1, 'Pd₄₂Cu₂₈Co₁₀P₂₀', '{\"hardness\": 465.0, \"strength\": 1660.0, \"corrosion_resistance\": 7.8}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00236', '钯基非晶高强度合金', '工业版 v4.9', 1, 'Pd₄₀Ni₃₀Fe₁₀P₂₀', '{\"hardness\": 510.0, \"strength\": 1750.0, \"corrosion_resistance\": 5.5}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00237', '钯基非晶高强度合金', '工业版 v3.3', 1, 'Pd₄₀Ag₃₀Cu₁₀P₂₀', '{\"hardness\": 440.0, \"strength\": 1600.0, \"corrosion_resistance\": 9.0}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00238', '钯基非晶耐腐蚀合金', '工业版 v5.2', 1, 'Pd₄₀Ag₃₀Ni₁₀P₂₀', '{\"hardness\": 450.0, \"strength\": 1620.0, \"corrosion_resistance\": 8.0}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00239', '钯基非晶高强度合金', '优化版 v1.2', 1, 'Pd₄₀Au₃₀Cu₁₀P₂₀', '{\"hardness\": 460.0, \"strength\": 1650.0, \"corrosion_resistance\": 10.5}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0024', '锆基非晶耐腐蚀合金', '农业版 v1.6', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Mo₉', '{\"hardness\": 525.0, \"strength\": 1690.0, \"corrosion_resistance\": 4.1}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00240', '钯基非晶耐腐蚀合金', '工业版 v5.6', 1, 'Pd₄₀Au₃₀Ni₁₀P₂₀', '{\"hardness\": 470.0, \"strength\": 1670.0, \"corrosion_resistance\": 9.8}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00241', '钯基非晶高密度合金', '农业版 v2.1', 1, 'Pd₆₀Zr₁₀P₃₀', '{\"hardness\": 580.0, \"strength\": 1900.0, \"corrosion_resistance\": 6.0}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00242', '钯基非晶耐腐蚀合金', '优化版 v3.9', 1, 'Pd₅₀Zr₂₀Cu₁₀P₂₀', '{\"hardness\": 560.0, \"strength\": 1850.0, \"corrosion_resistance\": 6.5}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00243', '钯基非晶耐腐蚀合金', '工业版 v1.7', 1, 'Pd₆₀Ti₁₀P₃₀', '{\"hardness\": 550.0, \"strength\": 1800.0, \"corrosion_resistance\": 5.5}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00244', '钯基非晶高强度合金', '农业版 v4.6', 1, 'Pd₅₀Ti₂₀Cu₁₀P₂₀', '{\"hardness\": 540.0, \"strength\": 1780.0, \"corrosion_resistance\": 6.0}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00245', '钯基非晶耐腐蚀合金', '工业版 v2.3', 1, 'Pd₆₀Y₁₀P₃₀', '{\"hardness\": 470.0, \"strength\": 1550.0, \"corrosion_resistance\": 4.5}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00246', '钯基非晶耐腐蚀合金', '优化版 v5.8', 1, 'Pd₅₀Y₂₀Cu₁₀P₂₀', '{\"hardness\": 490.0, \"strength\": 1600.0, \"corrosion_resistance\": 5.0}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00247', '钯基非晶高密度合金', '工业版 v4.6', 1, 'Pd₆₀Gd₁₀P₃₀', '{\"hardness\": 480.0, \"strength\": 1580.0, \"corrosion_resistance\": 4.8}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00248', '钯基非晶耐腐蚀合金', '优化版 v3.9', 1, 'Pd₅₀Gd₂₀Cu₁₀P₂₀', '{\"hardness\": 500.0, \"strength\": 1630.0, \"corrosion_resistance\": 5.2}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00249', '钯基非晶高密度合金', '优化版 v4.4', 1, 'Pd₆₀Nd₁₀P₃₀', '{\"hardness\": 460.0, \"strength\": 1530.0, \"corrosion_resistance\": 4.3}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0025', '锆基非晶高强度合金', '农业版 v3.1', 1, 'Zr₅₂Cu₁₈Ni₁₂Al₁₀Fe₈', '{\"hardness\": 510.0, \"strength\": 1660.0, \"corrosion_resistance\": 3.2}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00250', '钯基非晶高强度合金', '农业版 v1.7', 1, 'Pd₅₀Nd₂₀Cu₁₀P₂₀', '{\"hardness\": 480.0, \"strength\": 1580.0, \"corrosion_resistance\": 4.8}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00251', '钯基非晶高密度合金', '优化版 v2.1', 1, 'Pd₆₀Ce₁₀P₃₀', '{\"hardness\": 450.0, \"strength\": 1500.0, \"corrosion_resistance\": 4.0}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00252', '钯基非晶高强度合金', '生产版 v2.4', 1, 'Pd₅₀Ce₂₀Cu₁₀P₂₀', '{\"hardness\": 470.0, \"strength\": 1550.0, \"corrosion_resistance\": 4.5}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00253', '钯基非晶耐腐蚀合金', '生产版 v2.4', 1, 'Pd₆₀La₁₀P₃₀', '{\"hardness\": 440.0, \"strength\": 1480.0, \"corrosion_resistance\": 3.8}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00254', '钯基非晶耐腐蚀合金', '优化版 v5.9', 1, 'Pd₅₀La₂₀Cu₁₀P₂₀', '{\"hardness\": 460.0, \"strength\": 1530.0, \"corrosion_resistance\": 4.2}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00255', '钯基非晶高密度合金', '优化版 v5.5', 1, 'Pd₆₀Sn₁₀P₃₀', '{\"hardness\": 400.0, \"strength\": 1400.0, \"corrosion_resistance\": 7.0}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00256', '钯基非晶高密度合金', '工业版 v5.5', 1, 'Pd₅₀Sn₂₀Cu₁₀P₂₀', '{\"hardness\": 420.0, \"strength\": 1450.0, \"corrosion_resistance\": 7.5}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00257', '钯基非晶耐腐蚀合金', '农业版 v4.2', 1, 'Pd₆₀Ge₁₀P₃₀', '{\"hardness\": 430.0, \"strength\": 1450.0, \"corrosion_resistance\": 7.2}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00258', '钯基非晶高强度合金', '优化版 v3.4', 1, 'Pd₅₀Ge₂₀Cu₁₀P₂₀', '{\"hardness\": 450.0, \"strength\": 1500.0, \"corrosion_resistance\": 7.8}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00259', '钯基非晶高密度合金', '生产版 v1.7', 1, 'Pd₅₀Si₂₀Cu₁₀P₂₀', '{\"hardness\": 480.0, \"strength\": 1650.0, \"corrosion_resistance\": 7.0}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0026', '锆基非晶高强度合金', '优化版 v3.7', 1, 'Zr₅₅Cu₂₀Ti₁₀Ni₁₅', '{\"hardness\": 490.0, \"strength\": 1620.0, \"corrosion_resistance\": 2.8}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00260', '钯基非晶耐腐蚀合金', '生产版 v5.8', 1, 'Pd₆₀B₁₀P₃₀', '{\"hardness\": 600.0, \"strength\": 1950.0, \"corrosion_resistance\": 5.5}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00261', '钯基非晶高密度合金', '工业版 v3.9', 1, 'Pd₅₀B₂₀Cu₁₀P₂₀', '{\"hardness\": 580.0, \"strength\": 1880.0, \"corrosion_resistance\": 6.0}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00262', '钯基非晶高强度合金', '生产版 v5.3', 1, 'Pd₆₀Al₁₀P₃₀', '{\"hardness\": 380.0, \"strength\": 1350.0, \"corrosion_resistance\": 6.5}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00263', '钯基非晶耐腐蚀合金', '生产版 v4.2', 1, 'Pd₅₀Al₂₀Cu₁₀P₂₀', '{\"hardness\": 410.0, \"strength\": 1420.0, \"corrosion_resistance\": 7.0}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00264', '钯基非晶耐腐蚀合金', '工业版 v4.4', 1, 'Pd₆₀Ga₁₀P₃₀', '{\"hardness\": 390.0, \"strength\": 1380.0, \"corrosion_resistance\": 7.5}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-00265', '钯基非晶高密度合金', '生产版 v4.1', 1, 'Pd₅₀Ga₂₀Cu₁₀P₂₀', '{\"hardness\": 420.0, \"strength\": 1450.0, \"corrosion_resistance\": 8.0}', '2025-10-28 19:29:40', '2025-10-28 19:29:40');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0027', '锆基非晶高密度合金', '农业版 v4.8', 1, 'Zr₄₄Cu₁₂Ti₁₁Ni₁₀Be₂₃', '{\"hardness\": 550.0, \"strength\": 1900.0, \"corrosion_resistance\": 2.5}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0028', '锆基非晶耐腐蚀合金', '生产版 v3.1', 1, 'Zr₅₀Cu₂₀Ti₁₀Ni₁₀Al₁₀', '{\"hardness\": 525.0, \"strength\": 1720.0, \"corrosion_resistance\": 3.0}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0029', '锆基非晶高密度合金', '生产版 v3.7', 1, 'Zr₅₂Cu₂₀Ti₁₀Ni₁₀Sn₈', '{\"hardness\": 480.0, \"strength\": 1600.0, \"corrosion_resistance\": 3.2}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-003', '锆基非晶合金', '优化版本 v3', 1, 'Zr55Cu20Al25', '{\"hardness\": 520.0, \"strength\": 1850.0, \"corrosion_resistance\": 22.0}', '2025-10-28 19:19:18', '2025-10-30 23:56:00');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0030', '锆基非晶耐腐蚀合金', '生产版 v1.7', 1, 'Zr₅₀Cu₂₀Ti₁₀Be₂₀', '{\"hardness\": 530.0, \"strength\": 1800.0, \"corrosion_resistance\": 2.3}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0031', '锆基非晶高密度合金', '工业版 v1.7', 1, 'Zr₅₂Cu₁₈Ni₁₂Ti₁₀Sn₈', '{\"hardness\": 470.0, \"strength\": 1580.0, \"corrosion_resistance\": 3.0}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0032', '锆基非晶高密度合金', '工业版 v4.3', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Y₉', '{\"hardness\": 475.0, \"strength\": 1580.0, \"corrosion_resistance\": 4.8}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0033', '锆基非晶耐腐蚀合金', '农业版 v1.8', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Gd₉', '{\"hardness\": 480.0, \"strength\": 1590.0, \"corrosion_resistance\": 5.0}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0034', '锆基非晶耐腐蚀合金', '农业版 v4.7', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Dy₉', '{\"hardness\": 485.0, \"strength\": 1600.0, \"corrosion_resistance\": 5.0}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0035', '锆基非晶高密度合金', '农业版 v2.3', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Er₉', '{\"hardness\": 490.0, \"strength\": 1610.0, \"corrosion_resistance\": 5.0}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0036', '锆基非晶高密度合金', '农业版 v1.1', 1, 'Zr₄₀Cu₁₈Ni₁₂Al₁₀Hf₂₀', '{\"hardness\": 545.0, \"strength\": 1750.0, \"corrosion_resistance\": 3.5}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0037', '锆基非晶高强度合金', '工业版 v2.9', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Sc₉', '{\"hardness\": 465.0, \"strength\": 1560.0, \"corrosion_resistance\": 4.0}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0038', '锆基非晶高强度合金', '生产版 v1.8', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀V₉', '{\"hardness\": 530.0, \"strength\": 1690.0, \"corrosion_resistance\": 3.3}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0039', '锆基非晶高强度合金', '农业版 v2.0', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Cr₉', '{\"hardness\": 520.0, \"strength\": 1670.0, \"corrosion_resistance\": 4.0}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-004', '锆基非晶高强度合金', '生产版 v1.2', 1, 'Zr₅₀Cu₂₀Al₁₀Ni₁₀Ti₁₀', '{\"hardness\": 520.0, \"strength\": 1700.0, \"corrosion_resistance\": 3.2}', '2025-10-28 19:19:18', '2025-10-28 19:19:18');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0040', '锆基非晶高密度合金', '生产版 v5.4', 1, 'Zr₅₂Cu₁₈Ni₁₂Al₁₀Mn₈', '{\"hardness\": 495.0, \"strength\": 1630.0, \"corrosion_resistance\": 2.8}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0041', '锆基非晶耐腐蚀合金', '农业版 v3.1', 1, 'Zr₅₂Cu₁₈Ni₁₂Al₁₀Fe₈', '{\"hardness\": 510.0, \"strength\": 1660.0, \"corrosion_resistance\": 3.2}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0042', '锆基非晶高密度合金', '农业版 v2.8', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Co₉', '{\"hardness\": 505.0, \"strength\": 1650.0, \"corrosion_resistance\": 3.9}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0043', '锆基非晶高密度合金', '优化版 v1.7', 1, 'Zr₅₂Cu₁₈Ni₁₂Al₁₀Ga₈', '{\"hardness\": 475.0, \"strength\": 1590.0, \"corrosion_resistance\": 3.8}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0044', '锆基非晶高密度合金', '生产版 v4.7', 1, 'Zr₅₂Cu₁₈Ni₁₂Al₁₀Ge₈', '{\"hardness\": 505.0, \"strength\": 1640.0, \"corrosion_resistance\": 4.0}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0045', '锆基非晶高强度合金', '农业版 v5.9', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Pd₁₂', '{\"hardness\": 500.0, \"strength\": 1630.0, \"corrosion_resistance\": 6.0}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0046', '锆基非晶高密度合金', '农业版 v1.3', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Pt₁₂', '{\"hardness\": 510.0, \"strength\": 1650.0, \"corrosion_resistance\": 6.5}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0047', '锆基非晶高密度合金', '优化版 v2.2', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Au₁₂', '{\"hardness\": 485.0, \"strength\": 1580.0, \"corrosion_resistance\": 5.8}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0048', '锆基非晶耐腐蚀合金', '工业版 v5.9', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Ag₉', '{\"hardness\": 485.0, \"strength\": 1600.0, \"corrosion_resistance\": 4.2}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0049', '锆基非晶耐腐蚀合金', '生产版 v3.4', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Ta₉', '{\"hardness\": 525.0, \"strength\": 1680.0, \"corrosion_resistance\": 4.6}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-005', '锆基非晶高密度合金', '优化版 v2.5', 1, 'Zr₅₀Cu₃₀Al₁₀Ag₁₀', '{\"hardness\": 470.0, \"strength\": 1580.0, \"corrosion_resistance\": 4.0}', '2025-10-28 19:19:18', '2025-10-28 19:19:18');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0050', '锆基非晶高密度合金', '生产版 v3.6', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀Mo₉', '{\"hardness\": 525.0, \"strength\": 1690.0, \"corrosion_resistance\": 4.1}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0051', '锆基非晶耐腐蚀合金', '农业版 v4.2', 1, 'Zr₅₁Cu₁₈Ni₁₂Al₁₀W₉', '{\"hardness\": 540.0, \"strength\": 1710.0, \"corrosion_resistance\": 3.8}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0052', '锆基非晶高密度合金', '生产版 v2.9', 1, 'Zr₅₀Cu₁₈Ni₁₂Al₁₀Nb₁₀', '{\"hardness\": 515.0, \"strength\": 1680.0, \"corrosion_resistance\": 4.3}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0053', '锆基非晶高密度合金', '工业版 v1.5', 1, 'Zr₄₅Cu₁₈Ni₁₂Al₁₀Ti₅Be₁₀', '{\"hardness\": 560.0, \"strength\": 1880.0, \"corrosion_resistance\": 2.7}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0054', '锆基非晶高密度合金', '生产版 v4.6', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Ti₅Nb₇', '{\"hardness\": 535.0, \"strength\": 1730.0, \"corrosion_resistance\": 4.0}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0055', '锆基非晶耐腐蚀合金', '优化版 v5.9', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Ti₅Ta₇', '{\"hardness\": 540.0, \"strength\": 1740.0, \"corrosion_resistance\": 4.3}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0056', '锆基非晶高强度合金', '农业版 v4.7', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Ti₅V₇', '{\"hardness\": 530.0, \"strength\": 1720.0, \"corrosion_resistance\": 3.5}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0057', '锆基非晶耐腐蚀合金', '生产版 v1.2', 1, 'Zr₄₈Cu₁₈Ni₁₂Al₁₀Ti₅Cr₇', '{\"hardness\": 525.0, \"strength\": 1700.0, \"corrosion_resistance\": 3.8}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0058', '锆基非晶高强度合金', '工业版 v3.0', 1, 'Zr₅₆Cu₃₀Al₁₄', '{\"hardness\": 485.0, \"strength\": 1620.0, \"corrosion_resistance\": 3.1}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0059', '锆基非晶高密度合金', '优化版 v4.1', 1, 'Zr₅₅Cu₃₀Al₁₅', '{\"hardness\": 480.0, \"strength\": 1600.0, \"corrosion_resistance\": 3.0}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-006', '锆基非晶高密度合金', '农业版 v5.5', 1, 'Zr₅₅Cu₂₅Al₁₀Co₁₀', '{\"hardness\": 490.0, \"strength\": 1620.0, \"corrosion_resistance\": 3.8}', '2025-10-28 19:19:18', '2025-10-28 19:19:18');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0060', '锆基非晶高密度合金', '农业版 v1.6', 1, 'Zr₅₂.₅Cu₂₅Al₂₂.₅', '{\"hardness\": 490.0, \"strength\": 1580.0, \"corrosion_resistance\": 3.4}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0061', '锆基非晶高密度合金', '优化版 v2.8', 1, 'Zr₅₀Cu₄₀Al₁₀', '{\"hardness\": 450.0, \"strength\": 1550.0, \"corrosion_resistance\": 2.5}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0062', '锆基非晶耐腐蚀合金', '农业版 v1.4', 1, 'Zr₅₀Cu₃₅Al₁₅', '{\"hardness\": 470.0, \"strength\": 1590.0, \"corrosion_resistance\": 2.8}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0063', '锆基非晶高强度合金', '工业版 v4.7', 1, 'Zr₅₀Cu₃₀Al₂₀', '{\"hardness\": 500.0, \"strength\": 1630.0, \"corrosion_resistance\": 3.2}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0064', '锆基非晶高强度合金', '农业版 v2.3', 1, 'Zr₄₈Cu₃₆Al₁₆', '{\"hardness\": 475.0, \"strength\": 1610.0, \"corrosion_resistance\": 2.7}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0065', '锆基非晶耐腐蚀合金', '农业版 v3.5', 1, 'Zr₄₇Cu₃₈Al₁₅', '{\"hardness\": 460.0, \"strength\": 1560.0, \"corrosion_resistance\": 2.5}', '2025-10-28 19:19:19', '2025-10-28 19:19:19');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0066', '锆基非晶耐腐蚀合金', '农业版 v5.7', 1, 'Zr₄₆Cu₃₈Al₁₆', '{\"hardness\": 455.0, \"strength\": 1540.0, \"corrosion_resistance\": 2.4}', '2025-10-28 19:19:20', '2025-10-28 19:19:20');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0067', '锆基非晶高强度合金', '工业版 v2.3', 1, 'Zr₄₅Cu₃₅Al₂₀', '{\"hardness\": 495.0, \"strength\": 1600.0, \"corrosion_resistance\": 3.1}', '2025-10-28 19:19:20', '2025-10-28 19:19:20');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0068', '锆基非晶高强度合金', '优化版 v4.5', 1, 'Zr₄₅Cu₄₀Al₁₅', '{\"hardness\": 445.0, \"strength\": 1520.0, \"corrosion_resistance\": 2.3}', '2025-10-28 19:19:20', '2025-10-28 19:19:20');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0069', '锆基非晶高强度合金', '农业版 v2.7', 1, 'Zr₄₄Cu₃₆Al₂₀', '{\"hardness\": 485.0, \"strength\": 1570.0, \"corrosion_resistance\": 3.0}', '2025-10-28 19:19:20', '2025-10-28 19:19:20');
INSERT INTO `amorphous_alloys` VALUES ('AMA-007', '锆基非晶耐腐蚀合金', '工业版 v2.0', 1, 'Zr₅₆Cu₂₈Al₁₀Y₆', '{\"hardness\": 460.0, \"strength\": 1550.0, \"corrosion_resistance\": 4.5}', '2025-10-28 19:19:18', '2025-10-28 19:19:18');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0070', '锆基非晶高密度合金', '农业版 v3.6', 1, 'Zr₄₂Cu₃₈Al₂₀', '{\"hardness\": 465.0, \"strength\": 1490.0, \"corrosion_resistance\": 2.8}', '2025-10-28 19:19:20', '2025-10-28 19:19:20');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0071', '锆基非晶高密度合金', '优化版 v1.4', 1, 'Zr₆₀Cu₂₅Al₁₅', '{\"hardness\": 470.0, \"strength\": 1590.0, \"corrosion_resistance\": 3.5}', '2025-10-28 19:19:20', '2025-10-28 19:19:20');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0072', '锆基非晶高密度合金', '优化版 v1.1', 1, 'Zr₆₅Cu₂₀Al₁₅', '{\"hardness\": 440.0, \"strength\": 1510.0, \"corrosion_resistance\": 4.0}', '2025-10-28 19:19:20', '2025-10-28 19:19:20');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0073', '锆基非晶耐腐蚀合金', '农业版 v2.4', 1, 'Zr₆₀Cu₃₀Al₁₀', '{\"hardness\": 435.0, \"strength\": 1530.0, \"corrosion_resistance\": 3.0}', '2025-10-28 19:19:20', '2025-10-28 19:19:20');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0074', '锆基非晶高强度合金', '优化版 v5.6', 1, 'Zr₅₈Cu₃₂Al₁₀', '{\"hardness\": 445.0, \"strength\": 1550.0, \"corrosion_resistance\": 2.8}', '2025-10-28 19:19:20', '2025-10-28 19:19:20');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0075', '锆基非晶耐腐蚀合金', '农业版 v5.7', 1, 'Zr₅₇Cu₃₃Al₁₀', '{\"hardness\": 450.0, \"strength\": 1560.0, \"corrosion_resistance\": 2.7}', '2025-10-28 19:19:20', '2025-10-28 19:19:20');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0076', '锆基非晶高强度合金', '工业版 v4.3', 1, 'Zr₅₆Cu₃₄Al₁₀', '{\"hardness\": 455.0, \"strength\": 1570.0, \"corrosion_resistance\": 2.6}', '2025-10-28 19:19:20', '2025-10-28 19:19:20');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0077', '锆基非晶高密度合金', '农业版 v2.4', 1, 'Zr₅₅Cu₃₅Al₁₀', '{\"hardness\": 460.0, \"strength\": 1580.0, \"corrosion_resistance\": 2.5}', '2025-10-28 19:19:20', '2025-10-28 19:19:20');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0078', '铁基非晶耐腐蚀合金', '生产版 v3.5', 1, 'Fe₇₈Si₉B₁₃', '{\"hardness\": 980.0, \"strength\": 3000.0, \"corrosion_resistance\": 1.5}', '2025-10-28 19:22:46', '2025-10-28 19:22:46');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0079', '铁基非晶耐腐蚀合金', '优化版 v5.7', 1, 'Fe₈₀P₁₃C₇', '{\"hardness\": 750.0, \"strength\": 2700.0, \"corrosion_resistance\": 1.2}', '2025-10-28 19:22:46', '2025-10-28 19:22:46');
INSERT INTO `amorphous_alloys` VALUES ('AMA-008', '锆基非晶耐腐蚀合金', '优化版 v3.5', 1, 'Zr₅₃Cu₂₇Al₁₀Nb₁₀', '{\"hardness\": 510.0, \"strength\": 1680.0, \"corrosion_resistance\": 4.2}', '2025-10-28 19:19:18', '2025-10-28 19:19:18');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0080', '铁基非晶高密度合金', '工业版 v4.7', 1, 'Fe₇₂B₂₀Si₅Nb₃', '{\"hardness\": 1100.0, \"strength\": 3500.0, \"corrosion_resistance\": 2.0}', '2025-10-28 19:22:46', '2025-10-28 19:22:46');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0081', '铁基非晶耐腐蚀合金', '生产版 v1.1', 1, 'Fe₇₉B₁₂Si₅P₄', '{\"hardness\": 900.0, \"strength\": 2900.0, \"corrosion_resistance\": 1.3}', '2025-10-28 19:22:46', '2025-10-28 19:22:46');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0082', '铁基非晶高强度合金', '农业版 v5.5', 1, 'Fe₇₈B₁₂Si₇C₃', '{\"hardness\": 850.0, \"strength\": 2800.0, \"corrosion_resistance\": 1.2}', '2025-10-28 19:22:46', '2025-10-28 19:22:46');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0083', '铁基非晶高强度合金', '优化版 v5.2', 1, 'Fe₆₇Cr₁₀B₁₅Si₈', '{\"hardness\": 1200.0, \"strength\": 3200.0, \"corrosion_resistance\": 15.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0084', '铁基非晶高强度合金', '生产版 v4.0', 1, 'Fe₇₆Mo₂B₁₅Si₇', '{\"hardness\": 1050.0, \"strength\": 3300.0, \"corrosion_resistance\": 3.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0085', '铁基非晶高密度合金', '工业版 v4.9', 1, 'Fe₇₀Ni₁₀B₁₅Si₅', '{\"hardness\": 800.0, \"strength\": 2800.0, \"corrosion_resistance\": 2.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0086', '铁基非晶高密度合金', '生产版 v1.1', 1, 'Fe₆₀Co₂₀B₁₅Si₅', '{\"hardness\": 820.0, \"strength\": 2800.0, \"corrosion_resistance\": 2.2}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0087', '铁基非晶耐腐蚀合金', '农业版 v1.5', 1, 'Fe₇₆B₁₅Si₆Al₃', '{\"hardness\": 830.0, \"strength\": 2700.0, \"corrosion_resistance\": 1.8}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0088', '铁基非晶高强度合金', '生产版 v2.9', 1, 'Fe₇₆B₁₅Si₆Ga₃', '{\"hardness\": 840.0, \"strength\": 2750.0, \"corrosion_resistance\": 2.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0089', '铁基非晶高强度合金', '优化版 v3.8', 1, 'Fe₇₆B₁₅Si₆Ge₃', '{\"hardness\": 880.0, \"strength\": 2850.0, \"corrosion_resistance\": 2.2}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-009', '锆基非晶高强度合金', '农业版 v4.9', 1, 'Zr₅₃Cu₂₇Al₁₀Ta₁₀', '{\"hardness\": 530.0, \"strength\": 1700.0, \"corrosion_resistance\": 4.5}', '2025-10-28 19:19:18', '2025-10-28 19:19:18');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0090', '铁基非晶高强度合金', '生产版 v1.7', 1, 'Fe₇₁B₁₅Si₅Nb₄Mo₅', '{\"hardness\": 1150.0, \"strength\": 3600.0, \"corrosion_resistance\": 3.5}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0091', '铁基非晶耐腐蚀合金', '工业版 v3.1', 1, 'Fe₆₈Cr₅B₁₅Si₅Nb₇', '{\"hardness\": 1250.0, \"strength\": 3800.0, \"corrosion_resistance\": 20.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0092', '铁基非晶耐腐蚀合金', '生产版 v2.5', 1, 'Fe₇₀B₁₅Si₅Nb₅W₅', '{\"hardness\": 1180.0, \"strength\": 3700.0, \"corrosion_resistance\": 4.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0093', '铁基非晶耐腐蚀合金', '优化版 v3.0', 1, 'Fe₇₁B₁₅Si₅Nb₄Ta₅', '{\"hardness\": 1160.0, \"strength\": 3650.0, \"corrosion_resistance\": 4.5}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0094', '铁基非晶高密度合金', '生产版 v5.9', 1, 'Fe₇₂.₅B₁₅Si₅Nb₂.₅Y₅', '{\"hardness\": 1050.0, \"strength\": 3400.0, \"corrosion_resistance\": 2.5}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0095', '铁基非晶耐腐蚀合金', '工业版 v1.8', 1, 'Fe₇₁B₁₅Si₅Nb₄Zr₅', '{\"hardness\": 1120.0, \"strength\": 3550.0, \"corrosion_resistance\": 3.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0096', '铁基非晶高强度合金', '农业版 v5.3', 1, 'Fe₇₁B₁₅Si₅Nb₄Hf₅', '{\"hardness\": 1130.0, \"strength\": 3580.0, \"corrosion_resistance\": 3.2}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0097', '铁基非晶高密度合金', '农业版 v5.2', 1, 'Fe₇₁B₁₅Si₅Nb₄Ti₅', '{\"hardness\": 1080.0, \"strength\": 3450.0, \"corrosion_resistance\": 2.8}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0098', '铁基非晶高强度合金', '农业版 v1.8', 1, 'Fe₆₅Cr₁₀Mo₅B₁₅Si₅', '{\"hardness\": 1220.0, \"strength\": 3500.0, \"corrosion_resistance\": 18.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');
INSERT INTO `amorphous_alloys` VALUES ('AMA-0099', '铁基非晶高密度合金', '工业版 v5.8', 1, 'Fe₆₅Cr₁₀W₅B₁₅Si₅', '{\"hardness\": 1240.0, \"strength\": 3550.0, \"corrosion_resistance\": 19.0}', '2025-10-28 19:22:47', '2025-10-28 19:22:47');

SET FOREIGN_KEY_CHECKS = 1;
