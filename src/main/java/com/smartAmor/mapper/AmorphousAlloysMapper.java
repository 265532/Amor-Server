package com.smartAmor.mapper;

import com.smartAmor.dto.AmorphousAlloysDTO;
import com.smartAmor.entity.AmorphousAlloysEntity;
import com.smartAmor.typeHandler.PropertiesTypeHandler;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface AmorphousAlloysMapper {
    @Select("SELECT * FROM amorphous_alloys WHERE id = #{id}")
    @Results(id = "amorphousAlloysMap", value = {
            @Result(property = "properties", column = "properties", typeHandler = PropertiesTypeHandler.class)
    })
    AmorphousAlloysEntity selectById(String id);

    int insert(AmorphousAlloysEntity entity);

    int update(AmorphousAlloysEntity entity);

    @Delete("DELETE FROM amorphous_alloys WHERE id = #{id}")
    int delete(String id);

    @ResultMap("amorphousAlloysMap")
    @Select("SELECT * FROM amorphous_alloys")
    List<AmorphousAlloysEntity> selectAll();

    @ResultMap("amorphousAlloysMap")
    @Select("SELECT * FROM amorphous_alloys LIMIT #{size} OFFSET #{start}")
    List<AmorphousAlloysEntity> selectList(int start, int size);


    @Select("SELECT COUNT(*) > 0 FROM amorphous_alloys WHERE id = #{id}")
    boolean existsById(String id);

    @Select("SELECT COUNT(*) FROM amorphous_alloys")
    int getCount();

    AmorphousAlloysDTO toDTO(AmorphousAlloysEntity alloys);
}