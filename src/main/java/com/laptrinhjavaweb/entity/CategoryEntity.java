package com.laptrinhjavaweb.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity(name = "Category")
@Table(name = "category")
public class CategoryEntity extends BaseEntity{
    @Column(name = "name")
    private String name;

    @Column(name = "code")
    private String code;


    @OneToMany(mappedBy = "category",fetch = FetchType.LAZY)
    private List<NewEntity> news = new ArrayList<>();

    public CategoryEntity(String name, String code) {
        this.name = name;
        this.code = code;
    }

    public CategoryEntity() {

    }

    @Override
    public String toString() {
        return "CategoryEntity{" +
                "name='" + name + '\'' +
                ", code='" + code + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public List<NewEntity> getNews() {
        return news;
    }

    public void setNews(List<NewEntity> news) {
        this.news = news;
    }
}
