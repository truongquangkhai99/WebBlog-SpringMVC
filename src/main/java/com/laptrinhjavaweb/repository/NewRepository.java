package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.NewEntity;
import org.springframework.data.jpa.repository.JpaRepository;


public interface NewRepository extends JpaRepository<NewEntity,Long> {

}
