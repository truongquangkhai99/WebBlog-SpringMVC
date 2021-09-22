package com.laptrinhjavaweb.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.service.ICategoryService;

@RestController(value = "categoryAPIOfAdmin")
public class CategoryAPI {

    @Autowired
    private ICategoryService categoryService;

    

    @PostMapping("/api/category")
    public CategoryDTO createCategory(@RequestBody CategoryDTO categoryDTO){
        return categoryService.save(categoryDTO);
    }

    @PutMapping("/api/category")
    public CategoryDTO updateCategory(@RequestBody CategoryDTO updateCategory){
        return categoryService.save(updateCategory);
    }


    @DeleteMapping("/api/category")
    public void deleteCategory(@RequestBody Long[] ids){
        categoryService.delete(ids);
    }

    
}
