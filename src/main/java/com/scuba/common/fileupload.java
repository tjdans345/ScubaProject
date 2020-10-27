package com.scuba.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/fileUpload/*")
public class fileupload {

	private static final Logger logger = LoggerFactory.getLogger(fileupload.class);
	
	ModelAndView mav = new ModelAndView();
	//이미지 업로드
	@RequestMapping(value = "imgupload")
	public void freeboard(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception{
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		
		String fileName = upload.getOriginalFilename();
		
		byte[] bytes = upload.getBytes();
		String uploadPath = request.getSession().getServletContext().getRealPath("/WEB-INF/views/images/");
		OutputStream out = new FileOutputStream(new File(uploadPath + fileName));
		// 서버 업로드 
		// write메소드의 매개값으로 파일의 총 바이트를 매개값으로 줌
		String callback = request.getParameter("CKEditorFuncNum");
		
		// 서버 => 클라이언트로 텍스트 전송(자바스크립트 실행)
		PrintWriter printWriter = response.getWriter();
		String fileUrl = request.getContextPath()+ "/WEB-INF/views/images/"+ fileName;
		System.out.println("콜백"+callback);
		System.out.println("파일유알엘"+fileUrl);
		printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl + "','이미지가 업로드되었습니다.')" + "</script>" );
		
		
		printWriter.flush();
	}
	
}
