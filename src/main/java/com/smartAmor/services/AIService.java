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

    public AIService(WebClient webClient) {
        this.webClient = webClient;
    }

    /**
     * 调用 API
     */
    public Mono<String> chatCompletion(String prompt) {
        ChatCompletionRequest request = new ChatCompletionRequest(
                "deepseek-chat",
                List.of(new ChatCompletionRequest.Message("user", prompt)),
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