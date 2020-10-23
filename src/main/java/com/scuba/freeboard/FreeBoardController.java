package com.scuba.freeboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeBoardController {

	@Autowired
	FreeBoardService freeboardService;
	
	private ModelAndView mav = new ModelAndView();
	
	
	@RequestMapping(value = "freeBoard")
	public ModelAndView login() {
		
		mav.setViewName("free/List");
		return mav;
	}
	
	
	
	
	
	
	
	
}
