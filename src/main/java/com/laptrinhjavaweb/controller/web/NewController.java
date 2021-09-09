package com.laptrinhjavaweb.controller.web;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.util.MessageUtil;
import com.laptrinhjavaweb.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller(value = "newControllerOfWeb")
public class NewController {
    @Autowired
    private INewService newService;

    @Autowired
    private ICategoryService categoryService;

    @Autowired
    private MessageUtil messageUtil;


    @RequestMapping(value = "/bai-viet/danh-sach")
    public ModelAndView showList(@RequestParam(value = "page",required = false) Integer page,
                                 @RequestParam(value = "limit",required = false) Integer limit){
        ModelAndView mav = new ModelAndView("/web/new/list");
        NewDTO model = new NewDTO();
        if(page != null && limit != null) {
            model.setPage(page);
            model.setLimit(limit);
            model.setTotalPage((int) Math.ceil((double) (newService.totalItem() / 2)));
            Pageable pageable = new PageRequest(page - 1, limit);
            model.setListResult(newService.findAllByCreatedBy(SecurityUtils.getPrincipal().getUsername(),pageable));
        }
        mav.addObject("model",model);
        return mav;
    }


    @RequestMapping(value = "/bai-viet/chinh-sua")
    public ModelAndView taoBaiViet(@RequestParam(value = "id",required = false) Long id,
                                HttpServletRequest request){
        ModelAndView mav = new ModelAndView("/web/new/edit");
        NewDTO model = new NewDTO();
        if(id != null){
            model = newService.findById(id);
        }
        if(request.getParameter("message") != null){
            Map<String,String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message",message.get("message"));
            mav.addObject("alert",message.get("alert"));
        }
        mav.addObject("categories",categoryService.findAll());
        mav.addObject("model",model);
        return mav;
    }

    @RequestMapping(value = "/xem-bai-viet")
    public ModelAndView xemBaiViet(@RequestParam(value = "id",required = false) Long id,
                                   HttpServletRequest request){
        ModelAndView mav = new ModelAndView("/web/new/view");
        NewDTO model = new NewDTO();
        if(id != null){
            model = newService.findById(id);
        }
        mav.addObject("category",categoryService.findByCode(model.getCategoryCode()));
        mav.addObject("listComments",newService.findAllCommentByNewId(model.getId()));
        mav.addObject("model",model);
        return mav;
    }
}
