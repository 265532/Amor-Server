package com.smartAmor.services;


import lombok.Getter;

@Getter
public enum AIServiceType {
    RECOMMEND(1, "recommend"),
    OPTIMIZE(2, "optimize");

    private final int promptId;
    private final String name;

    AIServiceType(int promptId, String name) {
        this.promptId = promptId;
        this.name = name;
    }

}