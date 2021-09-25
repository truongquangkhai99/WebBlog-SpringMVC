package com.laptrinhjavaweb.controller.web;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

    @Autowired
    private MessageUtil messageUtil;

    @Autowired
    private IUserService userService;

    @Autowired
    private INewService newService;
    
    @Autowired
    private ICategoryService categoryService;

    @RequestMapping(value = "/trang-chu",method = RequestMethod.GET)
    public ModelAndView homePage(@RequestParam(value = "page",required = false) Integer page,
                                 @RequestParam(value = "limit",required = false) Integer limit,
                                 @RequestParam(value = "sortName",required = false) String sortName,
                                 @RequestParam(value = "sortBy",required = false) String sortBy,
                                 @RequestParam(value = "searchKey",required = false) String searchKey,
                                 @RequestParam(value = "searchName",required = false) String searchName){

        ModelAndView mav = new ModelAndView("web/home");
        NewDTO model = new NewDTO();
        if(page != null && limit != null) {
            model.setPage(page);
            model.setLimit(limit);
            model.setTotalPage((int) Math.ceil((double) (newService.totalItem() / 2)));
            Pageable pageable = null;
            if(sortBy.equalsIgnoreCase("desc"))
            	pageable = new PageRequest(page - 1, limit,Sort.Direction.DESC,sortName);
            else if(sortBy.equalsIgnoreCase("asc"))
            	pageable = new PageRequest(page - 1, limit,Sort.Direction.ASC,sortName);
            if(searchKey != null && searchName != null) {
            	model.setSearchKey(searchKey);
                model.setSearchName(searchName);
                model.setListResult(newService.searchNew(searchKey,searchName,pageable));
           }
            else model.setListResult(newService.findAll(pageable));
        }
        mav.addObject("categories",categoryService.findAll(null));
        mav.addObject("model",model);
        return mav;
    }

    @RequestMapping(value = "/dang-nhap",method = RequestMethod.GET)
    public ModelAndView loginPage(){
        ModelAndView mav = new ModelAndView("login");
        return mav;
    }

    @RequestMapping(value = "/dang-ky",method = RequestMethod.GET)
    public ModelAndView registerPage(HttpServletRequest request){
        ModelAndView mav = new ModelAndView("register");
        if(request.getParameter("message") != null){
            Map<String,String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message",message.get("message"));
            mav.addObject("alert",message.get("alert"));
        }
        mav.addObject("model",new UserDTO());
        return mav;
    }

    @RequestMapping(value = "/dang-ky",method = RequestMethod.POST)
    public String registry(@ModelAttribute("model")UserDTO model){
        String message = "";
        if(userService.findbyUserName(model.getUserName()) == null){
            model.setRoleCode("USER");
            model.setStatus(1);
            userService.save(model);
            message = "register-success";
        }
        else message = "register-error";

        return "redirect:/dang-ky?message="+message;
    }


    @RequestMapping(value = "/thoat",method = RequestMethod.GET)
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return new ModelAndView("redirect:/dang-nhap");
    }

    @RequestMapping(value = "/accessDenied",method = RequestMethod.GET)
    public ModelAndView accessDenied(){
        return new ModelAndView("redirect:/dang-nhap?accessDenied");
    }

}
