package com.scuba.reviewboard;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scuba.freeboard.FreeBoardVO;

@Repository
public class ReviewboardDAO {
	
	@Autowired
	private SqlSession sqlsession;

	// 최신 게시글 번호 조회
	public int getMaxNum() {

		return sqlsession.selectOne("mapper.Reviewboard.getMaxNum");
	}

	// 글 작성(등록)
	public int write(ReviewboardVO reviewboardVO) {

		int insertResult = sqlsession.insert("mapper.Reviewboard.write", reviewboardVO);
		return insertResult;
	}

	// 이미지 경로 변경
	public int contentChange(HashMap<String, Object> map) {
		return sqlsession.update("mapper.Reviewboard.contentChange", map);
	}
	
	// 글 상세보기
	public ReviewboardVO viewList(int contentNum) {
		return sqlsession.selectOne("mapper.Reviewboard.viewList", contentNum);
	}

	// 후기 게시판 모든(글)리스트 조회
	public List<ReviewboardVO> allBoardList(HashMap<String, Object> map) {
		return sqlsession.selectList("mapper.Reviewboard.allBoardList", map);
	}

	// 글 수정 페이지 이동
	public ReviewboardVO ModifyList(int contentnum) {
		return sqlsession.selectOne("mapper.Reviewboard.ModifyList", contentnum);
	}

	// 게시글 수정
	public int Modify(ReviewboardVO reviewboardVO) {
		return sqlsession.update("mapper.Reviewboard.Modify", reviewboardVO);
	}

	// 게시글 삭제 시 닉네임 일치여부 체크
	public String idCheck(int contentNum) {
		return sqlsession.selectOne("mapper.Reviewboard.idCheck", contentNum);
	}
	
	// 게시글 삭제
	public int condelete(int contentNum) {
		return sqlsession.delete("mapper.Reviewboard.condelete", contentNum);
	}
	
	//게시글 총 개수 구하기
	public int getTotal(String search, String consort) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("consort", consort);
		return sqlsession.selectOne("mapper.Reviewboard.getTotal", map);
	}

	//정렬순 게시 글 조회
	public List<ReviewboardVO> SortList(HashMap<String, Object> map) {
		return sqlsession.selectList("mapper.Reviewboard.SortList", map);
	}

	//인기 글 리스트
	public List<ReviewboardVO> bestList() {
		return sqlsession.selectList("mapper.Reviewboard.bestList");
	}

	//좋아요 유무 확인
	public int likeCheck(String user_id, ReviewboardVO reviewboardVO) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", user_id);
		map.put("communityname", reviewboardVO.getCommunityname());
		map.put("contentnum", reviewboardVO.getNum());
		return sqlsession.selectOne("mapper.Reviewboard.likeCheck", map);
		
	}	
	
	//좋아요 수 증가
	public void likeup(ReviewboardVO reviewboardVO) {
		sqlsession.update("mapper.Reviewboard.likeup", reviewboardVO);
		
	}
	
	//좋아요 수 감소
	public void likedown(ReviewboardVO reviewboardVO) {
		sqlsession.update("mapper.Reviewboard.likedown", reviewboardVO);
	}

	//좋아요 테이블 해당 데이터 인서트
	public void likeinsert(String user_id, ReviewboardVO reviewboardVO) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", user_id);
		map.put("communityname", reviewboardVO.getCommunityname());
		map.put("contentnum", reviewboardVO.getNum());
		sqlsession.insert("mapper.Reviewboard.likeinsert", map);
	}

	//좋아요 테이블 해당 데이터 딜리트
	public void likedelete(String user_id, ReviewboardVO reviewboardVO) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", user_id);
		map.put("communityname", reviewboardVO.getCommunityname());
		map.put("contentnum", reviewboardVO.getNum());
		sqlsession.delete("mapper.Reviewboard.likedelete", map);
	}	
	
	//뷰 카운트 증가
	public void updateViewCount(ReviewboardVO reviewboardVO) {
		sqlsession.update("mapper.Reviewboard.updateViewCount", reviewboardVO);
	}	
	
}
