package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.CategoryDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface ICategoryService {
    Map<String,String> findAll();
    List<CategoryDTO> findAll(Pageable pageable);
    CategoryDTO findById(Long id);
    CategoryDTO save(CategoryDTO dto);
    void delete(Long[] ids);
    Integer totalItem();

    CategoryDTO findByCode(String categoryCode);
}
