package com.smartAmor.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.smartAmor.entity.Properties;

import javax.validation.constraints.NotBlank;

public class AmorphousAlloysReq {
    @NotBlank(message = "名称不能为空")
    private String name;
    private String version;
    @NotBlank(message = "基体类型不能为空")
    @JsonProperty("base_type_id")
    private Integer baseTypeId;
    @NotBlank(message = "化学式不能为空")
    private String formula;
    private Properties properties;

    public AmorphousAlloysReq(String name, String version, Integer baseTypeId, String formula, Properties properties) {
        this.name = name;
        this.version = version;
        this.baseTypeId = baseTypeId;
        this.formula = formula;
        this.properties = properties;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public Integer getBaseTypeId() {
        return baseTypeId;
    }

    public void setBaseTypeId(Integer baseTypeId) {
        this.baseTypeId = baseTypeId;
    }

    public String getFormula() {
        return formula;
    }

    public void setFormula(String formula) {
        this.formula = formula;
    }

    public Properties getProperties() {
        return properties;
    }

    public void setProperties(Properties properties) {
        this.properties = properties;
    }
}
