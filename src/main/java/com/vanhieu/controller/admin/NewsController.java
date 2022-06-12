package com.vanhieu.controller.admin;

import com.vanhieu.dto.NewsDTO;
import com.vanhieu.service.ICategoryService;
import com.vanhieu.service.INewsService;
import com.vanhieu.util.MessageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller(value = "newControllerOfAdmin")
public class NewsController {

    @Autowired
    INewsService newsService;

    @Autowired
    ICategoryService categoryService;

    @RequestMapping(value = "/admin/new/list", method = RequestMethod.GET)
    public ModelAndView showList(@RequestParam("page") int page,
                                 @RequestParam("limit") int limit,
                                 HttpServletRequest request) {

        NewsDTO models = new NewsDTO();
        models.setPage(page);
        models.setLimit(limit);
        Pageable pageable = new PageRequest(page - 1, limit);
        ModelAndView mav = new ModelAndView("admin/new/list");
        models.setListResult(newsService.findAll(pageable));
        models.setTotalItem(newsService.getTotalItem());
        models.setTotalPage((int) Math.ceil( (double) models.getTotalItem() / models.getLimit() ));
        mav.addObject("model", models);
        if (request.getParameter("message") != null) {
            Map<String, String> message = MessageUtils.getMessage(request.getParameter("message"));
            mav.addObject("message",message.get("message"));
            mav.addObject("alert", message.get("alert"));
        }
        return mav; 
    }

    @RequestMapping(value = "/admin/new/edit", method = RequestMethod.GET)
    public ModelAndView editNews(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {

        ModelAndView mav = new ModelAndView("admin/new/edit");
        NewsDTO model = new NewsDTO();
        if (id != null) {
            model = newsService.findById(id);
        }
        if (request.getParameter("message") != null) {
            Map<String, String> message = MessageUtils.getMessage(request.getParameter("message"));
            mav.addObject("message",message.get("message"));
            mav.addObject("alert", message.get("alert"));
        }
        mav.addObject("categories", categoryService.findAll());
        mav.addObject("model", model);
        return mav;
    }

}