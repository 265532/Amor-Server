package com.smartAmor.services;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smartAmor.dto.request.ChatCompletionRequest;
import com.smartAmor.dto.response.ChatCompletionResponse;
import com.smartAmor.mapper.AIMapper;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.List;
import java.util.Map;

@Slf4j

abstract public class AIService {

    @Autowired
    private WebClient webClient;

    @Autowired
    private AIMapper aiMapper;

    @Getter
    private final int systemPromptId;

    @Getter
    @Setter
    private String model;

    @Getter
    @Setter
    private double temperature;

    @Autowired
    private ObjectMapper objectMapper;

//    @Setter
//    @Getter
//    private List<ChatCompletionRequest.Message> messageList;

    public AIService(int systemPromptId) {
        this.systemPromptId = systemPromptId;
        this.model = "deepseek-chat";
        this.temperature = 0.7;
    }

    public AIService(int systemPromptId, String model) {
        this.systemPromptId = systemPromptId;
        this.model = model;
        this.temperature = 0.7;
    }

    public AIService(int systemPromptId, String model, double temperature) {
        this.systemPromptId = systemPromptId;
        this.model = model;
        this.temperature = temperature;
    }

    /**
     * 调用 API
     */
    public Mono<String> chatCompletion(String prompt) {
        String systemPrompt = aiMapper.selectById(this.getSystemPromptId()).getPrompt();
        if (systemPrompt == null) {
            log.error("未找到systemPromptId: {} 对应的提示词", systemPromptId);
            return Mono.just("系统配置错误");
        }
        ChatCompletionRequest request = new ChatCompletionRequest(
                this.getModel(),
                List.of(
                        new ChatCompletionRequest.Message("system", systemPrompt),
                        new ChatCompletionRequest.Message("user", STR."用户输入：'\{sanitizeInput(prompt)}'")
                ),
                this.getTemperature()
        );

        return this.buildResult(request);

    }

//    public Mono<String> optimizeCompletion(String prompt) {
//        String optimizeSystemPromptV2 = aiMapper.selectById(2).getPrompt();
//        ChatCompletionRequest request = new ChatCompletionRequest(
//                "deepseek-chat",
//                List.of(
//                        new ChatCompletionRequest.Message("user", STR."用户输入：'\{prompt}'"),
//                        new ChatCompletionRequest.Message("system", optimizeSystemPromptV2)),
//                0.7
//        );
//
//        return this.buildResult(request);
//    }

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
                        ObjectMapper mapper = this.objectMapper;
                        JsonNode node = mapper.readTree(data);
                        JsonNode choices = node.path("choices");
                        if (choices.isArray() && !choices.isEmpty()) {
                            JsonNode delta = choices.get(0).path("delta");
                            if (delta.has("content")) {
                                return delta.path("content").asText();
                            }
                        }
                        return "";
                    } catch (Exception e) {
                        log.warn("解析SSE数据失败: {}", data, e);
                        return "";
                    }
                })
                .filter(content -> !content.isEmpty());
    }

    private Mono<String> buildResult(ChatCompletionRequest request) {
        return webClient.post()
                .uri("/chat/completions")
                .bodyValue(request)
                .retrieve()
                .bodyToMono(ChatCompletionResponse.class)
                .map(response -> {
                    if (response.getChoices() != null && !response.getChoices().isEmpty()) {
                        return response.getChoices().getFirst().getMessage().getContent();
                    }
                    return "未获取到响应";
                })
                .doOnError(error -> log.error("调用AI接口失败", error))
                .onErrorResume(error -> {
                    log.error("AI服务调用失败，prompt: {}, systemPromptId: {}", aiMapper.selectById(this.getSystemPromptId()), systemPromptId, error);
                    return Mono.just("服务暂时不可用，请稍后重试");
                });
    }


    private String sanitizeInput(String input) {
        // 基本的输入清理逻辑
        return input.replace("\"", "\\\"")
                .replace("\n", " ")
                .replace("\r", "")
                .trim();
    }
}