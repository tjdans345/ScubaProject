package com.scuba.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	//회원가입
	public void joinMember(MemberVO memberVO) {
		memberDAO.joinMember(memberVO);
	}
	//아이디 확인
	public int idCheck(String id) {
		return memberDAO.idCheck(id);
	}
	//비밀번호 가져오기
	public String getPwd(String id) {
		return memberDAO.getPwd(id);
	}
	//닉네임 확인
	public int nicknameCheck(String nickname) {
		return memberDAO.nicknameCheck(nickname);
	}
	//이메일 체크
	public int emailCheck(String email) {
		return memberDAO.emailCheck(email);
	}
	//아이디 찾기
	public String findId(String email) {
		return memberDAO.findId(email);
	}
	//이메일 가져오기
	public String findEmail(String id) {
		return memberDAO.findEmail(id);
	}
	//비밀번호 찾기 변경
	public void findPwdChage(MemberVO memberVO) {
		memberDAO.findPwdChage(memberVO);
	}
}
