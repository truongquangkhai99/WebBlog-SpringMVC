package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.RoleDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface IRoleService {
    Map<String,String> findAll();
    List<RoleDTO> findAll(Pageable pageable);
    Integer totalItem();
    RoleDTO save(RoleDTO dto);
    void delete(Long[] ids);
    RoleDTO findById(Long id);
}
