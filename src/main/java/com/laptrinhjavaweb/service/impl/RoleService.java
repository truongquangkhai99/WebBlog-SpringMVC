package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.repository.RoleRepository;
import com.laptrinhjavaweb.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RoleService implements IRoleService {

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public Map<String, String> findAll() {
        List<RoleEntity> entities = roleRepository.findAll();
        Map<String,String> results = new HashMap<>();
        for(RoleEntity item:entities){
            results.put(item.getCode(),item.getName());
        }
        return results;
    }
}
