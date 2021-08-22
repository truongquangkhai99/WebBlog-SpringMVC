package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.NewEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface NewRepository extends JpaRepository<NewEntity,Long> {

    List<NewEntity> findOneByCreatedBy(String userName);
    Page<NewEntity> findAllByCreatedBy(String createdBy, Pageable pageable);
}
