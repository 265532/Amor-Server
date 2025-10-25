package com.smartagriculture.services;


import com.smartagriculture.model.AmorphousAlloys;

import java.util.List;

public interface AmorphousAlloysService {
    AmorphousAlloys getInfoById(String id);
    List<AmorphousAlloys> findAll();
}
