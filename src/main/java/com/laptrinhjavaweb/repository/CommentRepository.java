package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.CommentEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentRepository extends JpaRepository<CommentEntity,Long> {

}
