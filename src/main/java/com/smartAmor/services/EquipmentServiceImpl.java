package com.smartAmor.services;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.smartAmor.entity.EquipmentEntity;
import com.smartAmor.mapper.EquipmentMapper;
import com.smartAmor.services.interfaces.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EquipmentServiceImpl implements EquipmentService {

    @Autowired
    private EquipmentMapper EquipmentMapper;

    @Override
    public EquipmentEntity getInfoById(int id) {
        return EquipmentMapper.selectById(id);
    }

    @Override
    public List<EquipmentEntity> getAll() {
        return EquipmentMapper.selectList(null);
    }

    @Override
    public EquipmentEntity create(EquipmentEntity body) {
        return null;
    }

    @Override
    public EquipmentEntity update(EquipmentEntity body) {
        return null;
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public Page<EquipmentEntity> getListByPage(int startPage, int size) {
        return EquipmentMapper.selectPage(new Page<>(startPage, size), null);
    }
}
