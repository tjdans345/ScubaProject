package com.scuba.common;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.scuba.freeboard.FreeBoardController;

@Controller
@RequestMapping("/Common/*")
public class Common {

	private static final Logger logger = LoggerFactory.getLogger(Common.class);
	FreeBoardController free = new FreeBoardController();
	ModelAndView mav = new ModelAndView();
	
	//이미지 업로드(에디터 글 작성)
	@RequestMapping(value = "imgupload")
	public void imgupload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		
		//test용
		request.getSession().setAttribute("id", "test3");
		//임시폴더 이름(아이디)
		String id = (String)request.getSession().getAttribute("id");
		
		//이미지 이름 얻어오기(실제이름)
		String fileOriginalName = upload.getOriginalFilename();
		System.out.println(fileOriginalName);
		//파일 확장자 얻기
		String ext = fileOriginalName.substring(fileOriginalName.lastIndexOf("."));
		//이미지 이름 UUID사용 후 수정
		UUID uuid = UUID.randomUUID();
		//업로드 될 파일 이름
		String fileSaveName = uuid.toString() + ext;
		//임시파일업로드 서버경로를 설정해줌
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/Temporary/"+ id);
		//유저 아이디로로 임시폴더를 만들어줌
		File makeFolder = new File(uploadPath);
		if(!makeFolder.exists()) {
			makeFolder.mkdir();
		}
		//해당경로에 파일을 업로드함
		File file = new File(uploadPath, fileSaveName);
		upload.transferTo(file);
		PrintWriter printWriter = response.getWriter();
		// 서버 업로드 
		// write메소드의 매개값으로 파일의 총 바이트를 매개값으로 줌
		String callback = request.getParameter("CKEditorFuncNum");
		// 서버 => 클라이언트로 텍스트 전송(자바스크립트 실행)
		String fileUrl = request.getContextPath()+"/resources/images/Temporary/"+ request.getSession().getAttribute("id")+"/"+fileSaveName;
		System.out.println("콜백"+callback);
		System.out.println("파일유알엘"+fileUrl);
		printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl + "','이미지가 업로드되었습니다.')" + "</script>" );
		printWriter.flush();
	}
	
	//글 작성 완료시 임시폴더 -> 서버폴더로 파일 이동 (실제 에디터에 삽입되어진 파일(이미지만 실제 서버 폴더로 전송))
	public int imguploadServer(HttpServletRequest request, HttpServletResponse  response, ArrayList<String> realimglist) {
		//result : 파일 이동 및 임시폴더 삭제완료시 반환 값 , dfm : 파일이동 유무 확인, dfr : 디렉토리 파일 삭제 유무 확인
		//result = 0:실패 / 1:성공
		int result = 0 , dfr = 0, dfm =0;
		//세션영역에서 유저아이디 얻어옴 (for 임시폴더 path설정)
		String id = (String)request.getSession().getAttribute("id");
		//커뮤니티 카테고리
		String category = (String) request.getSession().getAttribute("category");
		//임시 글번호 추후 DB 글번호
		String conNum = "8";
		//임시파일 경로
		String tempPath = request.getSession().getServletContext().getRealPath("/resources/images/Temporary/"+ id);
		//서버파일업로드 경로를 설정 (실제 저장 폴더)
		String serverUploadPath = request.getSession().getServletContext().getRealPath("/resources/images/"+category+"/"+conNum);
		//파일 이동
		File serverFolder = new File(serverUploadPath);
		//글번호로 서버 저장 폴더 생성
		if(!serverFolder.exists()) {
			serverFolder.mkdir();
		}
		//파일 이동 임시폴더 -> 서버 저장 폴더
		for(int i=0; i<realimglist.size(); i++) {
			Path beforefilePath = Paths.get(tempPath+"/"+realimglist.get(i));
			Path afterfilePath = Paths.get(serverUploadPath+"/"+realimglist.get(i));
			try {
				//파일 이동
				Files.move(beforefilePath, afterfilePath);
				dfm = 1;
			} catch (Exception e) {
				System.out.println("파일 이동 오류 (임시->서버)");
				result = 0;
			}
			System.out.println("before :" + beforefilePath);
			System.out.println("after :" + afterfilePath);
		}
		//삭제 디렉토리,파일 경로
		File deleteFile = new File(tempPath);
		if(dfm == 1) {
			//임시 디렉토리 파일 전부 삭제
			File[] tempfiles = deleteFile.listFiles();
			if(tempfiles.length == 0) {
				dfr =1;
			} else {
				//삭제 for문
				for(File tempfile : tempfiles) {
					tempfile.delete();
					if(!tempfile.isFile()) {
						dfr =1;
					} else {
						result = 0;
					}
				}
			}
			//디렉토리 삭제
			if(dfr == 1) {
				if(deleteFile.exists()) {
					if(deleteFile.delete()) {
						System.out.println("임시 폴더 삭제 완료");
						result = 1;
					} else {
						System.out.println("임시 폴더 삭제 실패");
						result = 0;
					}
				}
			}
		}
		/* renameTo의 문제점 덮어쓰기가 안된다 -> 옮기기 이전에 사용하지않을 파일을 삭제해주고<파일리스트 뽑아와서 , 실제 사용파일명과 비교 후? 다시 list에 담기 ?>
		 * 실제 사용 파일(파일명을 이용해)만 디렉토리 통째로 옮기면 됨
		 *  */
//		//파일 이동 (임시 폴더 -> 저장 폴더)
//		File file = new File(tempPath);
//		for(int i=0; i<realimglist.size(); i++) {
//			System.out.println("포리얼 포임지 :" + file);
//			String filepath = serverUploadPath+"/"+conNum;
//			System.out.println("파일경로88888 :" + filepath);
//			System.out.println("파일이동 : " + i + filepath);
//			if(file.renameTo(new File(filepath))) {
//				System.out.println("이동 성공");
//			} else {
//				System.out.println("이동 실패");
//				break;
//			 }
//			} * 임시폴더를 폴더 이동시켰을때 (실제서버로) 삭제시켜줄건지? 주기적으로 시간설정해놓고 지워 줄건지? *
			return result;
		}
		
		
	
}
