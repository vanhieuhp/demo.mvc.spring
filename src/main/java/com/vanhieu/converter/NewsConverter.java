package com.vanhieu.converter;

import com.vanhieu.dto.NewsDTO;
import com.vanhieu.entity.NewsEntity;
import org.springframework.stereotype.Component;

@Component
public class NewsConverter {
    public NewsDTO toDto(NewsEntity entity) {
        NewsDTO result = new NewsDTO();
        result.setId(entity.getId());
        result.setTitle(entity.getTitle());
        result.setShortDescription(entity.getShortDescription());
        result.setContent(entity.getContent());
        result.setThumbnail(entity.getThumbnail());
        result.setCategoryCode(entity.getCategory().getCode());
        return result;
    }

    public NewsEntity toEntity(NewsDTO newsDTO) {
        NewsEntity result = new NewsEntity();
        result.setTitle(newsDTO.getTitle());
        result.setShortDescription(newsDTO.getShortDescription());
        result.setContent(newsDTO.getContent());
        result.setThumbnail(newsDTO.getThumbnail());
        return result;
    }

    public NewsEntity toEntity(NewsEntity result, NewsDTO newsDTO) {
        result.setTitle(newsDTO.getTitle());
        result.setShortDescription(newsDTO.getShortDescription());
        result.setContent(newsDTO.getContent());
        result.setThumbnail(newsDTO.getThumbnail());
        return result;
    }

}
