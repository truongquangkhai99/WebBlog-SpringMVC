package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.NewEntity;
import org.springframework.data.domain.Pageable;

import java.util.List;


public interface INewService {
    List<NewDTO> findAll(Pageable pageable);
    Integer totalItem();
    NewDTO save(NewDTO dto);
    void delete(Long[] ids);
    NewDTO findById(Long id);
    List<NewEntity> findByCreatedBy(String createdBy);


    List<NewDTO> findAllByCreatedBy(String createdBy,Pageable pageable);

    List<CommentDTO> findAllCommentByNewId(Long newId);
	List<NewDTO> searchNew(String searchKey, String searchName, Pageable pageable);
	List<NewDTO> searchNewByCreatedBy(String searchKey, String searchName, String createdBy, Pageable pageable);
}
