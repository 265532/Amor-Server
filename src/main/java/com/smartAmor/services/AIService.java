package com.smartAmor.services;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smartAmor.dto.request.ChatCompletionRequest;
import com.smartAmor.dto.response.ChatCompletionResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class AIService {

    private final WebClient webClient;

    private final String systemPromptV1 = """
            你是一个资深的材料科学专家，需要根据用户的技术需求推荐最合适的材料解决方案。
            
            **任务要求：**
            1. 仔细分析用户输入的技术需求，理解应用场景、性能要求和约束条件
            2. 基于材料科学原理，推荐最适合的材料或材料组合
            3. 提供具体的技术建议和工艺参数
            4. 输出严格符合指定的JSON格式，特别注意details数组的结构顺序
            
            **输出格式规范：**
            请确保输出为有效的JSON对象，包含以下三个字段：
            
            {
              "recommendedResultName": "推荐的材料名称",
              "suggestion": "HTML格式的技术建议，使用<li>列表项，关键参数用<span class="\\&quot;highlight\\&quot;">高亮",
              "details": [
                {
                  "property": "属性名称",
                  "value": "属性值",\s
                  "reference": "说明或依据",
                  "hightlight": true/false
                }
              ]
            }
            
            **details数组结构要求（必须严格遵守）：**
            - 前3-4个元素必须是材料成分百分比（如元素含量）
            - 材料成分百分比需给出具体的值而不是范围
            - 后续元素为材料性能和工艺特性
            - 总元素数量保持在5-8个
            - 重要属性设置hightlight: true
            
            **内容生成指导：**
            - 材料推荐应基于科学依据，考虑性能、成本、工艺可行性等因素
            - 建议部分应包含4-6条具体可行的技术建议
            - 确保JSON字符串中的特殊字符正确转义
            
            **正确结构示例：**
            {
              "recommendedResultName": "Zr基非晶合金",
              "suggestion": "<li>可将<span class="\\&quot;highlight\\&quot;">Zr含量提升至58%</span>...</li>",
              "details": [
                { "property": "Zr含量", "value": "55%", "reference": "主要组元", "hightlight": true },
                { "property": "Cu含量", "value": "10%", "reference": "辅助组元", "hightlight": false },
                { "property": "Al含量", "value": "10%", "reference": "辅助组元", "hightlight": false },
                { "property": "Ni含量", "value": "5%", "reference": "微量添加", "hightlight": false },
                { "property": "预测硬度", "value": "(HV) ≥550", "reference": "满足高硬度需求", "hightlight": true },
                { property": "耐腐蚀性", "value": "极佳", "reference": "适合生物环境", "hightlight": true }
              ]
            }
            
            **重要原则：**
            - details数组必须按照"成分百分比在前，性能特性在后"的顺序排列
            - 如果是复合材料或非金属材料，前几项也应该是主要组成成分
            - 确保推荐的科学性和实用性
            
            现在，请基于以下用户需求生成推荐：""";

    private final String systemPromptV2 = """ 
             你是一个材料科学专家，负责根据用户输入的材料需求推荐合适的材料，并输出特定JSON格式的数据。用户输入是中文描述，你需要解析需求并生成推荐。
            
             请严格按照以下JSON格式输出，不要有任何额外文本或解释：
            
             {
               "recommendedResultName": "推荐的材料名称字符串",
               "suggestion": "HTML格式的字符串，包含<li>列表项，其中关键部分用<span class="\\&quot;highlight\\&quot;">包裹",
               "details": [
                 {
                   "property": "属性名称字符串",
                   "value": "属性值字符串",
                   "reference": "参考说明字符串",
                   "hightlight": "布尔值（true或false）"
                 }
                 // 可根据需要添加多个细节对象
               ]
             }
            
             输出要求：
             - "recommendedResultName"：基于用户需求，推荐一个具体材料名称（如"Zr基非晶合金"）。
             - "suggestion"：提供4-5条具体建议，每条用<li>开头，包含工艺、成分调整等，关键参数用<span class="highlight">高亮。
             - "details"：数组应包含5-8个属性对象，覆盖材料成分、物理性能和适用性。属性名和值用中文，"hightlight"字段为true表示重要属性需高亮显示。
             - 所有内容应基于材料科学知识，确保合理性和针对性。
             - **重要：确保JSON字符串中的特殊字符正确转义，特别是双引号必须使用反斜杠转义（如`\\"`），以保证JSON格式有效。**
            
             示例用户输入："纳米级微流控芯片模芯，需100nm通道、耐生物腐蚀"
             示例输出（供参考，但需根据实际需求生成）：
             {
               "recommendedResultName": "Zr基非晶合金",
               "suggestion": "<li>可将<span class="\\&quot;highlight\\&quot;">Zr含量提升至58%</span>，预计提升20%弹性，同时保持非晶形成能力</li><li>建议控制<span class="\\&quot;highlight\\&quot;">冷却速率在10⁶ K/s</span>以上，确保非晶结构形成</li><li>添加<span class="\\&quot;highlight\\&quot;">0.5%的Y元素</span>可提高耐腐蚀性，特别适用于生物微流控环境</li><li>热处理工艺推荐：<span class="\\&quot;highlight\\&quot;">380℃退火30分钟</span>，可优化内应力分布</li>",
               "details": [
                 { "property": "Zr含量", "value": "55%", "reference": "主要组元", "hightlight": true },
                 { "property": "Cu含量", "value": "10%", "reference": "辅助组元", "hightlight": false },
                 { "property": "Al含量", "value": "10%", "reference": "辅助组元", "hightlight": false },
                 { "property": "Ni含量", "value": "5%", "reference": "微量添加", "hightlight": false },
                 { "property": "预测硬度", "value": "(HV) ≥550", "reference": "满足高硬度需求", "hightlight": true },
                 { "property": "耐腐蚀性", "value": "极佳", "reference": "适合生物环境", "hightlight": true },
                 { "property": "表面精度", "value": "Ra ≤ 0.01μm", "reference": "满足纳米级要求", "hightlight": true }
               ]
             }
            
             现在，请根据以下用户输入生成JSON响应：
            """;

    public AIService(WebClient webClient) {
        this.webClient = webClient;
    }

    /**
     * 调用 API
     */
    public Mono<String> chatCompletion(String prompt) {
        ChatCompletionRequest request = new ChatCompletionRequest(
                "deepseek-chat",
                List.of(new ChatCompletionRequest.Message("user", STR."用户输入：'\{prompt}'"), new ChatCompletionRequest.Message("system", this.systemPromptV1)),
                0.7
        );

        return webClient.post()
                .uri("/chat/completions")
                .bodyValue(request)
                .retrieve()
                .bodyToMono(ChatCompletionResponse.class)
                .map(response -> {
                    if (response.getChoices() != null && !response.getChoices().isEmpty()) {
                        return response.getChoices().get(0).getMessage().getContent();
                    }
                    return "未获取到响应";
                })
                .doOnError(error -> log.error("调用AI接口失败", error))
                .onErrorReturn("服务暂时不可用，请稍后重试");
    }

    /**
     * 流式响应（用于实时输出）
     */
    public Flux<String> streamChatCompletion(String prompt) {
        // 流式请求对象（根据具体API调整）
        Map<String, Object> streamRequest = Map.of(
                "model", "deepseek-chat",
                "messages", List.of(Map.of("role", "user", "content", prompt)),
                "stream", true
        );

        return webClient.post()
                .uri("/chat/completions")
                .bodyValue(streamRequest)
                .retrieve()
                .bodyToFlux(String.class)
                .filter(line -> line.startsWith("data: "))
                .map(line -> line.substring(6))
                .filter(data -> !data.equals("[DONE]"))
                .map(data -> {
                    try {
                        ObjectMapper mapper = new ObjectMapper();
                        JsonNode node = mapper.readTree(data);
                        return node.path("choices").get(0).path("delta").path("content").asText();
                    } catch (Exception e) {
                        return "";
                    }
                })
                .filter(content -> !content.isEmpty());
    }
}