package com.smartAmor.controllers;

import com.smartAmor.entity.AmorphousAlloysEntity;
import com.smartAmor.entity.Properties;
import com.smartAmor.services.AmorphousAlloysService;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.stream.Collectors;

public class TestController {
    private final AmorphousAlloysService amorphousAlloysService;

    private static final List<String> RAW_DATA = List.of(
    );

    private static final String[] names = {
            "高强度",
            "高密度",
            "耐腐蚀"
    };
    private static final String[] versions = {
            "优化",
            "生产",
            "农业",
            "工业"
    };

    public TestController(AmorphousAlloysService amorphousAlloysService) {
        this.amorphousAlloysService = amorphousAlloysService;
    }

    @PostMapping("/create/test")
    public void createAmorphousAlloyTest() {
        List<TestController.MaterialData> materials = parseRawData(RAW_DATA);
        int count = amorphousAlloysService.getCount();
        for (int i = 0; i < materials.size(); i++) {
            TestController.MaterialData data = materials.get(i);
            AmorphousAlloysEntity body = new AmorphousAlloysEntity();
            body.setId("AMA-" + String.format("%03d", (count + i) + 1));
            body.setBaseTypeId(5);
            body.setName("钯基非晶" + names[(int) (Math.random() * names.length)] + "合金");
            body.setVersion(versions[(int) (Math.random() * versions.length)] + "版 v" + String.format("%.1f", (Math.random() * 5 + 1)));
            body.setFormula(data.getFormula());
            body.setProperties(new Properties(data.getHardness(), data.getStrength(), data.getCorrosion_resistance()));
            amorphousAlloysService.create(body);
        }
    }

    static class MaterialData {
        private final String name;
        private final String formula;
        private final double hardness;
        private final double strength;
        private final double corrosion_resistance;

        public MaterialData(String name, String formula,
                            double hardness, double strength, double corrosion_resistance) {
            this.name = name;
            this.formula = formula;
            this.hardness = hardness;
            this.strength = strength;
            this.corrosion_resistance = corrosion_resistance;
        }

        // 获取插入参数
        public Object[] getInsertParams() {
            return new Object[]{
                    name,
                    formula,
                    hardness,
                    strength,
                    corrosion_resistance
            };
        }

        public String getName() {
            return name;
        }

        public String getFormula() {
            return formula;
        }

        public double getHardness() {
            return hardness;
        }

        public double getStrength() {
            return strength;
        }

        public double getCorrosion_resistance() {
            return corrosion_resistance;
        }
    }

    private static List<MaterialData> parseRawData(List<String> rawData) {
        return rawData.stream()
                .map(line -> {
                    String[] parts = line.split("\\|");
                    if (parts.length != 5) return null;

                    return new MaterialData(
                            parts[0].trim(),
                            parts[1].trim(),
                            Double.parseDouble(parts[2].trim()),
                            Double.parseDouble(parts[3].trim()),
                            Double.parseDouble(parts[4].trim())
                    );
                })
                .filter(material -> material != null)
                .collect(Collectors.toList());
    }
}
