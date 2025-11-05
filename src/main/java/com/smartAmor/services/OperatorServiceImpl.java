package com.smartAmor.services;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.smartAmor.entity.OperatorEntity;
import com.smartAmor.mapper.OperatorMapper;
import com.smartAmor.services.interfaces.OperatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OperatorServiceImpl implements OperatorService {

    @Autowired
    private OperatorMapper OperatorMapper;

    @Override
    public OperatorEntity getInfoById(int id) {
        return OperatorMapper.selectById(id);
    }

    @Override
    public List<OperatorEntity> getAll() {
        return OperatorMapper.selectList(null);
    }

    @Override
    public OperatorEntity create(OperatorEntity body) {
        return null;
    }

    @Override
    public OperatorEntity update(OperatorEntity body) {
        return null;
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public Page<OperatorEntity> getListByPage(int startPage, int size) {
        return OperatorMapper.selectPage(new Page<>(startPage, size), null);
    }
}
