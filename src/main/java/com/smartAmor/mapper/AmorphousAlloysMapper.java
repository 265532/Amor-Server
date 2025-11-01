package com.smartAmor.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.smartAmor.entity.AmorphousAlloysEntity;
import com.smartAmor.typeHandler.PropertiesTypeHandler;
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
            "<if test='name != null'> AND name LIKE CONCAT(#{name}, '%') </if>" +
            "<if test='hardness != null'> AND JSON_EXTRACT(properties, '$.hardness') >= #{hardness} </if>" +
            "<if test='strength != null'> AND JSON_EXTRACT(properties, '$.strength') >= #{strength} </if>" +
            "<if test='corrosionResistance != null'> AND JSON_EXTRACT(properties, '$.corrosion_resistance') >= #{corrosionResistance} </if>" +
            "ORDER BY id ASC" +
            "</script>")
    List<AmorphousAlloysEntity> selectByPropertiesWithName(@Param("name") String name, @Param("hardness") Double hardness, @Param("strength") Double strength, @Param("corrosionResistance") Double corrosionResistance);
}