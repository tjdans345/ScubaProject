package com.scuba.reply;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
		//커뮤니티 네임설정
		replyVO.setCommunityname((String)request.getSession().getAttribute("category"));
		//닉네임 설정
		replyVO.setNickname((String)request.getSession().getAttribute("user_nickname"));
		//댓글 타입 설정
		replyVO.setReplytype(0);
		//댓글 등록
		replyservice.replywrite(replyVO);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("replyList", replyservice.replyList(replyVO));
		map.put("rereplyList", replyservice.replyList2(replyVO));
		
		
		return map;
		
		
	}
}
