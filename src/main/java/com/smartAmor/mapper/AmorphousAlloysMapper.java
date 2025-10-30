package com.smartAmor.mapper;

import com.smartAmor.model.AmorphousAlloys;
import com.smartAmor.typehandler.PropertiesTypeHandler;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface AmorphousAlloysMapper {
    @Select("SELECT * FROM amorphous_alloys WHERE id = #{id}")
    @Results(id = "amorphousAlloysMap", value = {
            @Result(property = "properties", column = "properties", typeHandler = PropertiesTypeHandler.class)
    })
    AmorphousAlloys selectById(String id);

    @Insert("INSERT INTO amorphous_alloys (id, name, version, base_type_id, formula, properties, created_at, updated_at) " +
            "VALUES (#{id}, #{name}, #{version}, #{baseTypeId}, #{formula}, #{properties, typeHandler=com.smartAmor.typehandler.PropertiesTypeHandler}, #{createdAt}, #{updatedAt})")
    int insert(AmorphousAlloys entity);

    int update(AmorphousAlloys entity);

    @Delete("DELETE FROM amorphous_alloys WHERE id = #{id}")
    int delete(String id);

    @ResultMap("amorphousAlloysMap")
    @Select("SELECT * FROM amorphous_alloys")
    List<AmorphousAlloys> selectAll();

    @ResultMap("amorphousAlloysMap")
    @Select("SELECT * FROM amorphous_alloys LIMIT #{size} OFFSET #{start}")
    List<AmorphousAlloys> selectList(int start, int size);


    @Select("SELECT COUNT(*) > 0 FROM amorphous_alloys WHERE id = #{id}")
    boolean existsById(String id);
}