package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.CommentConverter;
import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.entity.CommentEntity;
import com.laptrinhjavaweb.repository.CommentRepository;
import com.laptrinhjavaweb.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CommentService implements ICommentService {

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private CommentConverter converter;


    @Override
    public List<CommentDTO> findAll(Pageable pageable) {
        List<CommentEntity> entities = commentRepository.findAll(pageable).getContent();
        List<CommentDTO> results = new ArrayList<>();
        for(CommentEntity item:entities){
            results.add(converter.toDTO(item));
        }
        return results;
    }

    @Override
    public CommentDTO save(CommentDTO dto) {
        CommentEntity entity;
        if(dto.getId() != null){
            entity = commentRepository.findOne(dto.getId());
            entity = converter.toEntity(dto,entity);
        }
        else{
            entity = converter.toEntity(dto);
        }
        return converter.toDTO(commentRepository.save(entity));
    }

    @Override
    public void delete(Long[] ids) {
        for(Long id:ids){
            commentRepository.delete(id);
        }
    }
}
