package com.scuba.reply;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {
	
	@Autowired
	ReplyService replyservice;

	ModelAndView mav = new ModelAndView();
	
	//댓글 등록
	@RequestMapping(value = "replywrite", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> replywrite(ReplyVO replyVO, HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String user_id = (String)request.getSession().getAttribute("user_id");
		//로그인 유무 체크
		if(user_id == null) {
			map.put("loginstatus", "No");
			return map;
		}
		//커뮤니티 네임설정
		replyVO.setCommunityname((String)request.getSession().getAttribute("category"));
		//닉네임 설정
		replyVO.setNickname((String)request.getSession().getAttribute("user_nickname"));
		//댓글 타입 설정
		replyVO.setReplytype(0);
		//댓글 등록
		replyservice.replywrite(replyVO);
		//댓글 리스트 반환
		map.put("replyList", replyservice.replyList(replyVO));
		map.put("rereplyList", replyservice.replyList2(replyVO));
		return map;
	}
	
	//대댓글 등록
	@RequestMapping(value = "rereplywrite", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> rereplywrite(ReplyVO replyVO, HttpServletRequest request, HttpServletResponse response) throws IOException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String user_id = (String)request.getSession().getAttribute("user_id");
		//로그인 유무 체크
		if(user_id == null) {
			map.put("loginstatus", "No");
			return map;
		}
		//커뮤니티 네임설정
		replyVO.setCommunityname((String)request.getSession().getAttribute("category"));
		//닉네임 설정
		replyVO.setNickname((String)request.getSession().getAttribute("user_nickname"));
		//댓글 타입 설정
		replyVO.setReplytype(1);
		//댓글 등록
		replyservice.rereplywrite(replyVO);
		//댓글 리스트 반환
		
		map.put("replyList", replyservice.replyList(replyVO));
		map.put("rereplyList", replyservice.replyList2(replyVO));
		return map;
	}
	
	//댓글 등록
	@RequestMapping(value = "replymodify", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> replymodify(ReplyVO replyVO, HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//커뮤니티 네임설정
		replyVO.setCommunityname((String)request.getSession().getAttribute("category"));
		//닉네임 설정
		replyVO.setNickname((String)request.getSession().getAttribute("user_nickname"));
		//댓글 타입 설정
		replyVO.setReplytype(0);
		//댓글 등록
		replyservice.replymodify(replyVO);
		//댓글 리스트 반환
		map.put("replyList", replyservice.replyList(replyVO));
		map.put("rereplyList", replyservice.replyList2(replyVO));
		return map;
	}	
	
	//댓글 리스트
	@RequestMapping(value = "replyList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> replyList(ReplyVO replyVO, HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//커뮤니티 네임설정
		replyVO.setCommunityname((String)request.getSession().getAttribute("category"));
		//닉네임 설정
		replyVO.setNickname((String)request.getSession().getAttribute("user_nickname"));
		//댓글 리스트 반환
		map.put("replyList", replyservice.replyList(replyVO));
		map.put("rereplyList", replyservice.replyList2(replyVO));
		return map;
	}		
	
	
	
	
	
	
	
	
	
	
	
}
