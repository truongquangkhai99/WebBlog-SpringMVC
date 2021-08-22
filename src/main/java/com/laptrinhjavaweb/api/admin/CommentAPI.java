package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.converter.CommentConverter;
import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController(value = "commentAPIOfAdmin")
public class CommentAPI {
    @Autowired
    private ICommentService commentService;

    @Autowired
    private CommentConverter converter;

    @PostMapping("/api/comment")
    public CommentDTO createComment(@RequestBody CommentDTO commentDTO){
        return commentService.save(commentDTO);
    }

    @PutMapping("/api/comment")
    public CommentDTO updateComment(@RequestBody CommentDTO updateComment){
        return commentService.save(updateComment);
    }


    @DeleteMapping("/api/comment")
    public void deleteComment(@RequestBody Long[] ids){
        commentService.delete(ids);
    }
}
