package com.smartagriculture.services.amorphous.alloysService;



import com.smartagriculture.model.amorphous.alloys.AmorphousAlloys;

import java.util.List;

public interface AmorphousAlloysService {
    List<AmorphousAlloys> findAll();
    AmorphousAlloys getInfoById(String id);
    AmorphousAlloys create(AmorphousAlloys amorphousAlloys);
    AmorphousAlloys updateById(AmorphousAlloys amorphousAlloys);
    void deleteById(String id);

}
