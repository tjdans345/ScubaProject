package com.scuba.freeboard;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDAO {
	@Autowired
	private SqlSession sqlsession;
	
	// 자유게시판 모든(글)리스트 조회
	public List<FreeBoardVO> allBoardList(HashMap<String, Object> map) {
		return sqlsession.selectList("mapper.Freeboard.allBoardList", map);
	}

	// 글 작성
	public int write(FreeBoardVO freeboardVO) {
		int insertResult = sqlsession.insert("mapper.Freeboard.write", freeboardVO);
		return insertResult;
	}
	
	//이미지 경로 변경
	public int contentChange(HashMap<String, Object> map) {
		return sqlsession.update("mapper.Freeboard.contentChange", map);
	}
	
	// 최신 게시글  번호 조회
	public int getMaxNum() {
		return sqlsession.selectOne("mapper.Freeboard.getMaxNum");
	}

	//글 상세보기
	public FreeBoardVO viewList(int contentNum) {
		return sqlsession.selectOne("mapper.Freeboard.viewList", contentNum);
	}
	
	//게시글 삭제
	public int condelete(int contentNum) {
		return sqlsession.delete("mapper.Freeboard.condelete", contentNum);
	}
	
	//게시글 삭제 시 닉네임 일치여부 체크
	public String idCheck(int contentNum) {
		return sqlsession.selectOne("mapper.Freeboard.idCheck", contentNum);
	}
	
	//게시글 수정페이지 이동
	public FreeBoardVO ModifyList(int contentNum) {
		return sqlsession.selectOne("mapper.Freeboard.ModifyList", contentNum);
	}
	
	//게시글 수정
	public int Modify(FreeBoardVO freeBoardVO) {
		return sqlsession.update("mapper.Freeboard.Modify", freeBoardVO);
	}

	//정렬순 리스트
	public List<FreeBoardVO> SortList(HashMap<String, Object> map) {
		return sqlsession.selectList("mapper.Freeboard.SortList", map);
	}

	//리스트 토탈 구하기
	public int getTotal(String search) {
		return sqlsession.selectOne("mapper.Freeboard.getTotal", search);
	}

	//좋아요 유무 확인
	public int likeCheck(String user_id, FreeBoardVO freeboardVO) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", user_id);
		map.put("communityname", freeboardVO.getCommunityname());
		map.put("contentnum", freeboardVO.getNum());
		return sqlsession.selectOne("mapper.Freeboard.likeCheck", map);
		
	}

	//좋아요 수 증가
	public void likeup(FreeBoardVO freeboardVO) {
		sqlsession.update("mapper.Freeboard.likeup", freeboardVO);
		
	}
	
	//좋아요 수 감소
	public void likedown(FreeBoardVO freeboardVO) {
		sqlsession.update("mapper.Freeboard.likedown", freeboardVO);
	}

	//좋아요 테이블 해당 데이터 인서트
	public void likeinsert(String user_id, FreeBoardVO freeboardVO) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", user_id);
		map.put("communityname", freeboardVO.getCommunityname());
		map.put("contentnum", freeboardVO.getNum());
		sqlsession.insert("mapper.Freeboard.likeinsert", map);
	}

	//좋아요 테이블 해당 데이터 딜리트
	public void likedelete(String user_id, FreeBoardVO freeboardVO) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", user_id);
		map.put("communityname", freeboardVO.getCommunityname());
		map.put("contentnum", freeboardVO.getNum());
		sqlsession.delete("mapper.Freeboard.likedelete", map);
	}

	//뷰 카운트 증가
	public void updateViewCount(FreeBoardVO freeboardVO) {
		sqlsession.update("mapper.Freeboard.updateViewCount", freeboardVO);
	}




}
