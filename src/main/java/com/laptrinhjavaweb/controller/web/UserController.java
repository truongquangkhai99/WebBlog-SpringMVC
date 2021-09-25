package com.laptrinhjavaweb.controller.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.util.MessageUtil;
import com.laptrinhjavaweb.util.SecurityUtils;

@Controller(value = "userControllerOfWeb")
public class UserController {
	
	@Autowired
    private MessageUtil messageUtil;

    @Autowired
    private IUserService userService;
    
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    
    @RequestMapping(value = "/nguoi-dung",method = RequestMethod.GET)
    public ModelAndView hienThiThongTinTaiKhoan(){
        ModelAndView mav = new ModelAndView("/web/user/show");
        mav.addObject("USERMODEL",userService.findById(SecurityUtils.getPrincipal().getId()));
        return mav;
    }
    
    
    
    
    @RequestMapping(value = "/nguoi-dung/doi-mat-khau",method = RequestMethod.GET)
    public ModelAndView hienThiDoiMatKhau(HttpServletRequest request){
    	
    	ModelAndView mav = new ModelAndView("/web/user/changePassword");
    	if(request.getParameter("message") != null){
            Map<String,String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message",message.get("message"));
            mav.addObject("alert",message.get("alert"));
        }
    	return mav;
    }
    
    @RequestMapping(value = "/nguoi-dung/doi-mat-khau",method = RequestMethod.POST)
	public String doiMatKhau(	@RequestParam(value = "myPassword",required = false) String myPassword,
					            @RequestParam(value = "newPassword1",required = false) String newPassword1,
					            @RequestParam(value = "newPassword2",required = false) String newPassword2,
					            HttpServletRequest request){
    	String message = "";
    	UserDTO user = userService.findById(SecurityUtils.getPrincipal().getId());
    	if(newPassword1.equals(newPassword2)) {  		
    		if(bCryptPasswordEncoder.matches(myPassword, user.getPassword())) {
    			if(userService.changePassword(newPassword1))
    				message = "change_password_success";
    			else
    				message = "error_system";
    		}
    		else message = "wrong_password";
    	}
    	else message = "2password_not_equal";
    	return "redirect:/nguoi-dung/doi-mat-khau?message="+message;
    }

}
