package com.laptrinhjavaweb.dto;

public class CommentDTO extends AbstractDTO<CommentDTO>{
    private String content;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
