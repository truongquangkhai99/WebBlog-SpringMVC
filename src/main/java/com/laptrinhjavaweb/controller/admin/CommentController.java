package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.service.ICommentService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.service.IUserService;
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

@Controller(value = "commentControllerOfAdmin")
public class CommentController {
    @Autowired
    private ICommentService commentService;

    @Autowired
    private INewService newService;

    @Autowired
    private IUserService userService;

    @Autowired
    private MessageUtil messageUtil;

    @RequestMapping(value = "quan-tri/binh-luan/danh-sach")
    public ModelAndView showList(@RequestParam(value = "page") Integer page,
                                 @RequestParam(value = "limit") Integer limit,
                                 HttpServletRequest request){
        ModelAndView mav = new ModelAndView("/admin/comment/list");
        CommentDTO model = new CommentDTO();
        if(page != null && limit != null){
            model.setPage(page);
            model.setLimit(limit);
            model.setTotalPage((int) Math.ceil((double) (commentService.totalItem() / 2)));
            Pageable pageable = new PageRequest(page-1 ,limit);
            model.setListResult(commentService.findAll(pageable));
        }
        if(request.getParameter("message") != null){
            Map<String,String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message",message.get("message"));
            mav.addObject("alert",message.get("alert"));
        }
        mav.addObject("model",model);
        return mav;
    }

    @RequestMapping(value = "quan-tri/binh-luan/chinh-sua")
    public ModelAndView editCategory(@RequestParam(value = "id",required = false) Long id,
                                     HttpServletRequest request){

        ModelAndView mav = new ModelAndView("/admin/comment/edit");
        CommentDTO model = new CommentDTO();
        if(id != null){
            model = commentService.findById(id);
            mav.addObject("resultsNew",newService.findById(model.getNewId()));
            mav.addObject("resultsUser",userService.findById(model.getUserId()));
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
