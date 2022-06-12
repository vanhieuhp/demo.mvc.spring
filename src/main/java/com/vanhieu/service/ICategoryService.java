package com.vanhieu.service;

import com.vanhieu.entity.CategoryEntity;

import java.util.Map;

public interface ICategoryService {
    Map<String, String> findAll();
    int count();
    CategoryEntity findByCategoryCode(String categoryCode);
}
