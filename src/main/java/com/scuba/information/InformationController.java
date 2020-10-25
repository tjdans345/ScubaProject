package com.scuba.information;

import java.io.File;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

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
		modelAndView.addObject("CountryList", informationService.getCountryName());
		modelAndView.setViewName("information/M-EnterCountry");
		return modelAndView;
	}
	//다이빙(국가) 등록
	@RequestMapping(value = "sendCountry", method = RequestMethod.POST)
	public ModelAndView sendCountry(MultipartHttpServletRequest request,
									HttpSession session) throws Exception {
		InformationVO informationVO = new InformationVO();
		informationVO.setCountryName(request.getParameter("CountryName"));
		informationVO.setCountryImage(request.getFile("CountryImage").getOriginalFilename());
		informationVO.setCityXpoint(Double.parseDouble(request.getParameter("CityXpoint")));
		informationVO.setCityYpoint(Double.parseDouble(request.getParameter("CityYpoint")));
		informationVO.setCityName(request.getParameter("CityName"));
		informationVO.setCityExp(request.getParameter("CityExp"));
		informationVO.setAveTemper(Integer.parseInt(request.getParameter("AveTemper")));
		//시즌 값 생성
		String Season = "";
		for(int i = 0 ; i < 12 ; i++) {
		if(request.getParameter("Season"+i) != null) Season += request.getParameter("Season"+i)+" ";
		}
		informationVO.setSeason(Season);
		//파일 업로드
		MultipartFile file = request.getFile("CountryImage");
		String url = session.getServletContext().getRealPath("/upload/information/Country/");
		informationService.FileUpload(file, url);
		//DB입력 
		informationService.enterCountry(informationVO);
		modelAndView.setViewName("redirect:/EnterCountry.info");
		return modelAndView;
	}
	//국가 등록시 카테고리 변경
	@ResponseBody
	@RequestMapping(value = "getCountryinfo", method = RequestMethod.POST)
	public JSONObject getCountryinfo(String CountryName,HttpSession session) {
		String url = session.getServletContext().getRealPath("/resources/upload/information/Country/");
		InformationVO informationVO = informationService.getCountryinfo(CountryName);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("CountryName",informationVO.getCountryName());
		jsonObject.put("CountryImage", informationVO.getCountryImage());
		File file = new File(url,informationVO.getCountryImage());
		jsonObject.put("file",file);
		return jsonObject;
	}
}
