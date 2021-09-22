package com.laptrinhjavaweb.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.service.ICommentService;

@RestController(value = "commentAPIOfAdmin")
public class CommentAPI {
    @Autowired
    private ICommentService commentService;


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
