package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.CommentDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ICommentService {
    List<CommentDTO> findAll(Pageable pageable);
    CommentDTO save(CommentDTO dto);
    void delete(Long[] ids);
}
