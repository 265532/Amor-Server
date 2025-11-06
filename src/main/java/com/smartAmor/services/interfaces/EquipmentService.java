package com.smartAmor.services.interfaces;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.smartAmor.entity.EquipmentEntity;

import javax.validation.Valid;
import java.util.List;

public interface EquipmentService {
    EquipmentEntity getInfoById(int id);

    List<EquipmentEntity> getAll();

    Page<EquipmentEntity> getListByPage(int startPage, int size);

    EquipmentEntity create(@Valid EquipmentEntity body);

    EquipmentEntity update(@Valid EquipmentEntity body);

    void delete(int id);
}
