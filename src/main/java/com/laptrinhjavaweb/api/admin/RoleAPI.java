package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.converter.RoleConverter;
import com.laptrinhjavaweb.dto.RoleDTO;
import com.laptrinhjavaweb.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController(value = "roleAPIOfAdmin")
public class RoleAPI {
    @Autowired
    private IRoleService roleService;

    @Autowired
    private RoleConverter converter;

    @PostMapping("/api/role")
    public RoleDTO createRole(@RequestBody RoleDTO roleDTO){
        return roleService.save(roleDTO);
    }

    @PutMapping("/api/role")
    public RoleDTO updateRole(@RequestBody RoleDTO updateRole){
        return roleService.save(updateRole);
    }


    @DeleteMapping("/api/role")
    public void deleteRole(@RequestBody Long[] ids){
        roleService.delete(ids);
    }
}
