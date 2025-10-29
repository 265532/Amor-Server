package com.smartagriculture.services;
import com.smartagriculture.model.AmorphousAlloys;

import java.util.List;

public interface AmorphousAlloysService {
    List<AmorphousAlloys> findAll();
    AmorphousAlloys getInfoById(String id);
    AmorphousAlloys create(AmorphousAlloys amorphousAlloys);
    AmorphousAlloys updateById(AmorphousAlloys amorphousAlloys);
    void deleteById(String id);

}
