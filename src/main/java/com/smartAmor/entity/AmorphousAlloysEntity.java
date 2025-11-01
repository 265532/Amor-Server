package com.smartAmor.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.smartAmor.typeHandler.PropertiesTypeHandler;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@TableName("amorphous_alloys")
public class AmorphousAlloysEntity {
    private String id;
    private String name;
    private String version;

    @JsonProperty("base_type_id")
    private Integer baseTypeId;

    private String formula;

    @TableField(value = "properties", typeHandler = PropertiesTypeHandler.class)
    private PropertiesEntity properties;

    @JsonProperty("created_at")
    private LocalDateTime createdAt;

    @JsonProperty("updated_at")
    private LocalDateTime updatedAt;

    public Object getHardness() {
        return properties != null ? properties.getHardness() : null;
    }

    public Object getStrength() {
        return properties != null ? properties.getStrength() : null;
    }

    public Object getCorrosionResistance() {
        return properties != null ? properties.getCorrosionResistance() : null;
    }

}