package com.smartAmor.services.interfaces;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.smartAmor.entity.AmorphousAlloysEntity;
import com.smartAmor.utils.NumberRange;

import java.util.List;

public interface AmorphousAlloysService {
    Page<AmorphousAlloysEntity> selectListByPage(int startPage, int size);

    AmorphousAlloysEntity getInfoById(String id);

    AmorphousAlloysEntity create(AmorphousAlloysEntity amorphousAlloysEntity);

    AmorphousAlloysEntity updateById(AmorphousAlloysEntity amorphousAlloysEntity);

    void deleteById(String id);

    int getCount();

    List<AmorphousAlloysEntity> filterByPropertiesWithName(Integer baseTypeId, NumberRange hardness, NumberRange strength, Double corrosionResistance);
}
