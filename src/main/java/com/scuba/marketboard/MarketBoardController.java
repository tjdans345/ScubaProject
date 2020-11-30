package com.scuba.marketboard;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.scuba.common.Common;
import com.scuba.jobSearchboard.JobSearchboardVO;

@Controller
@RequestMapping("/marketBoard/*")
public class MarketBoardController {

	@Autowired
	MarketBoardService marketboardService;

	ModelAndView mav = new ModelAndView();
	Common common = new Common();
	MarketBoardVO marketBoardCheckVO = new MarketBoardVO();

	// 중고장터 게시판 이동
	@RequestMapping(value = "marketBoardList")
	public ModelAndView marketBoardList(HttpServletRequest request) {
		request.getSession().setAttribute("category", "market");
		// 후기게시판 전체 글 조회
		mav.addObject("marketBoardList", marketboardService.allBoardList());
		mav.setViewName("C_market/List");
		return mav;

	}

	// 중고장터 게시판 글 쓰기 페이지 이동
	@RequestMapping(value = "marketBoardWrite")
	public ModelAndView marketBoardWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user_id = (String) request.getSession().getAttribute("user_id");

		// 비로그인 시 로그인 페이지로 이동시킴
		if (user_id == "" || user_id == null) {
			String notice = "로그인을 해주세요";
			common.noticeMethod(request, response, notice);
			mav.setViewName("member/Login");
		} else {
			mav.setViewName("C_market/Write");
		}
		return mav;
	}

	// 중고장터 게시판 글 등록
	@RequestMapping(value = "WriteInsert", method = RequestMethod.POST)
	public ModelAndView WriteInsert(MarketBoardVO marketboardVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		System.out.println(marketboardVO.getCommunityname());
		System.out.println(marketboardVO.getContent());
		System.out.println(marketboardVO.getPhone());
		System.out.println(marketboardVO.getTitle());
		System.out.println(marketboardVO.getPrice());
		System.out.println(marketboardVO.getMarketcategory());
		System.out.println(marketboardVO.getProductstatus());

		HashMap<String, Object> resultMap = marketboardService.WriteInsert(marketboardVO, request, response);
		int writeResult = (Integer) resultMap.get("writeResult");
		// 글 등록 성공시 (1:이미지o 2:이미지x)
		if (writeResult == 1 || writeResult == 2) {
			// 게시글 번호
			mav.addObject("num", resultMap.get("contentNum"));
			mav.setViewName("redirect:/marketBoard/marketBoardView");
		} else { // 글 등록 실패시
			String notice = "글 등록 실패";
			common.noticeMethod(request, response, notice);
			mav.setViewName("member/Login");
		}
		return mav;
	}

	// 상세보기 페이지 이동
	@RequestMapping(value = "marketBoardView")
	public ModelAndView marketBoardView(MarketBoardVO marketboardVO) {
		mav.addObject("viewList", marketboardService.viewList(marketboardVO.getNum()));
		System.out.println("호호호 : "+marketboardService.viewList(marketboardVO.getNum()).toString());
		mav.setViewName("C_market/View");
		return mav;
	}

}
