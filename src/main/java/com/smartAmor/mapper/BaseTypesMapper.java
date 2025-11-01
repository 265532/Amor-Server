package com.smartAmor.mapper;

import com.smartAmor.entity.BaseTypes;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BaseTypesMapper {

    @Select("SELECT id, name, description, created_at as createdAt FROM base_types WHERE id = #{id}")
    BaseTypes selectById(int id);

    @Select("SELECT id, name, description, created_at as createdAt FROM base_types")
    List<BaseTypes> selectAll();

    @Insert("INSERT INTO base_types (id, name, description, created_at) " +
            "VALUES (#{id}, #{name}, #{description}, #{createdAt})")
    int insert(BaseTypes baseTypes);

    @Update("UPDATE base_types SET " +
            "name = #{name}, " +
            "description = #{description}, " +
            "created_at = #{createdAt} " +
            "WHERE id = #{id}")
    int update(BaseTypes baseTypes);

    @Delete("DELETE FROM base_types WHERE id = #{id}")
    int delete(int id);

    // 按名称查询
    @Select("SELECT id, name, description, created_at as createdAt FROM base_types WHERE name LIKE CONCAT('%', #{name}, '%')")
    List<BaseTypes> selectByName(String name);
}