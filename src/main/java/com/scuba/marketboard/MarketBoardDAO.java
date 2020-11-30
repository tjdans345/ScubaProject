package com.scuba.marketboard;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scuba.jobSearchboard.JobSearchboardVO;

@Repository
public class MarketBoardDAO {

	@Autowired
	private SqlSession sqlsession;

	// 글 작성
	public int write(MarketBoardVO marketboardVO) {
		int insertResult = sqlsession.insert("mapper.Marketboard.write", marketboardVO);
		return insertResult;
	}

	// 최신 게시글 번호 조회
	public int getMaxNum() {
		int insertResult = sqlsession.selectOne("mapper.Marketboard.getMaxNum");
		return insertResult;
	}

	// 이미지 경로 변경
	public int contentChange(HashMap<String, Object> map) {
		return sqlsession.update("mapper.Marketboard.contentChange", map);
	}

	//글 상세보기
	public MarketBoardVO viewList(int contentNum) {
		return sqlsession.selectOne("mapper.Marketboard.viewList", contentNum);
	}

	// 구인/구직 게시판 모든(글) 리스트 조회
	public List<MarketBoardVO> allBoardList() {
		return sqlsession.selectList("mapper.Marketboard.allBoardList");
	}

}
