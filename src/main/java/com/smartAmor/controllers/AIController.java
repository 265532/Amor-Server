package com.smartAmor.controllers;

import com.smartAmor.services.AIService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.http.codec.ServerSentEvent;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.Map;

@RestController
@RequestMapping("/api/ai")
@Slf4j
public class AIController {

    private final AIService aiService;
//    private final LocalAIService localAIService;
//
//    public AIController(AIService aiService, LocalAIService localAIService) {
//        this.aiService = aiService;
//        this.localAIService = localAIService;
//    }

    public AIController(AIService aiService) {
        this.aiService = aiService;
    }

    /**
     * 普通聊天接口
     */
    @PostMapping("/chat")
    public Mono<Map<String, Object>> chat(@RequestBody Map<String, String> request) {
        String message = request.get("message");
        String type = request.getOrDefault("type", "cloud"); // cloud 或 local

        Mono<String> response;
//        if ("local".equals(type)) {
//            response = localAIService.generateWithLocalModel(message, "llama2");
//        } else {
//            response = aiService.chatCompletion(message);
//        }
        response = aiService.chatCompletion(message);

        return response.map(result -> Map.of(
                "success", true,
                "data", result,
                "timestamp", System.currentTimeMillis()
        ));
    }

    /**
     * 流式聊天接口（SSE）
     */
    @GetMapping(value = "/chat/stream", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public Flux<ServerSentEvent<String>> streamChat(
            @RequestParam String message,
            @RequestParam(defaultValue = "cloud") String type) {

        Flux<String> flux;
        if ("local".equals(type)) {
            // 本地模型的流式接口需要根据具体实现调整
            flux = Flux.just("暂不支持本地模型流式响应");
        } else {
            flux = aiService.streamChatCompletion(message);
        }

        return flux.map(content -> ServerSentEvent.builder(content).build());
    }
}