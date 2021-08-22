package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.dto.RoleDTO;
import com.laptrinhjavaweb.service.IRoleService;
import com.laptrinhjavaweb.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller(value = "roleControllerOfAdmin")
public class RoleController {
    @Autowired
    private IRoleService roleService;

    @Autowired
    private MessageUtil messageUtil;

    @RequestMapping(value = "quan-tri/vai-tro/danh-sach")
    public ModelAndView showList(@RequestParam(value = "page",required = false) Integer page,
                                 @RequestParam(value = "limit",required = false) Integer limit,
                                 HttpServletRequest request){
        ModelAndView mav = new ModelAndView("/admin/role/list");
        RoleDTO model = new RoleDTO();
        if(page != null && limit != null) {
            model.setPage(page);
            model.setLimit(limit);
            model.setTotalPage((int) Math.ceil((double) (roleService.totalItem() / 2)));
            Pageable pageable = new PageRequest(page - 1, limit);
            model.setListResult(roleService.findAll(pageable));
        }
        if(request.getParameter("message") != null){
            Map<String,String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message",message.get("message"));
            mav.addObject("alert",message.get("alert"));
        }
        mav.addObject("model",model);
        return mav;
    }

    @RequestMapping(value = "quan-tri/vai-tro/chinh-sua")
    public ModelAndView editRole(@RequestParam(value = "id",required = false) Long id,
                                HttpServletRequest request){
        ModelAndView mav = new ModelAndView("/admin/role/edit");
        RoleDTO model = new RoleDTO();
        if(id != null){
            model = roleService.findById(id);
        }
        if(request.getParameter("message") != null){
            Map<String,String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message",message.get("message"));
            mav.addObject("alert",message.get("alert"));
        }
        mav.addObject("model",model);
        return mav;
    }
}
