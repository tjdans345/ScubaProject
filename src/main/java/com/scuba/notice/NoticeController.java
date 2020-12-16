package com.scuba.notice;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.scuba.common.Common;

@RequestMapping(value = "/Notice/*")
@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	private ModelAndView modelAndView = new ModelAndView();
	Common common = new Common();

	//공지사항 리스트 이동
	@RequestMapping(value = "moveNoticeList")
	public ModelAndView moveNoticeList(HttpServletRequest request,
									   @RequestParam(defaultValue = "") String search,
									   @RequestParam(defaultValue = "1") int nowpage) {
		request.getSession().setAttribute("category", "notice");
		modelAndView.addObject("map",noticeService.getNoticeList(search, nowpage));
		modelAndView.setViewName("N_notice/List");
		return modelAndView;
	}
	
	//공지사항 글쓰기 이동
	@RequestMapping(value = "moveWrite")
	public ModelAndView moveWrite(HttpServletRequest request) {
		request.getSession().setAttribute("category", "notice");
		modelAndView.setViewName("N_notice/Write");
		return modelAndView;
	}
	
	// 글 등록
	@RequestMapping(value = "writeinsert", method = RequestMethod.POST)
	public ModelAndView writeinsert(NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// Service 글 등록
		HashMap<String, Object> resultMap = noticeService.write(noticeVO, request, response);
		int writeResult = (Integer) resultMap.get("writeResult");
		// 글 등록 성공시 (1:이미지o 2:이미지x)
		if (writeResult == 1 || writeResult == 2) {
			// 게시글 번호
			modelAndView.addObject("num", resultMap.get("contentNum"));
			modelAndView.setViewName("redirect:/Notice/moveNoticeView");
		} else { // 글 등록 실패시
			String notice = "글 등록 실패";
			common.noticeMethod(request, response, notice);
			modelAndView.setViewName("member/Login");
		}
		return modelAndView;
	}
	
	//리조트 글 상세보기
	@RequestMapping(value = "moveNoticeView")
	public ModelAndView moveNoticeView(int num) {
		modelAndView.addObject("noticeVO", noticeService.getNoticeInfo(num));
		modelAndView.setViewName("N_notice/View");
		return modelAndView;
	}
}
