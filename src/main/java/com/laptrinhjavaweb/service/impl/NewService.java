package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.CommentConverter;
import com.laptrinhjavaweb.converter.NewConverter;
import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.CommentEntity;
import com.laptrinhjavaweb.entity.NewEntity;
import com.laptrinhjavaweb.repository.NewRepository;
import com.laptrinhjavaweb.service.ICommentService;
import com.laptrinhjavaweb.service.INewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service(value = "newService")
public class NewService implements INewService {

    @Autowired
    private NewRepository newRepository;

    @Autowired
    private ICommentService commentService;

    @Autowired
    private NewConverter converter;

    @Autowired
    private CommentConverter commentConverter;


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
                commentService.delete(new Long[]{item.getId()});
            }
            newRepository.delete(id);
        }
    }

    @Override
    public NewDTO findById(Long id) {
        return converter.toDTO(newRepository.findOne(id));
    }

    @Override
    public List<NewEntity> findByCreatedBy(String createdBy) {
        return newRepository.findOneByCreatedBy(createdBy);
    }

    @Override
    public List<NewDTO> findAllByCreatedBy(String createdBy,Pageable pageable) {
        List<NewDTO> results = new ArrayList<>();
        List<NewEntity> entities = newRepository.findAllByCreatedBy(createdBy,pageable).getContent();
        for(NewEntity item:entities) {
            NewDTO newDTO = converter.toDTO(item);
            results.add(newDTO);
        }
        return results;
    }

    @Override
    public List<CommentDTO> findAllCommentByNewId(Long newId) {
        List<CommentDTO> results = new ArrayList<>();
        for(CommentEntity item:newRepository.findOne(newId).getComments()) {
            results.add(commentConverter.toDTO(item));
        }
        return results;
    }

	@Override
	public List<NewDTO> searchNew(String searchKey, String searchName, Pageable pageable) {
		List<NewDTO> results = new ArrayList<>();
		List<NewEntity> entities = new ArrayList<NewEntity>();
		if(searchKey.equalsIgnoreCase("title"))
			entities = newRepository.searchNew(searchName,null,pageable).getContent();
		if(searchKey.equalsIgnoreCase("categoryCode"))
			entities = newRepository.searchNew(null,searchName,pageable).getContent();
		for(NewEntity item:entities) {
		    NewDTO newDTO = converter.toDTO(item);
		    results.add(newDTO);
		}
		return results;
	}

	@Override
	public List<NewDTO> searchNewByCreatedBy(String searchKey, String searchName, String createdBy, Pageable pageable) {
		List<NewDTO> results = new ArrayList<>();
        List<NewEntity> entities = new ArrayList<NewEntity>();
        if(searchKey.equalsIgnoreCase("title"))
        	 entities = newRepository.searchNewByCreatedBy(searchName,createdBy,pageable).getContent();
        
        for(NewEntity item:entities) {
            NewDTO newDTO = converter.toDTO(item);
            results.add(newDTO);
        }
        return results;
	}


}
