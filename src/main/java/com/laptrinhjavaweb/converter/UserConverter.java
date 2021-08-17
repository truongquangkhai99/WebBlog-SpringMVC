package com.laptrinhjavaweb.converter;


import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.RoleRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;


@Component
public class UserConverter {

    @Autowired
    private RoleRepository roleRepository;



    public UserEntity toEntity(UserDTO dto) {
        UserEntity entity = new UserEntity();
        List<RoleEntity> roles = new ArrayList<>();
        roles.add(roleRepository.findOneByCode(dto.getRoleCode()));
        entity.setRoles(roles);
        BeanUtils.copyProperties(dto,entity);
        return entity;
    }



    public UserDTO toDTO(UserEntity entity) {
        UserDTO dto = new UserDTO();
        BeanUtils.copyProperties(entity,dto);
        dto.setRoleCode(entity.getRoles().get(0).getCode());
        return dto;
    }

    public UserEntity toEntity(UserDTO dto,UserEntity result) {
        BeanUtils.copyProperties(dto,result);
        List<RoleEntity> roles = new ArrayList<>();
        roles.add(roleRepository.findOneByCode(dto.getRoleCode()));
        result.setRoles(roles);
        return result;
    }
}
