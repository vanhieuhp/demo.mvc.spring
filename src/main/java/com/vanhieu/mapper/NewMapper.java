package com.vanhieu.mapper;

import com.vanhieu.dto.NewsDTO;

import java.sql.ResultSet;
import java.sql.SQLException;

public class NewMapper implements RowMapper<NewsDTO>{

    @Override
    public NewsDTO mapRow(ResultSet resultSet) {
        try {
            NewsDTO newsModel = new NewsDTO();
            newsModel.setId(resultSet.getLong("id"));
            newsModel.setTitle(resultSet.getString("title"));
            newsModel.setCategoryId(resultSet.getLong("categoryid"));
            newsModel.setContent(resultSet.getString("content"));
            newsModel.setCreatedBy(resultSet.getString("createdby"));
            newsModel.setCreatedDate(resultSet.getTimestamp("createddate"));
            newsModel.setShortDescription(resultSet.getString("shortdescription"));
            newsModel.setThumbnail(resultSet.getString("thumbnail"));
            if(newsModel.getModifiedBy() != null) {
                newsModel.setModifiedBy(resultSet.getString("modifiedby"));
            }
            if (newsModel.getModifiedDate() != null) {
                newsModel.setModifiedDate(resultSet.getTimestamp("modifieddate"));
            }
            return newsModel;
        } catch(SQLException e) {
            return null;
        }
    }
}
