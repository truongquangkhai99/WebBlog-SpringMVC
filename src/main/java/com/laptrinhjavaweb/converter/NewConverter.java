package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.entity.NewEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class NewConverter {

    @Autowired
    private CategoryRepository categoryRepository;

    public NewEntity toEntity(NewDTO dto) {
        NewEntity result = new NewEntity();
        BeanUtils.copyProperties(dto,result);
        CategoryEntity category = categoryRepository.findOneByCode(dto.getCategoryCode());
        result.setCategory(category);
        return result;
    }

    public NewDTO toDTO(NewEntity entity) {
        NewDTO result = new NewDTO();
        result.setCategoryCode(entity.getCategory().getCode());
        BeanUtils.copyProperties(entity,result);
        return result;
    }

    public NewEntity toEntity(NewDTO dto,NewEntity result) {
        CategoryEntity category = categoryRepository.findOneByCode(dto.getCategoryCode());
        result.setCategory(category);
        BeanUtils.copyProperties(dto,result);
        return result;
    }

}
