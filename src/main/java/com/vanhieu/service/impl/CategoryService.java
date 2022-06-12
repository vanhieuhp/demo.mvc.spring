package com.vanhieu.service.impl;

import com.vanhieu.converter.CategoryConverter;
import com.vanhieu.dto.CategoryDTO;
import com.vanhieu.entity.CategoryEntity;
import com.vanhieu.repository.CategoryRepository;
import com.vanhieu.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CategoryService implements ICategoryService {

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    CategoryConverter categoryConverter;

    @Override
    public Map<String, String> findAll() {
        Map<String, String> results = new HashMap<>();
        List<CategoryEntity> entities = categoryRepository.findAll();
        for (CategoryEntity item : entities) {
            results.put(item.getCode(), item.getName());
        }
        return results;
    }

    @Override
    public int count() {
        return (int) categoryRepository.count();
    }

    @Override
    public CategoryEntity findByCategoryCode(String code) {
        return categoryRepository.findOneByCode(code);
    }
}
