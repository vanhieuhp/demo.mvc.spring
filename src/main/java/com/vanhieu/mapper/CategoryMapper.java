package com.vanhieu.mapper;

import com.vanhieu.dto.CategoryDTO;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoryMapper implements RowMapper<CategoryDTO> {
    @Override
    public CategoryDTO mapRow(ResultSet resultSet) {
        try {
            CategoryDTO categoryModel = new CategoryDTO();
            categoryModel.setId(resultSet.getLong("id"));
            categoryModel.setCode(resultSet.getString("code"));
            categoryModel.setName(resultSet.getString("name"));
            return categoryModel;
        } catch (SQLException e) {
            return null;
        }
    }
}
