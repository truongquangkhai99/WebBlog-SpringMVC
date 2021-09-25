package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.laptrinhjavaweb.entity.NewEntity;


public interface NewRepository extends JpaRepository<NewEntity,Long> {

    List<NewEntity> findOneByCreatedBy(String userName);
    Page<NewEntity> findAllByCreatedBy(String createdBy, Pageable pageable);
    
    @Query("SELECT u FROM News u WHERE u.title LIKE %?1% OR u.category.code LIKE %?2%")
	Page<NewEntity> searchNew(String title,String categoryCode , Pageable pageable);
    
    @Query("SELECT u FROM News u WHERE u.title LIKE %?1% AND u.createdBy = ?2")
	Page<NewEntity> searchNewByCreatedBy(String searchName, String createdBy, Pageable pageable);
    
   
}
