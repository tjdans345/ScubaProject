package com.scuba.information;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InformationController {
	@Autowired
	private InformationService informationService ;
	
	ModelAndView modelAndView = new ModelAndView(); 
	
	//다이빙(국가) 이동
	@RequestMapping(value = "DivingCountry", method = RequestMethod.GET)
	public ModelAndView DivingCountry() {
		modelAndView.setViewName("information/I-DivingCountry");
		return modelAndView;
	}
	//다이빙(국가) 등록 이동
	@RequestMapping(value = "EnterCountry", method = RequestMethod.GET)
	public ModelAndView EnterCountry() {
		modelAndView.setViewName("information/M-EnterCountry");
		return modelAndView;
	}
}
