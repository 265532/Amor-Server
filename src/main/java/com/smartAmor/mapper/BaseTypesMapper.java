package com.smartAmor.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.smartAmor.entity.BaseTypesEntity;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BaseTypesMapper extends BaseMapper<BaseTypesEntity> {

    // 按名称查询
    @Select("SELECT id, baseTypeId, description, created_at as createdAt FROM base_types WHERE baseTypeId LIKE CONCAT('%', #{baseTypeId}, '%')")
    List<BaseTypesEntity> selectByName(String name);
}