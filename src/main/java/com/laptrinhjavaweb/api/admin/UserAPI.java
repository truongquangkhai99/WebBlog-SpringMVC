package com.laptrinhjavaweb.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.service.IUserService;

@RestController(value = "userAPIOfAdmin")
public class UserAPI {
    @Autowired
    private IUserService userService;

    @PostMapping("/api/user")
    public UserDTO createUser(@RequestBody UserDTO userDTO){
        return userService.save(userDTO);
    }

    @PutMapping("/api/user")
    public UserDTO updateUser(@RequestBody UserDTO updateUser){
        return userService.save(updateUser);
    }

    @DeleteMapping("/api/user")
    public void deleteUser(@RequestBody Long[] ids){
        userService.delete(ids);
    }

}
