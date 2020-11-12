package com.scuba.member;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	//유저 정보 가져오기
	public MemberVO getuserinfo(String id) {
		return memberDAO.getuserinfo(id);
	}
	//유저 정보 수정시 닉네임 체크
	public int userUpdatenicknameCheck(String nickname , String id) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("nickname",nickname);
		map.put("id",id);
		return memberDAO.userUpdatenicknameCheck(map);
	}
	//회원정보 수정
	public void memberChange (MultipartHttpServletRequest multipartHttpServletRequest , HttpSession session) throws Exception{
		String id = multipartHttpServletRequest.getParameter("id");
		String nickname = multipartHttpServletRequest.getParameter("nickname");
		String image = "basic.png";
		if(multipartHttpServletRequest.getFile("image").getOriginalFilename()!="") {
		MultipartFile file = multipartHttpServletRequest.getFile("image");
		String url = session.getServletContext().getRealPath("/resources/upload/member/");
		image = memberDAO.FileUpload(file, url);
		String beforimage = multipartHttpServletRequest.getParameter("beforimage");
		if(!beforimage.equals("basic.png")) {
			//이전 이미지 삭제
			File delfile = new File(url + beforimage);
			delfile.delete();
		}
		}
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("id",id);
		map.put("nickname",nickname);
		map.put("image",image);
		memberDAO.memberChange(map);
		
	}
}
