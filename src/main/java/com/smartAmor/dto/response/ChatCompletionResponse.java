package com.smartAmor.dto.response;

import lombok.Data;

import java.util.List;

@Data
public class ChatCompletionResponse {
    private List<Choice> choices;

    @Data
    public static class Choice {
        private Message message;
        private String finishReason;
        private int index;
    }

    @Data
    public static class Message {
        private String role;
        private String content;
    }
}