package com.scuba.underwaterboard;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/underWaterBoard/*")
public class UnderwaterboardController {
	@Autowired
	UnderwaterboardService underwaterboardService;
	
	private ModelAndView mav = new ModelAndView();
	UnderwaterboardVO underwaterboardCheckVO = new UnderwaterboardVO();
	
	// 수중 게시판 이동 , 수중 게시판 전체 리스트 조회
	@RequestMapping(value = "underWaterBoardList")
	public ModelAndView underWaterBoardList() {
		
		mav.setViewName("C_underWater/List");
		return mav;
	}
	
	// 수중 게시판 글 쓰기 이동
	@RequestMapping(value = "underWaterBoardWrite")
	public ModelAndView underWaterBoardWrite() {
		
		mav.setViewName("C_underWater/Write");
		return mav;
	}
	
	// 수중 게시판 글 등록
	@RequestMapping(value = "writeinsert", method = RequestMethod.POST)
	public ModelAndView writeinsert(UnderwaterboardVO underwaterboardVO) {
		System.out.println("와쓰");
		System.out.println("title : " + underwaterboardVO.getTitle());
		System.out.println("content : " + underwaterboardVO.getContent());
		System.out.println("country : " + underwaterboardVO.getCountry());
		System.out.println("area : " + underwaterboardVO.getArea());
		System.out.println("introduction : " + underwaterboardVO.getIntroduction());
		System.out.println("thumbnail : " + underwaterboardVO.getThumbnail());
		
		return mav;
	}
	
	
	
	
	
	
	
	
	
}
