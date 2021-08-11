package com.laptrinhjavaweb.converter;


import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.RoleRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Component
public class UserConverter {

    @Autowired
    private RoleRepository roleRepository;

    public UserEntity toEntity(UserDTO dto) {
        UserEntity entity = new UserEntity();
        BeanUtils.copyProperties(dto,entity);
        return entity;
    }

    public UserEntity toEntity(UserDTO dto,UserEntity result) {
        BeanUtils.copyProperties(dto,result);
        Map<String,String> newRole = dto.getRoles();
        List<RoleEntity> roleEntity = new ArrayList<>();
        newRole.forEach((key,value)->{
            roleEntity.add(roleRepository.findOneByCode(key));
        });
        result.setRoles(roleEntity);
        return result;
    }

    public UserDTO toDTO(UserEntity entity) {
        UserDTO dto = new UserDTO();
        BeanUtils.copyProperties(entity,dto);
        Map<String,String> role = new HashMap<>();
        for(RoleEntity item:entity.getRoles()){
            role.put(item.getCode(),item.getName());
        }
        dto.setRoles(role);
        return dto;
    }
}
