package com.scuba.underwaterboard;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.scuba.common.Common;

@Controller
@RequestMapping("/underWaterBoard/*")
public class UnderwaterboardController {
	@Autowired
	UnderwaterboardService underwaterboardService;

	private ModelAndView mav = new ModelAndView();
	Common common = new Common();
	UnderwaterboardVO underwaterboardCheckVO = new UnderwaterboardVO();

	// 수중 게시판 이동 , 수중 게시판 전체 리스트 조회
	@RequestMapping(value = "underWaterBoardList")
	public ModelAndView underWaterBoardList() {
		// 수중게시판 전체 글 조회
		mav.addObject("underWaterBoardList", underwaterboardService.allBoardList());
		mav.setViewName("C_underWater/List");
		return mav;
	}

	// 수중 게시판 글 쓰기 이동
	@RequestMapping(value = "underWaterBoardWrite")
	public ModelAndView underWaterBoardWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().setAttribute("user_id", "test3");
		String user_id = (String)request.getSession().getAttribute("user_id");
		// 로그인 유무 확인
		if (user_id == null || user_id == "") {
			String notice = "로그인을 해주세요";
			common.noticeMethod(request, response, notice);
			mav.setViewName("member/Login");
		} else {
			mav.setViewName("C_underWater/Write");
		}
		return mav;
	}

	// 수중 게시판 글 등록
	@RequestMapping(value = "writeinsert", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView writeinsert(UnderwaterboardVO underwaterboardVO, @RequestParam MultipartFile file,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		HashMap<String, Object> resultMap = underwaterboardService.writeinsert(underwaterboardVO, file, request, response);

		int writeResult = (Integer) resultMap.get("writeResult");
		// 글 등록 성공시 (1:이미지o 2:이미지x)
		if (writeResult == 1 || writeResult == 2) {
			// 게시글 번호
			mav.addObject("num", resultMap.get("contentNum"));
			mav.setViewName("redirect:/underWaterBoard/underWaterBoardView");
		} else { // 글 등록 실패시
			String notice = "글 등록 실패";
			common.noticeMethod(request, response, notice);
			mav.setViewName("member/Login");
		}
		return mav;
	}

	// 상세보기 페이지 이동
	@RequestMapping(value = "underWaterBoardView")
	public ModelAndView freeboardView(UnderwaterboardVO underwaterboardVO) {
		mav.addObject("viewList", underwaterboardService.viewList(underwaterboardVO.getNum()));
		mav.setViewName("C_underWater/View");
		return mav;
	}

}
