package com.scuba.base;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	ModelAndView modelAndView = new ModelAndView();
	
	@RequestMapping(value = "index.scu", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		modelAndView.setViewName("index/index");
		return modelAndView;
	}
	
}
