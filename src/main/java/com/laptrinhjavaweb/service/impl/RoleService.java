package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.RoleConverter;
import com.laptrinhjavaweb.dto.RoleDTO;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.RoleRepository;
import com.laptrinhjavaweb.service.IRoleService;
import com.laptrinhjavaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service(value = "roleService")
public class RoleService implements IRoleService {

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private IUserService userService;

    @Autowired
    private RoleConverter converter;

    @Override
    public Map<String, String> findAll() {
        List<RoleEntity> entities = roleRepository.findAll();
        Map<String,String> results = new HashMap<>();
        for(RoleEntity item:entities){
            results.put(item.getCode(),item.getName());
        }
        return results;
    }

    @Override
    public List<RoleDTO> findAll(Pageable pageable) {
        List<RoleDTO> results = new ArrayList<>();
        roleRepository.findAll(pageable).getContent().forEach(item ->{
            results.add(converter.toDTO(item));
        });
        return results;
    }

    @Override
    public Integer totalItem() {
        return (int)roleRepository.count();
    }

    @Override
    @Transactional
    public RoleDTO save(RoleDTO dto) {
        RoleEntity entity;
        if(dto.getId() != null){
            RoleEntity oldNew = roleRepository.findOne(dto.getId());
            entity = converter.toEntity(dto,oldNew);
        }else{
            entity = converter.toEntity(dto);
        }
        return converter.toDTO(roleRepository.save(entity));
    }

    @Override
    public void delete(Long[] ids) {
        for(Long id:ids){
            RoleEntity roleEntity = roleRepository.findOne(id);
            for(UserEntity item: roleEntity.getUsers()){
                userService.delete(new Long[]{item.getId()});
            }
            roleRepository.delete(id);
        }
    }

    @Override
    public RoleDTO findById(Long id) {
        return converter.toDTO(roleRepository.findOne(id));
    }
}
