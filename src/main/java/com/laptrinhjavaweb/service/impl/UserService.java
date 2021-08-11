package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.UserConverter;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.RoleRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService implements IUserService {

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private UserConverter converter;

    @Override
    public UserDTO save(UserDTO dto) {
        UserEntity entity = new UserEntity();
        if(dto.getId() != null){
            entity = userRepository.findOne(dto.getId());
            entity = converter.toEntity(dto,entity);
        }else{
            entity = converter.toEntity(dto);
            entity.setPassword(bCryptPasswordEncoder.encode(dto.getPassword()));
            entity.setStatus(1);
            List<RoleEntity> roles = new ArrayList<>();
            roles.add(roleRepository.findOneByCode("USER"));
            entity.setRoles(roles);
        }
        return converter.toDTO(userRepository.save(entity));
    }


    @Override
    public void delete(Long[] ids) {
        for(Long id:ids){
            userRepository.delete(id);
        }
    }

    @Override
    public List<UserDTO> findAll(Pageable pageable) {
        List<UserEntity> entities = userRepository.findAll(pageable).getContent();
        List<UserDTO> results = new ArrayList<>();
        for(UserEntity item:entities){
            results.add(converter.toDTO(item));
        }
        return results;
    }

    @Override
    public Integer totalItem() {
        return (int)userRepository.count();
    }

    @Override
    public UserDTO findById(Long id) {
        return converter.toDTO(userRepository.findOne(id));
    }
}







