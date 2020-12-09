package com.scuba.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSession sqlsession;
	
	//댓글 리스트 출력
	public List<ReplyVO> replyList(ReplyVO replyVO) {
		System.out.println("리스트 1 : " + sqlsession.selectList("mapper.Reply.replyList", replyVO));
		return sqlsession.selectList("mapper.Reply.replyList", replyVO);
	}
	
	//대댓글 리스트 출력
	public List<ReplyVO> replyList2(ReplyVO replyVO) {
		System.out.println("리스트 2 : " + sqlsession.selectList("mapper.Reply.replyList2", replyVO));
		return sqlsession.selectList("mapper.Reply.replyList2", replyVO);
	}

	//댓글 등록
	public int replywrite(ReplyVO replyVO) {
		return sqlsession.insert("mapper.Reply.replywrite", replyVO);
	}

	
}
