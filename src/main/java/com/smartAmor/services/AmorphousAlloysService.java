package com.smartAmor.services;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.smartAmor.entity.AmorphousAlloysEntity;

import java.util.List;

public interface AmorphousAlloysService {
    Page<AmorphousAlloysEntity> selectListByPage(int startPage, int size);

    AmorphousAlloysEntity getInfoById(String id);

    AmorphousAlloysEntity create(AmorphousAlloysEntity amorphousAlloysEntity);

    AmorphousAlloysEntity updateById(AmorphousAlloysEntity amorphousAlloysEntity);

    void deleteById(String id);

    int getCount();

    List<AmorphousAlloysEntity> filterByPropertiesWithName(String name, Double hardness, Double strength, Double corrosionResistance);
}
