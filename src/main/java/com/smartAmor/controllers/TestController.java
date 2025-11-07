package com.smartAmor.controllers;

import com.smartAmor.entity.AmorphousAlloysEntity;
import com.smartAmor.entity.PropertiesEntity;
import com.smartAmor.services.interfaces.AmorphousAlloysService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Validated
@RestController
@RequestMapping("/api/test")
public class TestController {
    private final AmorphousAlloysService amorphousAlloysService;

    private static final List<String> RAW_DATA = List.of(
            "Zr-Cu-Al | Zr₅₅Cu₃₀Al₁₅ | 1600 | 480 | 3.0",
            "Zr-Cu-Ni-Al | Zr₅₂.₅Cu₁₇.₉Ni₁₄.₆Al₁₀ | 1650 | 500 | 3.5",
            "Zr-Cu-Ti-Ni-Be | Zr₄₄Cu₁₂Ti₁₁Ni₁₀Be₂₃ | 1900 | 550 | 2.5",
            "Zr-Cu-Al-Ni-Ti | Zr₅₀Cu₂₀Al₁₀Ni₁₀Ti₁₀ | 1700 | 520 | 3.2",
            "Zr-Cu-Al-Ag | Zr₅₀Cu₃₀Al₁₀Ag₁₀ | 1580 | 470 | 4.0",
            "Zr-Cu-Al-Co | Zr₅₅Cu₂₅Al₁₀Co₁₀ | 1620 | 490 | 3.8"
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
            body.setBaseTypeId(1);
            body.setName("锆基非晶" + names[(int) (Math.random() * names.length)] + "合金");
            body.setVersion(versions[(int) (Math.random() * versions.length)] + "版 v" + String.format("%.1f", (Math.random() * 5 + 1)));
            body.setFormula(data.getFormula());
            body.setProperties(new PropertiesEntity(data.getHardness(), data.getStrength(), data.getCorrosion_resistance()));
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
                            double strength, double hardness, double corrosion_resistance) {
            this.name = name;
            this.formula = formula;
            this.strength = strength;
            this.hardness = hardness;
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

    @GetMapping("/stream")
    public void testStream(String msg, HttpServletResponse response) {
        System.out.println(msg);
        response.setContentType("text/event-stream");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter writer = response.getWriter()) {
            sendMessage(msg, writer);
            writer.write("data:end\n\n");
            writer.flush();
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }

    private void sendMessage(String content, PrintWriter writer) throws InterruptedException {
        Map<String, Object> params = new HashMap<>();
        params.put("model", "deepseek-chat");

        Map<String, String> message = new HashMap<>();
        message.put("role", "user");
        message.put("content", content);

        List<Map> messages = new ArrayList<>();
        messages.add(message);
        params.put("messages", messages);
        params.put("stream", true);

    }
}
