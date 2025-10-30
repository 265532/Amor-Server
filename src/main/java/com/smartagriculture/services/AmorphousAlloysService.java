package com.smartagriculture.services;

import com.smartagriculture.model.AmorphousAlloys;

import java.util.List;

public interface AmorphousAlloysService {
    List<AmorphousAlloys> selectInfoWithPagination(int page, int size);

    AmorphousAlloys getInfoById(String id);

    AmorphousAlloys create(AmorphousAlloys amorphousAlloys);

    AmorphousAlloys updateById(AmorphousAlloys amorphousAlloys);

    void deleteById(String id);

}
