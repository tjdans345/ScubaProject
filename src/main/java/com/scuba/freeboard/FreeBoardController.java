package com.scuba.freeboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeBoardController {

	@Autowired
	FreeBoardService freeboardService;

	private ModelAndView mav = new ModelAndView();
	String communityname = "free";
	// 자유게시판 이동
	@RequestMapping(value = "freeBoard")
	public ModelAndView freeboard() {
		mav.setViewName("C_free/List");
		return mav;
	}

	// 글쓰기게시판 이동
	@RequestMapping(value = "writeboard")
	public ModelAndView writeboard() {
		mav.setViewName("C_free/Write");
		return mav;
	}

	// 글 등록
	@RequestMapping(value = "writeinsert", method = RequestMethod.POST)
	public ModelAndView write(FreeBoardVO freeboardVO) {
		System.out.println("와쓰와쓰 컨트롤러");
		System.out.println("잉?" + freeboardVO.getTitle());
		System.out.println("컨텐트zzz" + freeboardVO.getFreecontent());
		freeboardVO.setCommunityname(communityname);
		mav.setViewName("C_free/List");
		return mav;
	}
	
}
