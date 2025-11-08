package com.smartAmor.services;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.smartAmor.services.interfaces.BaseService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public abstract class BaseServiceImpl<T, M extends BaseMapper<T>> implements BaseService<T> {
    @Autowired
    protected M baseMapper;

    @Override
    public T getInfoById(Long id) {
        return baseMapper.selectById(id);
    }

    @Override
    public List<T> getAll() {
        return baseMapper.selectList(null);
    }

    @Override
    public int create(T body) {
        return baseMapper.insert(body);
    }

    @Override
    public T update(T body) {
        return null;
    }

    @Override
    public int delete(Long id) {
        return baseMapper.deleteById(id);
    }

    @Override
    public Page<T> getListByPage(int startPage, int size) {
        return baseMapper.selectPage(new Page<>(startPage, size), null);
    }
}
