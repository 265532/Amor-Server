package com.smartAmor.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.smartAmor.entity.AmorphousAlloysEntity;
import com.smartAmor.typeHandler.PropertiesTypeHandler;
import com.smartAmor.utils.NumberRange;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface AmorphousAlloysMapper extends BaseMapper<AmorphousAlloysEntity> {

    @Select("SELECT COUNT(*) > 0 FROM amorphous_alloys WHERE id = #{id}")
    boolean existsById(String id);

    @Select("SELECT COUNT(*) FROM amorphous_alloys")
    int getCount();


    @Select("<script>" +
            "SELECT * FROM amorphous_alloys WHERE 1=1 " +
            "<if test='baseTypeId != null'> AND base_type_id = #{baseTypeId} </if>" + "<if test='hardness != null'>" +
            "<if test='hardness.min != null'> AND JSON_EXTRACT(properties, '$.hardness') &gt;= #{hardness.min} </if>" +
            "<if test='hardness.max != null'> AND JSON_EXTRACT(properties, '$.hardness') &lt;= #{hardness.max} </if>" +
            "</if>" +
            "<if test='strength != null'>" +
            "<if test='strength.min != null'> AND JSON_EXTRACT(properties, '$.strength') &gt;= #{strength.min} </if>" +
            "<if test='strength.max != null'> AND JSON_EXTRACT(properties, '$.strength') &lt;= #{strength.max} </if>" +
            "</if>" +
            "<if test='corrosionResistance != null'> AND JSON_EXTRACT(properties, '$.corrosion_resistance') &gt;= #{corrosionResistance} </if>" +
            "ORDER BY id ASC" +
            "</script>")
    @Results({
            @Result(column = "properties", property = "properties", typeHandler = PropertiesTypeHandler.class)
    })
    List<AmorphousAlloysEntity> selectByPropertiesWithName(@Param("baseTypeId") Integer baseTypeId,
                                                           @Param("hardness") NumberRange hardness,
                                                           @Param("strength") NumberRange strength,
                                                           @Param("corrosionResistance") Double corrosionResistance);
}