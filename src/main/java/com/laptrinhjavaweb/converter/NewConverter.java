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
    private CategoryRepository repository;

    public NewEntity toEntity(NewDTO dto){
        NewEntity entity = new NewEntity();
        BeanUtils.copyProperties(dto,entity);
        entity.setCategory(repository.findOneByCode(dto.getCategoryCode()));
        return entity;
    }

    public NewDTO toDTO(NewEntity entity){
        NewDTO dto = new NewDTO();
        BeanUtils.copyProperties(entity,dto);
        dto.setCategoryCode(entity.getCategory().getCode());
        return dto;
    }

    public NewEntity toEntity(NewDTO dto,NewEntity result) {
        CategoryEntity category = repository.findOneByCode(dto.getCategoryCode());
        result.setCategory(category);
        BeanUtils.copyProperties(dto,result);
        return result;
    }

}
