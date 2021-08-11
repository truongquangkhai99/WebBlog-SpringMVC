package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.converter.CategoryConverter;
import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController(value = "categoryAPIOfAdmin")
public class CategoryAPI {

    @Autowired
    private ICategoryService categoryService;

    @Autowired
    private CategoryConverter converter;

    @PostMapping("/api/category")
    public CategoryDTO createCategory(@RequestBody CategoryDTO CategoryDTO){
        return categoryService.save(CategoryDTO);
    }

    @PutMapping("/api/category")
    public CategoryDTO updateCategory(@RequestBody CategoryDTO CategoryDTO){
        return categoryService.save(CategoryDTO);
    }


    @DeleteMapping("/api/category")
    public void deleteCategory(@RequestBody Long[] ids){
        categoryService.delete(ids);
    }


}
