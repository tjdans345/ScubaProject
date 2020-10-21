package com.scuba.member;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	private ModelAndView modelAndView = new ModelAndView();
//	로그인페이지 이동
	@RequestMapping(value = "login")
	public ModelAndView login() {
		modelAndView.setViewName("member/Login");
		return modelAndView;
	}
//	비밀번호찾기 이동
	@RequestMapping(value = "findUser")
	public ModelAndView findUser() {
		modelAndView.setViewName("member/FindUser");
		return modelAndView;
	}
//	회원가입 이동
	@RequestMapping(value = "signUp")
	public ModelAndView signUp() {
		modelAndView.setViewName("member/SignUp");
		return modelAndView;
	}
//회원가입
//인덱스 수정시 수정요함
	@RequestMapping(value = "userjoin" , method = RequestMethod.POST)
	public ModelAndView userjoin(MemberVO memberVO,
								HttpServletRequest request) throws Exception {
		memberVO.setPwd(pwdchage(memberVO.getPwd()));
		memberService.joinMember(memberVO);
		request.getSession().setAttribute("id",memberVO.getId());
		modelAndView.setViewName("redirect:/index.scu");
		return modelAndView;
	}
//로그인
	@RequestMapping(value = "userLogin" , method = RequestMethod.POST)
	public ModelAndView userLogin(MemberVO memberVO
						,HttpServletRequest request
						,HttpServletResponse response) throws Exception {
		String msg="";
		if(1 == memberService.idCheck(memberVO.getId())) {
			if(pwdchage(memberVO.getPwd()).equals(memberService.getPwd(memberVO.getId()))) {
				request.getSession().setAttribute("id",memberVO.getId());
				modelAndView.setViewName("redirect:/index.scu");
			}else {
				msg = "비밀번호가 일치하지 않습니다 .";
				modelAndView.setViewName("member/Login");
			}
		}else {
			msg ="아이디가 일치하지 않습니다 .";
			modelAndView.setViewName("member/Login");
		}
		modelAndView.addObject("msg",msg);
		return modelAndView;
	}
//비밀번호 보안
    public String pwdchage(String plainText) throws Exception {
    	String Alg = "AES/CBC/PKCS5Padding";
    	String PK = "012123453456731234890123451234012";
    	String IV = PK.substring(0,16);
        Cipher cipher = Cipher.getInstance(Alg);
        SecretKeySpec keySpec = new SecretKeySpec(IV.getBytes(), "AES");
        IvParameterSpec ivParamSpec = new IvParameterSpec(IV.getBytes());
        cipher.init(Cipher.ENCRYPT_MODE, keySpec, ivParamSpec);
        
        byte[] encrypted = cipher.doFinal(plainText.getBytes("UTF-8"));
        return Base64.getEncoder().encodeToString(encrypted);
    }
}
