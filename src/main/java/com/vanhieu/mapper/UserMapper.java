package com.vanhieu.mapper;

import com.vanhieu.dto.RoleDTO;
import com.vanhieu.dto.UserDTO;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper implements RowMapper<UserDTO>{

    @Override
    public UserDTO mapRow(ResultSet resultSet) {
        try {
            UserDTO userModel = new UserDTO();
            userModel.setId(resultSet.getLong("id"));
            userModel.setUsername(resultSet.getString("username"));
            userModel.setPassword(resultSet.getString("password"));
            userModel.setFullname(resultSet.getString("fullname"));
            userModel.setStatus(resultSet.getInt("status"));
            try {
                RoleDTO roleModel = new RoleDTO();
                roleModel.setName(resultSet.getString("name"));
                roleModel.setCode(resultSet.getString("code"));
                userModel.setRole(roleModel);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            return userModel;
        } catch(SQLException e) {
            return null;
        }
    }
}
