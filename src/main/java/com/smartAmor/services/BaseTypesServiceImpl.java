package com.smartAmor.services;

import com.smartAmor.entity.BaseTypesEntity;
import com.smartAmor.mapper.BaseTypesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BaseTypesServiceImpl implements BaseTypesService {
    @Autowired
    private BaseTypesMapper baseTypesMapper;

    @Override
    public BaseTypesEntity getInfoById(int id) {
        return baseTypesMapper.selectById(id);
    }

    @Override
    public List<BaseTypesEntity> getAll() {
        return baseTypesMapper.selectList(null);
    }
}
