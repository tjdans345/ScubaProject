package com.scuba.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	//회원가입
	public void joinMember(MemberVO memberVO) {
		sqlSession.insert("mapper.member.joinMember",memberVO);
	}
	//아이디 확인
	public int idCheck(String id) {
		return sqlSession.selectOne("mapper.member.idCheck",id);
	}
	//비밀번호 가져오기
	public String getPwd(String id) {
		return sqlSession.selectOne("mapper.member.getPwd",id);
	}
	//닉네임 확인
	public int nicknameCheck(String nickname) {
		return sqlSession.selectOne("mapper.member.nicknameCheck",nickname);
	}
	//이메일 체크
	public int emailCheck(String email) {
		return sqlSession.selectOne("mapper.member.emailCheck",email);
	}
	//아이디 찾기
	public String findId(String email) {
		return sqlSession.selectOne("mapper.member.findId",email);
	}
	//이메일 확인하기
	public String findEmail(String id) {
		return sqlSession.selectOne("mapper.member.findEmail",id);
	}
	//비밀번호 찾기 변경
	public void findPwdChage(MemberVO memberVO) {
		sqlSession.selectOne("mapper.member.findPwdChage",memberVO);
	}
}
