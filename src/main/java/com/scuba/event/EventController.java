package com.scuba.event;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/Event/*")
public class EventController {
	
	@Autowired
	private EventService eventService;
	private ModelAndView modelAndView = new ModelAndView();
	
	//이벤트 리스트 이동
	@RequestMapping(value = "moveEventList")
	public ModelAndView moveEventList(HttpServletRequest request,
									   @RequestParam(defaultValue = "") String search,
									   @RequestParam(defaultValue = "1") int nowpage) {
		request.getSession().setAttribute("category", "event");
		modelAndView.setViewName("N_event/List");
		return modelAndView;
	}
	
	//이벤트 글쓰기 이동
	@RequestMapping(value = "moveWrite")
	public ModelAndView moveWrite(HttpServletRequest request) {
		request.getSession().setAttribute("category", "event");
		modelAndView.setViewName("N_event/Write");
		return modelAndView;
	}
}
