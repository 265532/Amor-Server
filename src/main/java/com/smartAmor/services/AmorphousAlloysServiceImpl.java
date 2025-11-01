package com.smartAmor.services;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.smartAmor.entity.PropertiesEntity;
import com.smartAmor.mapper.AmorphousAlloysMapper;
import com.smartAmor.mapper.BaseTypesMapper;
import com.smartAmor.entity.AmorphousAlloysEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class AmorphousAlloysServiceImpl implements AmorphousAlloysService {

    @Autowired
    private AmorphousAlloysMapper amorphousAlloysMapper;

    @Autowired
    private BaseTypesMapper baseTypesMapper;

    @Override
    public AmorphousAlloysEntity getInfoById(String id) {
        return amorphousAlloysMapper.selectById(id);
    }

    @Override
    public Page<AmorphousAlloysEntity> selectListByPage(int startPage, int size) {
        Page<AmorphousAlloysEntity> page = new Page<>(startPage, size);
        return amorphousAlloysMapper.selectPage(page, null);
    }

    @Override
    @Transactional
    public AmorphousAlloysEntity create(AmorphousAlloysEntity amorphousAlloysEntity) {
        // 验证基体类型是否存在
        int baseTypeId = amorphousAlloysEntity.getBaseTypeId();
        String amorphousAlloysID = amorphousAlloysEntity.getId();

        // 检查ID是否已存在
        if (amorphousAlloysID != null && amorphousAlloysMapper.existsById(amorphousAlloysID)) {
            throw new IllegalArgumentException("ID already exists: " + amorphousAlloysID);
        }

        // 检查基体类型是否存在
        if (baseTypesMapper.selectById(baseTypeId) == null) {
            throw new IllegalArgumentException("无效的基体类型ID: " + baseTypeId);
        }

        // 验证必填字段
        if (amorphousAlloysEntity.getProperties() == null) {
            throw new IllegalArgumentException("PropertiesEntity cannot be null");
        }

        // 验证属性值
        PropertiesEntity props = amorphousAlloysEntity.getProperties();
        if (props.getHardness() <= 0 ||
                props.getStrength() <= 0 ||
                props.getCorrosionResistance() <= 0) {
            throw new IllegalArgumentException("Property values must be positive");
        }

        // 设置时间戳
        LocalDateTime now = LocalDateTime.now();
        amorphousAlloysEntity.setCreatedAt(now);
        amorphousAlloysEntity.setUpdatedAt(now);

        // 插入数据
        amorphousAlloysMapper.insert(amorphousAlloysEntity);

        return amorphousAlloysMapper.selectById(amorphousAlloysEntity.getId());
    }

    @Override
    @Transactional
    public AmorphousAlloysEntity updateById(AmorphousAlloysEntity amorphousAlloysEntity) {
        String id = amorphousAlloysEntity.getId();
        AmorphousAlloysEntity existing = amorphousAlloysMapper.selectById(id);
        if (existing == null) {
            throw new IllegalArgumentException("无效的ID: " + id);
        }

        amorphousAlloysEntity.setCreatedAt(existing.getCreatedAt());
        amorphousAlloysEntity.setUpdatedAt(LocalDateTime.now());
        amorphousAlloysMapper.updateById(amorphousAlloysEntity);
        return amorphousAlloysMapper.selectById(id);
    }

    @Override
    @Transactional
    public void deleteById(String id) {
        // 检查记录是否存在
        if (amorphousAlloysMapper.selectById(id) == null) {
            throw new IllegalArgumentException("无效的ID: " + id);
        }

        // 执行删除
        amorphousAlloysMapper.deleteById(id);
    }

    @Override
    public int getCount() {
        return amorphousAlloysMapper.getCount();
    }

    @Override
    public List<AmorphousAlloysEntity> filterByPropertiesWithName(String name, Double hardness, Double strength, Double corrosionResistance) {
        return amorphousAlloysMapper.selectByPropertiesWithName(
                StringUtils.isNotBlank(name) ? name + "%" : null,
                hardness, strength, corrosionResistance
        );
    }
}