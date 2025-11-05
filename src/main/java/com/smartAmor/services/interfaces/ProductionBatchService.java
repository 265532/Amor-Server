package com.smartAmor.services.interfaces;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.smartAmor.entity.ProductionBatchEntity;

import javax.validation.Valid;
import java.util.List;

public interface ProductionBatchService {

    ProductionBatchEntity getInfoById(int id);

    List<ProductionBatchEntity> getAll();

    ProductionBatchEntity create(@Valid ProductionBatchEntity body);

    ProductionBatchEntity update(@Valid ProductionBatchEntity body);

    void delete(int id);

    ProductionBatchEntity getInfoByBatchNo(String batchNo);

    Page<ProductionBatchEntity> getListByPage(int startPage, int size);
}
