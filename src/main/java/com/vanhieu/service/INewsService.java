package com.vanhieu.service;

import com.vanhieu.dto.NewsDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface INewsService {
    List<NewsDTO> findAll(Pageable pageable);
    int getTotalItem();
    NewsDTO findById(Long id);
    NewsDTO save(NewsDTO newsDTO);
    void delete(Long[] ids);
}