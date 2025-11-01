package com.smartAmor.services;

import com.smartAmor.entity.AmorphousAlloysEntity;

import java.util.List;

public interface AmorphousAlloysService {
    List<AmorphousAlloysEntity> selectList(int page, int size);

    AmorphousAlloysEntity getInfoById(String id);

    AmorphousAlloysEntity create(AmorphousAlloysEntity amorphousAlloys);

    AmorphousAlloysEntity updateById(AmorphousAlloysEntity amorphousAlloys);

    void deleteById(String id);

    int getCount();
}
