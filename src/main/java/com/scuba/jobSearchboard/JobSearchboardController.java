package com.scuba.jobSearchboard;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.scuba.common.Common;

@Controller
@RequestMapping("/jobSearchBoard/*")
public class JobSearchboardController {
	
	@Autowired
	JobSearchboardService jobsearchboardService;
	
	ModelAndView mav = new ModelAndView();
	Common common = new Common();
	JobSearchboardVO jobsearchboardVO = new JobSearchboardVO();
	
	//구인 구직 게시판 이동
	@RequestMapping(value = "jobSearchBoardList")
	public ModelAndView jobSearchBoardList(HttpServletRequest request) {
		request.getSession().setAttribute("category", "jobSearch");
		// 후기게시판 전체 글 조회
		mav.addObject("jobSearchBoardList", jobsearchboardService.allBoardList());
		mav.setViewName("C_jobSearch/List");
		return mav;
		
	}
	//구인 구직 게시판 글 쓰기 페이지 이동
	@RequestMapping(value = "JobSearchWrite")
	public ModelAndView JobSearchWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user_id = (String)request.getSession().getAttribute("user_id");
		
		//비로그인 시 로그인 페이지로 이동시킴
		if(user_id == "" || user_id == null) {
			String notice = "로그인을 해주세요";
			common.noticeMethod(request, response, notice);
			mav.setViewName("member/Login");
		} else {
			mav.setViewName("C_jobSearch/Write");
		}
		return mav;
	}
	
	//구인 구직 게시판 글 등록
	@RequestMapping(value = "WriteInsert", method = RequestMethod.POST)
	public ModelAndView WriteInsert(JobSearchboardVO jobsearchboardVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(jobsearchboardVO.getCommunityname());
		System.out.println(jobsearchboardVO.getContent());
		System.out.println(jobsearchboardVO.getJobcategory());
		System.out.println(jobsearchboardVO.getTitle());
		
		HashMap<String, Object> resultMap = jobsearchboardService.WriteInsert(jobsearchboardVO,request, response);
		int writeResult = (Integer) resultMap.get("writeResult");
		// 글 등록 성공시 (1:이미지o 2:이미지x)
		if (writeResult == 1 || writeResult == 2) {
			// 게시글 번호
			mav.addObject("num", resultMap.get("contentNum"));
			mav.setViewName("redirect:/jobSearchBoard/jobSearchBoardView");
		} else { // 글 등록 실패시
			String notice = "글 등록 실패";
			common.noticeMethod(request, response, notice);
			mav.setViewName("member/Login");
		}
		return mav;
	}
	
	
}
