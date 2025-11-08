package com.smartAmor.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.smartAmor.entity.OperatorEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface OperatorMapper extends BaseMapper<OperatorEntity> {

    @Select("SELECT * FROM operators WHERE employee_id = #{employeeId}")
    OperatorEntity selectByEmployeeId(String employeeId);
}
