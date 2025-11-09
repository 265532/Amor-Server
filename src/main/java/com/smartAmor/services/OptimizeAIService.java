package com.smartAmor.services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class OptimizeAIService extends AIService{
    public OptimizeAIService() {
        super(AIServiceType.OPTIMIZE.getPromptId());
    }
}
