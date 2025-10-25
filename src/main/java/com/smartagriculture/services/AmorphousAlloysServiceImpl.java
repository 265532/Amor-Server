package com.smartagriculture.services;

import com.smartagriculture.model.AmorphousAlloys;
import com.smartagriculture.model.AmorphousAlloysRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AmorphousAlloysServiceImpl implements AmorphousAlloysService {
    // 将容器里的 InfoRepository的实例赋值给这个字段
    @Autowired
    private AmorphousAlloysRepository amorphousAlloysRepository;

    @Override
    public AmorphousAlloys getInfoById(String id) {
        return amorphousAlloysRepository.findById(id).orElse(null);
    }

    @Override
    public List<AmorphousAlloys> findAll() {
        return amorphousAlloysRepository.findAll();
    }

}
