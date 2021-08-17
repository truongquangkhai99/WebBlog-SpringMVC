package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

@Component
public class CategoryConverter {

    public CategoryDTO toDTO(CategoryEntity entity) {
        CategoryDTO dto = new CategoryDTO();
        BeanUtils.copyProperties(entity,dto);
        return dto;
    }

    public CategoryEntity toEntity(CategoryDTO dto) {
        CategoryEntity entity = new CategoryEntity();
        BeanUtils.copyProperties(dto,entity);
        return entity;
    }

    public CategoryEntity toEntity(CategoryDTO dto,CategoryEntity result) {
        BeanUtils.copyProperties(dto,result);
        return result;
    }


}
