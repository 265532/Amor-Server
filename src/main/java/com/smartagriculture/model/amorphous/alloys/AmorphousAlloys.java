package com.smartagriculture.model.amorphous.alloys;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.smartagriculture.converter.PropertiesConverter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "amorphous_alloys")
public class AmorphousAlloys {
    @Id
    @Column(name = "id", nullable = false, length = 64)
    private String id;

    @Column(name = "name", nullable = false, length = 255)
    private String name;

    @Column(name = "version", length = 128)
    private String version;

    @JsonProperty("base_type_id")
    @Column(name = "base_type_id", nullable = false)
    private int baseTypeId;

    @Column(name = "formula", length = 255)
    private String formula;

    @Convert(converter = PropertiesConverter.class)
    @Column(name = "properties", nullable = false, columnDefinition = "JSON")
    private Properties properties;

    @JsonProperty("created_at")
    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @JsonProperty("updated_at")
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public int getBaseTypeId() {
        return baseTypeId;
    }

    public void setBaseTypeId(int baseTypeId) {
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

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }
}
