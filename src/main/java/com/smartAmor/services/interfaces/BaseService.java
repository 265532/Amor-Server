package com.smartAmor.services.interfaces;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import javax.validation.Valid;
import java.util.List;

public interface BaseService<T> {
    T getInfoById(Long id);
    List<T> getAll();
    Page<T> getListByPage(int startPage, int size);
    int create(@Valid T entity);
    T update(@Valid T entity);
    int delete(Long id);
}