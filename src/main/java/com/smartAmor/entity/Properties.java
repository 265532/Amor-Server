package com.smartAmor.entity;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;

public class Properties implements Serializable {
    private double hardness;
    private double strength;
    @JsonProperty("corrosion_resistance")
    private double corrosionResistance;

    // 必须有无参构造函数
    public Properties() {
    }

    public Properties(double hardness, double strength, double corrosionResistance) {
        this.hardness = hardness;
        this.strength = strength;
        this.corrosionResistance = corrosionResistance;
    }

    // getters and setters
    public double getHardness() {
        return hardness;
    }

    public void setHardness(double hardness) {
        this.hardness = hardness;
    }

    public double getStrength() {
        return strength;
    }

    public void setStrength(double strength) {
        this.strength = strength;
    }

    public double getCorrosionResistance() {
        return corrosionResistance;
    }

    public void setCorrosionResistance(double corrosionResistance) {
        this.corrosionResistance = corrosionResistance;
    }

    // 将对象转换为 JSON 字符串
    public String toJson() {
        try {
            ObjectMapper mapper = new ObjectMapper();
            return mapper.writeValueAsString(this);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("Failed to serialize Properties to JSON", e);
        }
    }

    // 将 JSON 字符串解析为对象
    public static Properties fromJson(String json) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            return mapper.readValue(json, Properties.class);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("Failed to deserialize JSON to Properties", e);
        }
    }
}