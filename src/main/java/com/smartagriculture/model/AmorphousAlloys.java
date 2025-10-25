package com.smartagriculture.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
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

    @Column(name = "base_type_id")
    private Integer baseTypeId;

    @Column(name = "formula", length = 255)
    private String formula;

    // JSON 字符串存储，使用 TEXT 以容纳较大属性集
    @Column(name = "properties", columnDefinition = "TEXT")
    private String properties;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    public AmorphousAlloys() {
    }

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

    public String getProperties() {
        return properties;
    }

    public void setProperties(String properties) {
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
