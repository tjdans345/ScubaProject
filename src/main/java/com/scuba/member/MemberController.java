package com.scuba.member;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	@Autowired
	private JavaMailSender mailSender;
	
	private ModelAndView modelAndView = new ModelAndView();
//	로그인페이지 이동
	@RequestMapping(value = "login")
	public ModelAndView login() {
		modelAndView.setViewName("member/Login");
		modelAndView.addObject("msg","");
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
		String msg ="";
		if(1 == memberService.idCheck(memberVO.getId())) {
			if(pwdchage(memberVO.getPwd()).equals(memberService.getPwd(memberVO.getId()))) {
				request.getSession().setAttribute("id",memberVO.getId());
				modelAndView.setViewName("redirect:/index.scu");
			}else {
				msg = "비밀번호가 틀렸습니다 .";
				modelAndView.setViewName("member/Login");
			}
		}else {
			msg ="아이디가 틀렸습니다 .";
			modelAndView.setViewName("member/Login");
		}
		modelAndView.addObject("msg",msg);
		return modelAndView;
	}
//아이디 중복확인
	@ResponseBody
	@RequestMapping(value = "idCheck" , method = RequestMethod.POST)
	public int idCheck(String id) throws Exception{
		int idCheck=0;
		if(1==memberService.idCheck(id)) {
			idCheck = 1; // 이미 존재하는 아이디
		}else {
			idCheck = 2; // 없는 아이디 
		}
		return idCheck ;
	}
//닉네임 체크
	@ResponseBody
	@RequestMapping(value = "nicknameCheck" , method = RequestMethod.POST)
	public int nicknameCheck(String nickname) throws Exception{
		int nicknameCheck=0;
		if(1==memberService.nicknameCheck(nickname)) {
			nicknameCheck = 1; // 이미 존재하는 닉네임
		}else {
			nicknameCheck = 2; // 없는 닉네임
		}
		return nicknameCheck ;
	}
//이메일 체크
	@ResponseBody
	@RequestMapping(value = "emailCheck" , method = RequestMethod.POST)
	public int emailCheck(String email) throws Exception{
		int emailCheck=0;
		if(1==memberService.emailCheck(email)) {
			emailCheck = 1; // 이미 존재하는 닉네임
		}else {
			emailCheck = 2; // 없는 닉네임
		}
		return emailCheck ;
	}
//이메일 체크
	@ResponseBody
	@RequestMapping(value = "emailSend", method = RequestMethod.POST)
	public int emailSend(String email) throws Exception {
		//인증번호 생성
		int random = (int)(Math.random()*1000000);
		if(random<100000) random += 100000;
		String title = "이메일 인증 메일입니다 . ";
		String content = "인증 번호는 "+ random + " 입니다.";
		sendMail(email, title, content);
		return random;
	}
	
//메일 보내기
	public void sendMail(String email , String title , String content) throws Exception{
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
		messageHelper.setFrom("scuba");
		messageHelper.setTo(email);
		messageHelper.setSubject(title);
		messageHelper.setText(content);
		mailSender.send(message);
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
