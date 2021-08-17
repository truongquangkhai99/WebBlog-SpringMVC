package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.UserConverter;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.entity.CommentEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.CommentRepository;
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
    private CommentRepository commentRepository;

    @Autowired
    private UserConverter converter;

    @Override
    public UserDTO save(UserDTO dto) {
        UserEntity entity = new UserEntity();
        UserEntity oldUser = new UserEntity();
        if(dto.getId() != null){
            oldUser = userRepository.findOne(dto.getId());
            entity = converter.toEntity(dto,oldUser);
            entity.setPassword(bCryptPasswordEncoder.encode(dto.getPassword()));
        }else{
            entity = converter.toEntity(dto);
            entity.setPassword(bCryptPasswordEncoder.encode(dto.getPassword()));
        }
        return converter.toDTO(userRepository.save(entity));
    }


    @Override
    public void delete(Long[] ids) {
        for(Long id:ids){
            UserEntity userEntity = userRepository.findOne(id);
            for(CommentEntity item: userEntity.getComments()){
                commentRepository.delete(item.getId());
            }
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







