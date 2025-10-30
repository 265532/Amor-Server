package com.smartAmor.services;

import com.smartAmor.model.AmorphousAlloys;

import java.util.List;

public interface AmorphousAlloysService {
    List<AmorphousAlloys> selectList(int page, int size);

    AmorphousAlloys getInfoById(String id);

    AmorphousAlloys create(AmorphousAlloys amorphousAlloys);

    AmorphousAlloys updateById(AmorphousAlloys amorphousAlloys);

    void deleteById(String id);

}
