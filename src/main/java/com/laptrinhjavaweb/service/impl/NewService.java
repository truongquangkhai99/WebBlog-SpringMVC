package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.NewConverter;
import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.CommentEntity;
import com.laptrinhjavaweb.entity.NewEntity;
import com.laptrinhjavaweb.repository.CommentRepository;
import com.laptrinhjavaweb.repository.NewRepository;
import com.laptrinhjavaweb.service.INewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class NewService implements INewService {

    @Autowired
    private NewRepository newRepository;

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private NewConverter converter;



    @Override
    public List<NewDTO> findAll(Pageable pageable) {
        List<NewDTO> results = new ArrayList<>();
        List<NewEntity> entities = newRepository.findAll(pageable).getContent();
        for(NewEntity item:entities) {
            NewDTO newDTO = converter.toDTO(item);
            results.add(newDTO);
        }
        return results;
    }

    @Override
    public Integer totalItem() {
        return (int)newRepository.count();
    }

    @Override
    @Transactional
    public NewDTO save(NewDTO dto) {
        NewEntity entity;
        if(dto.getId() != null){
            NewEntity oldNew = newRepository.findOne(dto.getId());
            entity = converter.toEntity(dto,oldNew);
        }else{
            entity = converter.toEntity(dto);
        }
        return converter.toDTO(newRepository.save(entity));
    }



    @Override
    public void delete(Long[] ids) {
        for(Long id:ids){
            NewEntity newEntity = newRepository.findOne(id);
            for(CommentEntity item:newEntity.getComments()){
                commentRepository.delete(item.getId());
            }
            newRepository.delete(id);
        }
    }

    @Override
    public NewDTO findById(Long id) {
        return converter.toDTO(newRepository.findOne(id));
    }


}
