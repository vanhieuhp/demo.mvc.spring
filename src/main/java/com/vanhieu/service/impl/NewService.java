package com.vanhieu.service.impl;

import com.vanhieu.converter.NewsConverter;
import com.vanhieu.dto.NewsDTO;
import com.vanhieu.entity.CategoryEntity;
import com.vanhieu.entity.NewsEntity;
import com.vanhieu.repository.CategoryRepository;
import com.vanhieu.repository.NewsRepository;
import com.vanhieu.service.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class NewService implements INewsService {

    @Autowired
    NewsRepository newsRepository;

    @Autowired
    NewsConverter newsConverter;

    @Autowired
    CategoryRepository categoryRepository;

    @Override
    public List<NewsDTO> findAll(Pageable pageable) {
        List<NewsDTO> results = new ArrayList<>();
        List<NewsEntity> entities = newsRepository.findAll(pageable).getContent();
        for (NewsEntity item : entities) {
            NewsDTO newsDTO = newsConverter.toDto(item);
            results.add(newsDTO);
        }
        return results;
    }

    @Override
    public int getTotalItem() {
        return (int) newsRepository.count();
    }

    @Override
    public NewsDTO findById(Long id) {
        NewsEntity entity = newsRepository.findOne(id);
        return newsConverter.toDto(entity);
    }

    @Override
    @Transactional
    public NewsDTO save(NewsDTO newsDTO) {
        CategoryEntity category = categoryRepository.findOneByCode(newsDTO.getCategoryCode());
        NewsEntity entity = new NewsEntity();
        if (newsDTO.getId() != null) {
            NewsEntity oldNews = newsRepository.findOne(newsDTO.getId());
            oldNews.setCategory(category);
            entity = newsConverter.toEntity(oldNews, newsDTO);
        } else {

            entity = newsConverter.toEntity(newsDTO);
            entity.setCategory(category);
        }
        NewsEntity news = newsRepository.save(entity);
        return newsConverter.toDto(news);
//        return newsConverter.toDto(newsRepository.save(entity));
    }

    @Override
    @Transactional
    public void delete(Long[] ids) {
        for (Long id : ids) {
            newsRepository.delete(id);
        }
    }
}
