package com.scuba.freeboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.Document;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.scuba.common.Common;

@Controller
@RequestMapping("/freeBoard/*")
public class FreeBoardController {

	@Autowired
	FreeBoardService freeboardService;

	private ModelAndView mav = new ModelAndView();
	Common common = new Common();
	// 자유게시판 이동 , 자유게시판 전체 리스트 조회
	@RequestMapping(value = "freeBoardList")
	public ModelAndView freeBoardList() {
		// 자유게시판 전체 글 조회
		mav.addObject("freeBoardList", freeboardService.allBoardList());
		mav.setViewName("C_free/List");
		return mav;
	}

	// 글쓰기 페이지 이동
	@RequestMapping(value = "writeboard")
	public ModelAndView writeboard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().setAttribute("user_id", "test3");
		String user_id = (String)request.getSession().getAttribute("user_id");
		//로그인 유무 확인
		if(user_id == null) {
			String notice = "로그인을 해주세요";
			common.noticeMethod(request, response, notice);
			mav.setViewName("member/Login");
		} else {
			mav.setViewName("C_free/Write");
		}
		return mav;
	}

	// 상세보기 페이지 이동
	@RequestMapping(value = "freeBoardView")
	public ModelAndView freeboardView(FreeBoardVO freeboardVO) {
		mav.addObject("viewList", freeboardService.viewList(freeboardVO.getNum()));
		mav.setViewName("C_free/View");
		return mav;
	}

	// 글 등록
	@RequestMapping(value = "writeinsert", method = RequestMethod.POST)
	public ModelAndView writeinsert(FreeBoardVO freeboardVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// Service 글 등록
		HashMap resultMap = freeboardService.write(freeboardVO, request, response);
		int writeResult = (Integer) resultMap.get("writeResult");
		// 글 등록 성공시 1:이미지o 2:이미지x
		if (writeResult == 1 || writeResult == 2) {
			// 게시글 번호
			mav.addObject("num", resultMap.get("contentNum"));
			mav.setViewName("redirect:/freeBoard/freeBoardView");
		} else { // 글 등록 실패시
			mav.setViewName("redirect:/freeBoard/freeBoardList");
		}
		return mav;
	}

	// 글 삭제
	@RequestMapping(value = "freeBoardDelete")
	public ModelAndView freeboardDelete(FreeBoardVO freeboardVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user_nickname = (String)request.getSession().getAttribute("user_nickname");
		String write_nickname = freeboardService.idCheck(freeboardVO.getNum());
		//유저아이디와 작성자 아이디 체크
		if(write_nickname.equals(user_nickname)){
			int deleteResult = freeboardService.condelete(request, response, freeboardVO.getNum());
			if(deleteResult == 1 || deleteResult == 2) {
				mav.setViewName("redirect:/freeBoard/freeBoardList");
			} else {
				String notice = "글 삭제에 실패 하였습니다.";
				common.noticeMethod(request, response, notice);
				mav.setViewName("member/Login");
			}
		} else {
			String notice = "본인이 작성한 글이 아닙니다.";
			common.noticeMethod(request, response, notice);
			mav.setViewName("member/Login");
		}
		
		return mav;
	}
	// 글쓰기 취소
	@RequestMapping(value = "writeCancle")
	public ModelAndView writeCancle() {
		mav.setViewName("redirect:/freeBoard/freeBoardList");
		return mav;
	}
}
