package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.entity.CommentEntity;
import com.laptrinhjavaweb.repository.NewRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CommentConverter {

    @Autowired
    private NewRepository newRepository;

    @Autowired
    private UserRepository userRepository;

    public CommentEntity toEntity(CommentDTO dto) {
        CommentEntity result = new CommentEntity();
        BeanUtils.copyProperties(dto,result);
        result.setBaiViet(newRepository.findOne(dto.getNewId()));
        result.setUser(userRepository.findOne(dto.getUserId()));
        return result;
    }

    public CommentDTO toDTO(CommentEntity entity) {
        CommentDTO result = new CommentDTO();
        BeanUtils.copyProperties(entity,result);
        result.setNewId(entity.getBaiViet().getId());
        result.setUserId(entity.getUser().getId());
        return result;
    }

    public CommentEntity toEntity(CommentDTO dto,CommentEntity result) {
        BeanUtils.copyProperties(dto,result);
        return result;
    }
}
