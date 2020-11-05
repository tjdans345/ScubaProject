package com.scuba.freeboard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDAO {
	@Autowired
	private SqlSession sqlsession;

	// 자유게시판 모든(글)리스트 조회
	public List<FreeBoardVO> allBoardList() {
		return sqlsession.selectList("mapper.Freeboard.allBoardList");
	}

	// 글 작성
	public int write(FreeBoardVO freeboardVO) {
		int insertResult = sqlsession.insert("mapper.Freeboard.write", freeboardVO);

		return insertResult;
	}

	// 최신 게시글 +1 번호 조회
	public int getMaxNextNum() {
		return sqlsession.selectOne("mapper.Freeboard.getMaxNextNum");
	}

}
