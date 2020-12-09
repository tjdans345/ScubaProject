package com.scuba.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyService {

	@Autowired
	private ReplyDAO replyDAO;
	
	//댓글 리스트
	public List<ReplyVO> replyList(ReplyVO replyVO) {
		return replyDAO.replyList(replyVO);
	}
	
	//대댓글 리스트
		public List<ReplyVO> replyList2(ReplyVO replyVO) {
			return replyDAO.replyList2(replyVO);
		}
	
	//댓글 등록
	public void replywrite(ReplyVO replyVO) {
		replyDAO.replywrite(replyVO);
		
	}
	
	
}