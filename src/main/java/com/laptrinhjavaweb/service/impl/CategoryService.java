package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.CategoryConverter;
import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.entity.NewEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.repository.NewRepository;
import com.laptrinhjavaweb.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CategoryService implements ICategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private NewRepository newRepository;

    @Autowired
    private CategoryConverter converter;

    @Override
    public Map<String,String> findAll() {
        Map<String,String> result = new HashMap<>();
        List<CategoryEntity> entities = categoryRepository.findAll();
        for(CategoryEntity item:entities){
            result.put(item.getCode(),item.getName());
        }
        return result;
    }

    @Override
    public List<CategoryDTO> findAll(Pageable pageable) {
        List<CategoryDTO> results = new ArrayList<>();
        List<CategoryEntity> entities = categoryRepository.findAll(pageable).getContent();
        for(CategoryEntity item:entities){
            results.add(converter.toDTO(item));
        }
        return results;
    }

    @Override
    public CategoryDTO findById(Long id) {
        return converter.toDTO(categoryRepository.findOne(id));
    }

    @Override
    public CategoryDTO save(CategoryDTO dto) {
        CategoryEntity entity;
        if(dto.getId() != null){
            CategoryEntity oldCategory = categoryRepository.findOne(dto.getId());
            entity = converter.toEntity(dto,oldCategory);
        }else{
            entity = converter.toEntity(dto);
        }
        return converter.toDTO(categoryRepository.save(entity));
    }

    @Override
    public void delete(Long[] ids) {
        for(Long id:ids){
            CategoryEntity entity = categoryRepository.findOne(id);
            for(NewEntity item:entity.getNews()){
                newRepository.delete(item.getId());
            }
            categoryRepository.delete(id);
        }
    }

    @Override
    public Integer totalItem() {
        return (int)categoryRepository.count();
    }
}
