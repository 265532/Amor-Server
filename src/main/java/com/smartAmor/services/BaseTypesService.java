package com.smartAmor.services;

import com.smartAmor.entity.BaseTypesEntity;

import java.util.List;

public interface BaseTypesService {
    BaseTypesEntity getInfoById(int id);

    List<BaseTypesEntity> getAll();
}
