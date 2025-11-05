package com.smartAmor.services;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.smartAmor.entity.ProductionBatchEntity;
import com.smartAmor.mapper.ProductionBatchMapper;
import com.smartAmor.services.interfaces.ProductionBatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductionBatchServiceImpl implements ProductionBatchService {

    @Autowired
    private ProductionBatchMapper productionBatchMapper;

    @Override
    public ProductionBatchEntity getInfoById(int id) {
        return productionBatchMapper.selectById(id);
    }

    @Override
    public List<ProductionBatchEntity> getAll() {
        return productionBatchMapper.selectList(null);
    }

    @Override
    public ProductionBatchEntity create(ProductionBatchEntity body) {
        return null;
    }

    @Override
    public ProductionBatchEntity update(ProductionBatchEntity body) {
        return null;
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public ProductionBatchEntity getInfoByBatchNo(String batchNo) {
        return productionBatchMapper.selectByBatchNo(batchNo);
    }

    @Override
    public Page<ProductionBatchEntity> getListByPage(int startPage, int size) {
        return productionBatchMapper.selectPage(new Page<>(startPage, size), null);
    }
}
