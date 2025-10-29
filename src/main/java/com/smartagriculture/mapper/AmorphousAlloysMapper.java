package com.smartagriculture.mapper;

import com.smartagriculture.model.AmorphousAlloys;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface AmorphousAlloysMapper {
    @Select("SELECT * FROM amorphous_alloys WHERE id = #{id}")
    @Results({
            @Result(property = "properties", column = "properties", typeHandler = com.smartagriculture.typehandler.PropertiesTypeHandler.class)
    })
    AmorphousAlloys selectById(String id);

    @Insert("INSERT INTO amorphous_alloys (id, name, version, base_type_id, formula, properties, created_at, updated_at) " +
            "VALUES (#{id}, #{name}, #{version}, #{baseTypeId}, #{formula}, #{properties, typeHandler=com.smartagriculture.typehandler.PropertiesTypeHandler}, #{createdAt}, #{updatedAt})")
    int insert(AmorphousAlloys entity);

    @Update("UPDATE amorphous_alloys SET " +
            "name = #{name}, " +
            "version = #{version}, " +
            "base_type_id = #{baseTypeId}, " +
            "formula = #{formula}, " +
            "properties = #{properties, typeHandler=com.smartagriculture.typehandler.PropertiesTypeHandler}, " +
            "updated_at = #{updatedAt} " +
            "WHERE id = #{id}")
    int update(AmorphousAlloys entity);

    @Delete("DELETE FROM amorphous_alloys WHERE id = #{id}")
    int delete(String id);

    @Select("SELECT * FROM amorphous_alloys")
    @Results({
            @Result(property = "properties", column = "properties", typeHandler = com.smartagriculture.typehandler.PropertiesTypeHandler.class)
    })
    List<AmorphousAlloys> selectAll();

    @Select("SELECT COUNT(*) > 0 FROM amorphous_alloys WHERE id = #{id}")
    boolean existsById(String id);
}