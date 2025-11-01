package com.smartAmor.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.smartAmor.entity.Properties;

public class AmorphousAlloysDTO {
    private String id;
    private String name;
    private String version;

    @JsonProperty("base_type_id")
    private int baseTypeId;

    private String formula;
    private Properties properties;

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getVersion() { return version; }
    public void setVersion(String version) { this.version = version; }

    public int getBaseTypeId() { return baseTypeId; }
    public void setBaseTypeId(int baseTypeId) { this.baseTypeId = baseTypeId; }

    public String getFormula() { return formula; }
    public void setFormula(String formula) { this.formula = formula; }

    public Properties getProperties() { return properties; }
    public void setProperties(Properties properties) { this.properties = properties; }
}