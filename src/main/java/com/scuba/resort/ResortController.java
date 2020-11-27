package com.scuba.resort;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/Resort/*")
public class ResortController {

	@Autowired
	private ResortService resortService;
	private ModelAndView modelAndView = new ModelAndView();
	
	//리조트 리스트 이동
	@RequestMapping(value = "moveResortList" )
	public ModelAndView moveResortList() {
		modelAndView.setViewName("resort/ResortList");
		return modelAndView;
	}
	//리조트 등록 이동
	@RequestMapping(value = "moveResortWriter" )
	public ModelAndView moveResortWriter() {
		modelAndView.setViewName("resort/ResortWriter");
		return modelAndView;
	}
	//리조트 등록
	@RequestMapping(value = "EnterResort" , method = RequestMethod.POST)
	public ModelAndView EnterResort(MultipartHttpServletRequest multipartHttpServletRequest, 
									HttpSession session) throws Exception{
		resortService.EnterResort(multipartHttpServletRequest, session);
		modelAndView.setViewName("resort/ResortWriter");
		return modelAndView;
	}
	//리조트 관리자 페이지 이동
	@RequestMapping(value = "moveResortAdmin")
	public ModelAndView moveResortAdmin(@RequestParam(defaultValue = "1") int nowpage,
										@RequestParam(defaultValue = "0") int resortStatus,
										@RequestParam(defaultValue = "") String search) {
		modelAndView.addObject("map",resortService.getAdminResortList(nowpage, resortStatus,search));
		modelAndView.setViewName("resort/M-ResortList");
		return modelAndView;
	}
	
}
