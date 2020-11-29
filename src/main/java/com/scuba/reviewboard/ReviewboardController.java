package com.scuba.reviewboard;

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
@RequestMapping("/reviewBoard/*")
public class ReviewboardController {
	
	@Autowired
	ReviewboardService reviewboardService;

	private ModelAndView mav = new ModelAndView();
	Common common = new Common();
	ReviewboardVO reviewboardCheckVO = new ReviewboardVO();

	// 후기 게시판 이동 , 후기 게시판 전체 리스트 조회
	@RequestMapping(value = "reviewBoardList")
	public ModelAndView reviewBoardList(HttpServletRequest request) {
		request.getSession().setAttribute("category", "review");
		// 후기게시판 전체 글 조회
		mav.addObject("reviewBoardList", reviewboardService.allBoardList());
		mav.setViewName("C_review/List");
		return mav;
		
	}

	// 후기 게시판 글 쓰기 이동
	@RequestMapping(value = "reviewBoardWrite")
	public ModelAndView reviewBoardWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user_id = (String)request.getSession().getAttribute("user_id");
		// 로그인 유무 확인
		if (user_id == null || user_id == "") {
			String notice = "로그인을 해주세요";
			common.noticeMethod(request, response, notice);
			mav.setViewName("member/Login");
		} else {
			mav.setViewName("C_review/Write");
		}
		return mav;
	}
	
	
	// 후기 게시판 글 등록
	@RequestMapping(value = "writeinsert", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView writeinsert(ReviewboardVO reviewboardVO, @RequestParam MultipartFile file,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HashMap<String, Object> resultMap = reviewboardService.writeinsert(reviewboardVO, file, request, response);
		
		int writeResult = (Integer) resultMap.get("writeResult");
		// 글 등록 성공시 (1:이미지o 2:이미지x)
		if (writeResult == 1 || writeResult == 2) {
			// 게시글 번호
			mav.addObject("num", resultMap.get("contentNum"));
			mav.setViewName("redirect:/reviewBoard/reviewBoardView");
		} else { // 글 등록 실패시
			String notice = "글 등록 실패";
			common.noticeMethod(request, response, notice);
			mav.setViewName("member/Login");
		}
		return mav;
	}

	// 상세보기 페이지 이동
	@RequestMapping(value = "reviewBoardView")
	public ModelAndView reviewBoardView(ReviewboardVO reviewboardVO) {
		mav.addObject("viewList", reviewboardService.viewList(reviewboardVO.getNum()));
		mav.setViewName("C_review/View");
		return mav;
	}
	
	//후기 게시판 글 수정 페이지 이동
	@RequestMapping(value = "reviewBoardModify")
	public ModelAndView reviewBoardModify(ReviewboardVO reviewboardVO, HttpServletRequest request, HttpServletResponse response) {
//		System.out.println(freeboardVO.getNum());
		request.getSession().setAttribute("category",reviewboardVO.getCommunityname());
		reviewboardCheckVO.setNum(reviewboardVO.getNum());
		mav.addObject("modifyList", reviewboardService.ModifyList(reviewboardVO.getNum()));
		
		mav.setViewName("C_review/Modify");
		return mav;
		}	
	
	// 글 수정 등록
	@RequestMapping(value = "Modifyinsert", method = RequestMethod.POST)
	public ModelAndView Modifyinsert(ReviewboardVO reviewboardVO, @RequestParam MultipartFile file, HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			int originalNum = reviewboardCheckVO.getNum();
			int nowNum = reviewboardVO.getNum();
			System.out.println("썸네일 임지 : " + reviewboardVO.getThumbnail());
			//뷰페이지 악의적인 조작 검증
			if(originalNum == nowNum) {
				// Service 글 수정
				HashMap<String, Object> resultMap = reviewboardService.Modify(reviewboardVO, file, request, response);
				// 글 수정 결과 리턴값
				int modifyResult = (Integer)resultMap.get("modifyResult");
				// 글 수정 성공시 (1:이미지o 2:이미지x)
				if(modifyResult == 1 || modifyResult == 2) {
					mav.addObject("num", resultMap.get("contentNum"));
					mav.setViewName("redirect:/reviewBoard/reviewBoardView");
				} else {
					String notice = "글 수정 실패";
					common.noticeMethod(request, response, notice);
					mav.setViewName("member/Login");
				}
			} else { // 사용자의 악의적인 조작이 있을 시
				String notice = "경고 : 잘못된 데이터 요청 (잘못된 접근입니다. 다시 시도 하여주십시오.)";
				common.noticeMethod(request, response, notice);
				mav.setViewName("member/Login");
			}
			return mav;
		}	
	
	// 글 삭제
	@RequestMapping(value = "reviewBoardDelete")
	public ModelAndView reviewBoardDelete(ReviewboardVO reviewboardVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user_nickname = (String)request.getSession().getAttribute("user_nickname");
		String write_nickname = reviewboardService.idCheck(reviewboardVO.getNum());
		//유저아이디와 작성자 아이디 체크
		if(write_nickname.equals(user_nickname)){ //게시글 삭제
			int deleteResult = reviewboardService.condelete(request, response, reviewboardVO.getNum());
			if(deleteResult == 1 || deleteResult == 2) {
				mav.setViewName("redirect:/reviewBoard/reviewBoardList");
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
		mav.setViewName("redirect:/reviewBoard/reviewBoardList");
		return mav;
	}		
		
	// 글수정 취소
	@RequestMapping(value = "modiFyCancle")
	public ModelAndView modiFyCancle(ReviewboardVO reviewboardVO, HttpServletRequest request, HttpServletResponse response) {
		//글 수정 취소 시 필요한 vo객체 들고옴
		reviewboardVO = reviewboardService.ModifyList(reviewboardVO.getNum());
		//글 수정 취소 서비스
		reviewboardService.modiFyCancle(reviewboardVO, request, response);
		mav.setViewName("redirect:/reviewBoard/reviewBoardList");
		return mav;
	}
	
}
