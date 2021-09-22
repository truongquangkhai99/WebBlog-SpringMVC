package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;


@Controller(value = "categoryControllerOfAdmin")
public class CategoryController {

    @Autowired
    private ICategoryService categoryService;

    @Autowired
    private MessageUtil messageUtil;

    @RequestMapping(value = "quan-tri/the-loai/danh-sach")
    public ModelAndView showList(@RequestParam(value = "page") Integer page,
                                 @RequestParam(value = "limit") Integer limit,
                                 @RequestParam(value = "sortBy",required = false) String sortBy,
                                 @RequestParam(value = "sortName",required = false) String sortName,
                                 HttpServletRequest request){
        ModelAndView mav = new ModelAndView("/admin/category/list");
        CategoryDTO model = new CategoryDTO();
        if(page != null && limit != null){
            model.setPage(page);
            model.setLimit(limit);
            model.setTotalPage((int) Math.ceil((double) (categoryService.totalItem() / 2)));
            Pageable pageable = null;
            if(sortBy.equalsIgnoreCase("desc"))
            	pageable = new PageRequest(page - 1, limit,Sort.Direction.DESC,sortName);
            else if(sortBy.equalsIgnoreCase("asc"))
            	pageable = new PageRequest(page - 1, limit,Sort.Direction.ASC,sortName);
            model.setListResult(categoryService.findAll(pageable));
        }
        if(request.getParameter("message") != null){
            Map<String,String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message",message.get("message"));
            mav.addObject("alert",message.get("alert"));
        }
        mav.addObject("model",model);
        return mav;
    }

    @RequestMapping(value = "quan-tri/the-loai/chinh-sua")
    public ModelAndView editCategory(@RequestParam(value = "id",required = false) Long id, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("/admin/category/edit");
        CategoryDTO model = new CategoryDTO();
        if(id != null){
            model = categoryService.findById(id);
        }
        if(request.getParameter("message") != null){
            Map<String,String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message",message.get("message"));
            mav.addObject("alert",message.get("alert"));
        }
        mav.addObject("model",model);
        return mav;
    }


    @RequestMapping(value = "quan-tri/the-loai/chinh-sua",method = RequestMethod.POST)
    public String saveCategory(@ModelAttribute("model") CategoryDTO model,HttpServletRequest request){
        String message = "";
        if(model.getId() != null){
            message = "update_success";

        }
        else{
            message = "insert_success";
        }
        model = categoryService.save(model);
        CsrfToken token = new HttpSessionCsrfTokenRepository().loadToken(request);
        return "redirect:/quan-tri/the-loai/chinh-sua?id="+model.getId()+"&message="+message+"&"+token.getParameterName()+"="+token.getToken();
    }

    @RequestMapping(value = "quan-tri/the-loai/delete",method = RequestMethod.GET)
    public String deleteCategory(@RequestParam("ids") Long[] ids,
                                 HttpServletRequest request){
        categoryService.delete(ids);
        CsrfToken token = new HttpSessionCsrfTokenRepository().loadToken(request);
        return "redirect:/quan-tri/the-loai/danh-sach?&message=delete_success&page=1&limit=5&"+token.getParameterName()+"="+token.getToken();
    }

}

