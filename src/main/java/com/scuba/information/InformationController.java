package com.scuba.information;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InformationController{
	
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
	public ModelAndView sendCountry(MultipartHttpServletRequest mutirequest,
									HttpSession session) throws Exception {
		InformationVO informationVO = new InformationVO();
		informationVO.setCountryName(mutirequest.getParameter("CountryName"));
		if(mutirequest.getParameter("CountryImageAlread")!=null) {
			informationVO.setCountryImage(mutirequest.getParameter("CountryImageAlread"));
		}else {
			informationVO.setCountryImage(mutirequest.getFile("CountryImage").getOriginalFilename());
		}
		informationVO.setCityXpoint(Double.parseDouble(mutirequest.getParameter("CityXpoint")));
		informationVO.setCityYpoint(Double.parseDouble(mutirequest.getParameter("CityYpoint")));
		informationVO.setCityName(mutirequest.getParameter("CityName"));
		informationVO.setCityExp(mutirequest.getParameter("CityExp"));
		informationVO.setAveTemper(Integer.parseInt(mutirequest.getParameter("AveTemper")));
		//시즌 값 생성
		String Season = "";
		for(int i = 0 ; i < 12 ; i++) {
		if(mutirequest.getParameter("Season"+i) != null) Season += mutirequest.getParameter("Season"+i)+" ";
		}
		informationVO.setSeason(Season);
		if(mutirequest.getParameter("CountryImageAlread")==null) {
			//파일 업로드
			MultipartFile file = mutirequest.getFile("CountryImage");
			String url = session.getServletContext().getRealPath("/resources/upload/information/Country/");
			informationService.FileUpload(file, url);
		}
		//DB입력 
		informationService.enterCountry(informationVO);
		modelAndView.setViewName("redirect:/EnterCountry.info");
		return modelAndView;
	}
	//국가 등록시 카테고리 변경
	@ResponseBody
	@RequestMapping(value = "getCountryinfo", method = RequestMethod.POST)
	public JSONObject getCountryinfo(String CountryName,HttpSession session,
									HttpServletRequest request) {
		//서버시 변경사항 session.getServletContext().getRealPath
		String url = request.getContextPath()+"/resources/upload/information/Country/";
		InformationVO informationVO = informationService.getCountryinfo(CountryName);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("CountryName",informationVO.getCountryName());
		jsonObject.put("CountryImage", informationVO.getCountryImage());
		jsonObject.put("url",url);
		return jsonObject;
	}
}
