package com.smartAmor.entity;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.io.Serializable;

@Data
public class PropertiesEntity implements Serializable {
    private double hardness;
    private double strength;
    @JsonProperty("corrosion_resistance")
    private double corrosionResistance;

    // 必须有无参构造函数
    public PropertiesEntity() {
    }

    public PropertiesEntity(double hardness, double strength, double corrosionResistance) {
        this.hardness = hardness;
        this.strength = strength;
        this.corrosionResistance = corrosionResistance;
    }

    // 将对象转换为 JSON 字符串
    public String toJson() {
        try {
            ObjectMapper mapper = new ObjectMapper();
            return mapper.writeValueAsString(this);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("Failed to serialize PropertiesEntity to JSON", e);
        }
    }

    // 将 JSON 字符串解析为对象
    public static PropertiesEntity fromJson(String json) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            return mapper.readValue(json, PropertiesEntity.class);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("Failed to deserialize JSON to PropertiesEntity", e);
        }
    }
}