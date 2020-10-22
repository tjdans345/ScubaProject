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
}
