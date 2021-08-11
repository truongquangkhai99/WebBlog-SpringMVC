package com.laptrinhjavaweb.entity;

import javax.persistence.*;

@Entity
@Table(name = "comment")
public class CommentEntity extends BaseEntity{

    @Column(name="content")
    private String content;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "userid")
    private UserEntity user;



    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "newid")
    private NewEntity baiViet;









    public NewEntity getBaiViet() {
        return baiViet;
    }

    public void setBaiViet(NewEntity baiViet) {
        this.baiViet = baiViet;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }
}
