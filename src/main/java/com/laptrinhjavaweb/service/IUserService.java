package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.UserDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IUserService {
    UserDTO save(UserDTO dto);
    void delete(Long[] ids);
    List<UserDTO> findAll(Pageable pageable);
    Integer totalItem();
    UserDTO findById(Long id);
    UserDTO findbyUserName(String userName);
	List<UserDTO> searchUser(String searchKey, String searchName, Pageable pageable);
	Boolean changePassword(String newPassword);
}
