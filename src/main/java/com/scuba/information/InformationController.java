package com.scuba.information;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.scuba.member.MemberVO;

@Controller
public class InformationController {
	@Autowired
	private InformationService informationService ;
	
	ModelAndView modelAndView = new ModelAndView(); 
	
	//다이빙(국가) 이동
	@RequestMapping(value = "DivingCountry")
	public ModelAndView DivingCountry() {
		modelAndView.setViewName("information/I-DivingCountry");
		return modelAndView;
	}
	//다이빙(국가) 등록 이동
	@RequestMapping(value = "EnterCountry")
	public ModelAndView EnterCountry() {
		modelAndView.setViewName("information/M-EnterCountry");
		return modelAndView;
	}
	@RequestMapping(value = "sendCountry", method = RequestMethod.POST)
	public ModelAndView sendCountry(MultipartHttpServletRequest request) {
		InformationVO informationVO = new InformationVO();
		informationVO.setCountryName(request.getParameter("CountryName"));
		informationVO.setCountryImage(request.getFile("CountryImage").getOriginalFilename());
		informationVO.setCityXpoint(Double.parseDouble(request.getParameter("CityXpoint")));
		informationVO.setCityYpoint(Double.parseDouble(request.getParameter("CityYpoint")));
		informationVO.setCityName(request.getParameter("CityName"));
		informationVO.setCityExp(request.getParameter("CityExp"));
		informationVO.setAveTemper(Integer.parseInt(request.getParameter("AveTemper")));
		String Season = "";
		for(int i = 0 ; i < 12 ; i++) {
		if(request.getParameter("Season"+i) != null) Season += request.getParameter("Season"+i)+" ";
		}
		informationVO.setSeason(Season);
		
		MultipartFile file = request.getFile("CountryImage");
		System.out.println("originFilename : " + file.getOriginalFilename());
		System.out.println("extensionName : " + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."), file.getOriginalFilename().length()));
		System.out.println("size : " + file.getSize());
		return modelAndView;
	}
}
