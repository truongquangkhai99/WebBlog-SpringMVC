package com.laptrinhjavaweb.dto;

public class CommentDTO extends AbstractDTO<CommentDTO>{
    private String content;

    private Long newId;
    private Long userId;


    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getNewId() {
        return newId;
    }

    public void setNewId(Long newId) {
        this.newId = newId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}