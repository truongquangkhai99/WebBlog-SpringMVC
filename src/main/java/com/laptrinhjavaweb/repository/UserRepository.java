package com.laptrinhjavaweb.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.laptrinhjavaweb.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity,Long> {
    UserEntity findOneByUserNameAndStatus(String name,int status);
    UserEntity findOneByUserName(String userName);
    
    @Query("SELECT u FROM User u WHERE u.userName LIKE %?1% OR u.fullName LIKE %?2%")
	Page<UserEntity> searchUser(String userName, String fullName, Pageable pageable);
}
