package com.smartAmor.typeHandler;

import com.smartAmor.model.Properties;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(Properties.class)
public class PropertiesTypeHandler extends BaseTypeHandler<Properties> {

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, Properties parameter, JdbcType jdbcType) throws SQLException {
        // 将 Properties 对象转换为 JSON 字符串存储到数据库
        ps.setString(i, parameter.toJson());
    }

    @Override
    public Properties getNullableResult(ResultSet rs, String columnName) throws SQLException {
        // 从数据库读取 JSON 字符串并转换为 Properties 对象
        String json = rs.getString(columnName);
        if (json == null) {
            return null;
        }
        try {
            return Properties.fromJson(json);
        } catch (RuntimeException e) {
            throw new SQLException("Failed to deserialize JSON from column '" + columnName + "': " + json, e);
        }
    }

    @Override
    public Properties getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        String json = rs.getString(columnIndex);
        return json == null ? null : Properties.fromJson(json);
    }

    @Override
    public Properties getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        String json = cs.getString(columnIndex);
        return json == null ? null : Properties.fromJson(json);
    }
}