package com.smartAmor.services.interfaces;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.smartAmor.entity.OperatorEntity;

import javax.validation.Valid;
import java.util.List;

public interface BaseService {
    OperatorEntity getInfoById(int id);

    List<OperatorEntity> getAll();

    Page<OperatorEntity> getListByPage(int startPage, int size);

    OperatorEntity create(@Valid OperatorEntity body);

    OperatorEntity update(@Valid OperatorEntity body);

    void delete(int id);
}
