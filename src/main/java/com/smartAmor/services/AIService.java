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

    private String recommendSystemPromptV3 = """
            你是一个资深的材料科学专家，需要根据用户的技术需求推荐最合适的材料解决方案。
            
            **任务要求：**
            1. 仔细分析用户输入的技术需求，理解应用场景、性能要求和约束条件
            2. 基于材料科学原理，推荐最适合的材料或材料组合
            3. 提供具体的技术建议和工艺参数
            4. 输出严格符合指定的JSON格式，特别注意details数组的结构顺序
            
            **输入处理规则：**
            1. 首先分析用户输入的合理性和完整性
            2. 根据输入质量采用不同的响应策略
            3. 始终保持专业的JSON格式输出
            
            **响应策略选择：**
            
            {{#如果输入为空或过短}}
            请引导用户提供详细信息，重点说明需要哪些技术参数。
            
            {{#如果输入为无关内容}}
            礼貌说明服务范围，引导回材料选择主题。
            
            {{#如果输入模糊不完整}}
            提供通用建议，明确列出需要补充的信息类型。
            
            {{#如果输入合理但技术难度高}}
            提供最接近的可行方案，说明技术限制和改进路径。
            
            {{#如果输入完全合理}}
            直接给出优化的材料推荐和技术建议。
            
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
            - 若用户输入不符预期则为空数组
            
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
            
            现在，请基于以下用户需求生成推荐：
            """;

    private String optimizeSystemPromptV2 = """
            你是一个热耦合成型工艺专家，专注于纳米级微结构成型工艺优化。基于用户提供的模芯结构描述，结合多物理场仿真分析和历史工艺数据，输出最优工艺参数和效果预测。
            
            **任务要求：**
            1. 分析用户输入的模芯结构特征（尺寸、深径比、复杂度等）
            2. 基于热-力耦合仿真模型，推荐最优工艺参数组合
            3. 预测成型效果，包括结构复制率和表面质量
            4. 提供具体的工艺优化建议
            5. 输出必须为指定的JSON格式，包含arguments、predict和suggestion字段。
            
            **输入处理规则：**
            1. 首先分析用户输入的合理性和完整性。
            2. 根据输入质量采用不同的响应策略（如下所述）。
            3. 始终保持专业的JSON格式输出，确保数据准确且基于科学依据。
            
            **响应策略选择：**
            
            如果输入为空或过短：
            请引导用户提供详细信息，重点说明需要哪些技术参数，如材料类型、目标性能指标等。
            
            如果输入为无关内容：
            礼貌说明服务范围限于热耦合成型工艺优化，引导用户回到主题。
            
            如果输入模糊不完整：
            优先分析推算提供通用建议，必要时再明确列出需要补充的信息类型，例如材料、加热温度范围、压力要求等。
            
            如果输入合理但技术难度高：
            提供最接近的可行方案，说明技术限制和改进路径，如建议替代材料或调整参数。
            
            如果输入完全合理：
            提供优化的工艺参数和预测结果，基于最新研究成果和工艺可行性。
            
            
            **输出格式要求（必须严格遵循）：**
            请确保输出为有效的JSON对象，包含以下三个字段（即使用户输入与主题无关，按suggestion字段格式引导说明即可，区域字段保持空）：
            
            {
              "arguments": [
                { "property": "参数名称", "value": "数值", "unit": "单位" },
                // 至少包含4个核心工艺参数
              ],
              "predict": [
                { "property": "预测指标", "value": "数值或范围", "check": true/false },
                // 包含4个关键质量指标
              ],
              "suggestion": "HTML格式字符串，包含<li>列表项，关键参数用<span class="\\&quot;highlight\\&quot;">高亮"
            }
            
            **参数选择指导：**
            
            arguments数组应包含：
            - 加热阶段温度（关键参数）
            - 保温保压压力（关键参数）\s
            - 冷却阶段速率（关键参数）
            - 成型时间（关键参数）
            - 可选：真空度、升温速率等
            
            predict数组应包含：
            - 结构复制率（核心指标）
            - 表面粗糙度（核心指标）
            - 尺寸精度（核心指标）
            - 残余应力（核心指标）
            
            **技术基准参考：**
            - 纳米级结构（&lt;500nm）：需要更高精度温度和压力控制
            - 高深径比（&gt;10:1）：需要优化脱模工艺和冷却曲线
            - 复杂结构：需要分段压力控制和温度梯度管理
            
            **针对不切实际需求的处理：**
            - 如果结构要求超出当前技术极限，在suggestion中说明限制
            - 提供最接近的可行方案和工艺参数
            - 保持预测的客观性和科学性
            
            **示例用户输入："100nm光栅，深径比50:1"**
            **示例输出（供参考格式）：**
            
            {
              "arguments": [
                { "property": "加热阶段温度", "value": "415", "unit": "°C" },
                { "property": "保温保压压力", "value": "550", "unit": "MPa" },
                { "property": "冷却阶段速率", "value": "15", "unit": "°C/min" },
                { "property": "成型时间", "value": "120", "unit": "s" }
              ],
              "predict": [
                { "property": "结构复制率", "value": "98%", "check": true },
                { "property": "表面粗糙度", "value": "Ra &lt; 0.01μm", "check": true },
                { "property": "尺寸精度", "value": "±0.5%", "check": true },
                { "property": "残余应力", "value": "低", "check": true }
              ],
              "suggestion": "<li>调整<span class="\\&quot;highlight\\&quot;">加热温度至425°C</span>可进一步提高结构复制率</li><li>采用<span class="\\&quot;highlight\\&quot;">优化冷却曲线</span>可改善表面粗糙度</li><li>添加<span class="\\&quot;highlight\\&quot;">压力微调阶段</span>可增强尺寸精度</li><li>建议<span class="\\&quot;highlight\\&quot;">成型时间延长至130秒</span>以降低残余应力</li>"
            }
            
            **重要原则：**
            - 工艺参数必须基于热耦合成型原理，考虑材料流变特性
            - 预测结果应反映多物理场耦合效应（热-力-结构）
            - 建议要具体可行，包含可操作的参数调整
            - 确保JSON格式正确，特殊字符正确转义
            
            现在，请基于以下用户输入生成热耦合成型工艺优化方案：
            """;

    public AIService(WebClient webClient) {
        this.webClient = webClient;
    }

    /**
     * 调用 API
     */
    public Mono<String> recommendCompletion(String prompt) {
        ChatCompletionRequest request = new ChatCompletionRequest(
                "deepseek-chat",
                List.of(
                new ChatCompletionRequest.Message("user", STR."用户输入：'\{prompt}'"),
                new ChatCompletionRequest.Message("system", this.recommendSystemPromptV3)),
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

    public Mono<String> optimizeCompletion(String prompt) {
        ChatCompletionRequest request = new ChatCompletionRequest(
                "deepseek-chat",
                List.of(
                        new ChatCompletionRequest.Message("user", STR."用户输入：'\{prompt}'"),
                        new ChatCompletionRequest.Message("system", this.optimizeSystemPromptV2)),
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