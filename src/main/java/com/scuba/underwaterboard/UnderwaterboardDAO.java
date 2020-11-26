package com.scuba.underwaterboard;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UnderwaterboardDAO {
	@Autowired
	private SqlSession sqlsession;
	
	//최신 게시글 번호 조회
	public int getMaxNum() {
		
		return sqlsession.selectOne("mapper.UnderWaterboard.getMaxNum");
	}
	
	//글 작성(등록)
	public int write(UnderwaterboardVO underwaterboardVO) {
		
		int insertResult = sqlsession.insert("mapper.UnderWaterboard.write", underwaterboardVO);
		return insertResult;
	}
	
	//이미지 경로 변경
	public int contentChange(HashMap<String, Object> map) {
		return sqlsession.update("mapper.UnderWaterboard.contentChange", map);
	}
	
	//글 상세보기
	public UnderwaterboardVO viewList(int contentNum) {
		return sqlsession.selectOne("mapper.UnderWaterboard.viewList", contentNum);
	}
	
	//수중 게시판 모든(글)리스트 조회 
	public List<UnderwaterboardVO> allBoardList() {
		return sqlsession.selectList("mapper.UnderWaterboard.allBoardList");
	}
	
	
	
	
	
}
