package com.smartagriculture.services;

import com.smartagriculture.mapper.AmorphousAlloysMapper;
import com.smartagriculture.mapper.BaseTypesMapper;
import com.smartagriculture.model.AmorphousAlloys;
import com.smartagriculture.model.Properties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class AmorphousAlloysServiceImpl implements AmorphousAlloysService {

    // 使用 MyBatis Mapper 替代 JPA Repository
    @Autowired
    private AmorphousAlloysMapper amorphousAlloysMapper;

    @Autowired
    private BaseTypesMapper baseTypesMapper;

    @Override
    public AmorphousAlloys getInfoById(String id) {
        return amorphousAlloysMapper.selectById(id);
    }

    @Override
    public List<AmorphousAlloys> selectInfoWithPagination(int page, int size) {
        return amorphousAlloysMapper.selectAllWithPagination(page * size, size);
    }

    @Override
    @Transactional
    public AmorphousAlloys create(AmorphousAlloys amorphousAlloys) {
        // 验证基体类型是否存在
        int baseTypeId = amorphousAlloys.getBaseTypeId();
        String amorphousAlloysID = amorphousAlloys.getId();

        // 检查ID是否已存在
        if (amorphousAlloysID != null && amorphousAlloysMapper.existsById(amorphousAlloysID)) {
            throw new IllegalArgumentException("ID already exists: " + amorphousAlloysID);
        }

        // 检查基体类型是否存在
        if (baseTypesMapper.selectById(baseTypeId) == null) {
            throw new IllegalArgumentException("无效的基体类型ID: " + baseTypeId);
        }

        // 验证必填字段
        if (amorphousAlloys.getProperties() == null) {
            throw new IllegalArgumentException("Properties cannot be null");
        }

        // 验证属性值
        Properties props = amorphousAlloys.getProperties();
        if (props.getHardness() <= 0 ||
                props.getStrength() <= 0 ||
                props.getCorrosionResistance() <= 0) {
            throw new IllegalArgumentException("Property values must be positive");
        }

        // 设置时间戳
        LocalDateTime now = LocalDateTime.now();
        amorphousAlloys.setCreatedAt(now);
        amorphousAlloys.setUpdatedAt(now);

        // 插入数据
        amorphousAlloysMapper.insert(amorphousAlloys);

        // 返回新创建的对象（可重新查询获取完整数据）
        return amorphousAlloysMapper.selectById(amorphousAlloys.getId());
    }

    @Override
    @Transactional
    public AmorphousAlloys updateById(AmorphousAlloys amorphousAlloys) {
        String id = amorphousAlloys.getId();

        // 检查记录是否存在
        AmorphousAlloys existing = amorphousAlloysMapper.selectById(id);
        if (existing == null) {
            throw new IllegalArgumentException("无效的ID: " + id);
        }

        // 保留原始创建时间
        amorphousAlloys.setCreatedAt(existing.getCreatedAt());

        // 更新修改时间
        amorphousAlloys.setUpdatedAt(LocalDateTime.now());

        // 执行更新
        amorphousAlloysMapper.update(amorphousAlloys);

        // 返回更新后的对象
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
        amorphousAlloysMapper.delete(id);
    }
}