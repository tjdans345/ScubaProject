package com.scuba.jobSearchboard;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scuba.reviewboard.ReviewboardVO;

@Repository
public class JobSearchboardDAO {

	@Autowired
	SqlSession sqlsession;
	
	// 구인/구직 게시판 모든(글) 리스트 조회
	public List<ReviewboardVO> allBoardList() {
		return sqlsession.selectList("mapper.JobSearchboard.allBoardList");
	}

	// 글 작성
	public int write(JobSearchboardVO jobsearchboardVO) {
		int insertResult = sqlsession.insert("mapper.JobSearchboard.write", jobsearchboardVO);
		return insertResult;
	}

	// 최신 게시글 번호 조회
	public int getMaxNum() {
		int insertResult = sqlsession.selectOne("mapper.JobSearchboard.getMaxNum");
		System.out.println("인서트 리조트 : " + insertResult);
		return insertResult;
	}

	// 이미지 경로 변경
	public int contentChange(HashMap<String, Object> map) {
		return sqlsession.update("mapper.JobSearchboard.contentChange", map);
	}


}
