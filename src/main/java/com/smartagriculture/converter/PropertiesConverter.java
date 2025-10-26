package com.smartagriculture.converter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smartagriculture.model.amorphous.alloys.Properties;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

@Converter(autoApply = true)
public class PropertiesConverter implements AttributeConverter<Properties, String> {
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public String convertToDatabaseColumn(Properties properties) {
        try {
            return objectMapper.writeValueAsString(properties);
        } catch (Exception e) {
            throw new RuntimeException("转换Properties对象失败", e);
        }
    }

    @Override
    public Properties convertToEntityAttribute(String json) {
        try {
            return objectMapper.readValue(json, Properties.class);
        } catch (Exception e) {
            throw new RuntimeException("解析JSON到Properties失败", e);
        }
    }
}