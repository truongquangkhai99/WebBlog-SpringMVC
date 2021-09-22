package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.service.IRoleService;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller(value = "userControllerOfAdmin")
public class UserController {

    @Autowired
    private IUserService userService;

    @Autowired
    private IRoleService roleService;

    @Autowired
    private MessageUtil messageUtil;

    @RequestMapping(value = "quan-tri/nguoi-dung/danh-sach")
    public ModelAndView showList(@RequestParam(value = "page") Integer page,
                                 @RequestParam(value = "limit") Integer limit,
                                 @RequestParam(value = "sortBy",required = false) String sortBy,
                                 @RequestParam(value = "sortName",required = false) String sortName,
                                 HttpServletRequest request){
        ModelAndView mav = new ModelAndView("/admin/user/list");
        UserDTO model = new UserDTO();
        if(page != null && limit != null){
            model.setPage(page);
            model.setLimit(limit);
            model.setTotalPage((int) Math.ceil((double) (userService.totalItem() / 2)));
            Pageable pageable = null;
            if(sortBy.equalsIgnoreCase("desc"))
            	pageable = new PageRequest(page - 1, limit,Sort.Direction.DESC,sortName);
            else if(sortBy.equalsIgnoreCase("asc"))
            	pageable = new PageRequest(page - 1, limit,Sort.Direction.ASC,sortName);
            model.setListResult(userService.findAll(pageable));
        }

        if(request.getParameter("message") != null){
            Map<String,String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message",message.get("message"));
            mav.addObject("alert",message.get("alert"));
        }

        mav.addObject("model",model);
        return mav;
    }

    @RequestMapping(value = "quan-tri/nguoi-dung/chinh-sua")
    public ModelAndView editUser(@RequestParam(value = "id",required = false) Long id,HttpServletRequest request){
        ModelAndView mav = new ModelAndView("/admin/user/edit");
        UserDTO model = new UserDTO();
        if(id != null){
            model = userService.findById(id);
        }
        if(request.getParameter("message") != null){
            Map<String,String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message",message.get("message"));
            mav.addObject("alert",message.get("alert"));
        }
        mav.addObject("roles",roleService.findAll());
        mav.addObject("model",model);
        return mav;
    }
}
