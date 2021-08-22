package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.converter.CategoryConverter;
import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "categoryAPIOfAdmin")
public class CategoryAPI {

    @Autowired
    private ICategoryService categoryService;

    @Autowired
    private CategoryConverter converter;

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

    @GetMapping("/api/category")
    public List<CategoryDTO> getCategory(){

        return categoryService.findAll(new PageRequest(0,5));
    }
}
