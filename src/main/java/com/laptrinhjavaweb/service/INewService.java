package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.NewDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;


public interface INewService {
    List<NewDTO> findAll(Pageable pageable);
    Integer totalItem();
    NewDTO save(NewDTO dto);
    void delete(Long[] ids);
    NewDTO findById(Long id);
}
