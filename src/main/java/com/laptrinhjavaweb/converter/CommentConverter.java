package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.entity.CommentEntity;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

@Component
public class CommentConverter {

    public CommentEntity toEntity(CommentDTO dto) {
        CommentEntity result = new CommentEntity();
        BeanUtils.copyProperties(dto,result);
        return result;
    }

    public CommentDTO toDTO(CommentEntity entity) {
        CommentDTO result = new CommentDTO();
        BeanUtils.copyProperties(entity,result);
        return result;
    }

    public CommentEntity toEntity(CommentDTO dto,CommentEntity result) {
        BeanUtils.copyProperties(dto,result);
        return result;
    }
}
