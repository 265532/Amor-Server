package com.smartAmor.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.smartAmor.entity.ProductionBatchEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ProductionBatchMapper extends BaseMapper<ProductionBatchEntity> {
    @Select("SELECT * FROM production_batches WHERE batch_no = #{batchNo}")
    ProductionBatchEntity selectByBatchNo(String batchNo);
}
