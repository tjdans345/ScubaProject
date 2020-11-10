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

@Controller
@RequestMapping("/Common/*")
public class Common {

	private static final Logger logger = LoggerFactory.getLogger(Common.class);
	ModelAndView mav = new ModelAndView();

	// 경고창 띄어주기
	public void noticeMethod(HttpServletRequest request, HttpServletResponse response, String notice) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('" + notice + "');</script>");
		out.flush();
	}

	//이미지 업로드(에디터 글 작성)
	@RequestMapping(value = "imgupload")
	public void imgupload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload)
			throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		// test용
		request.getSession().setAttribute("user_id", "test3");
		// 임시폴더 이름(아이디)
		String id = (String) request.getSession().getAttribute("user_id");
		// 이미지 이름 얻어오기(실제이름)
		String fileOriginalName = upload.getOriginalFilename();
		System.out.println("업로드 겟사이즈 : "+upload.getSize()); 
		System.out.println("컨텐트타입 : "+upload.getContentType()); 
		
		// 파일 확장자 얻기
		String ext = fileOriginalName.substring(fileOriginalName.lastIndexOf("."));
		//파일 확자자명 체크
		if(!(".gif".equalsIgnoreCase(ext) || ".jpg".equalsIgnoreCase(ext) || ".png".equalsIgnoreCase(ext))) {
			printWriter.println 	("<script> alert('파일 형식을 확인해주세요  gif, jpg, png만 가능합니다!!!'); CKEDITOR.dialog.getCurrent().hide(); </script>");
			printWriter.flush();
		}else { 
			//파일 크기 제한 (xml 설정외에도 코드로 제한해놨음)
			if(upload.getSize() > 5*1024*1024) {
				printWriter.println 	("<script> alert('업로드 파일 크기 초과입니다. \\\\n \\\\n 5MB 이하의 파일만 업로드 가능합니다'); </script>");
				printWriter.flush();
			}else {
				//정해진 파일 형식으로 올렸을 때
				// 이미지 이름 UUID사용 후 수정
				UUID uuid = UUID.randomUUID();
				// 업로드 될 파일 이름
				String fileSaveName = uuid.toString() + ext;
				// 임시파일업로드 서버경로를 설정해줌
				String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/Temporary/" + id);
				// 유저 아이디로로 임시폴더를 만들어줌
				File makeFolder = new File(uploadPath);
				if (!makeFolder.exists()) {
					makeFolder.mkdir();
				}
				// 해당경로에 파일을 업로드함
				File file = new File(uploadPath, fileSaveName);
				upload.transferTo(file);
				// 서버 업로드
				// write메소드의 매개값으로 파일의 총 바이트를 매개값으로 줌
				String callback = request.getParameter("CKEditorFuncNum");
				// 서버 => 클라이언트로 텍스트 전송(자바스크립트 실행)
				String fileUrl = request.getContextPath() + "/resources/images/Temporary/" + id + "/" + fileSaveName;
				printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl
						+ "','이미지가 업로드되었습니다.')" + "</script>");
				printWriter.flush();
			}
		}
	}

	// 글 작성 완료시 임시폴더 -> 서버폴더로 파일 이동 (실제 에디터에 삽입되어진 파일(이미지만 실제 서버 폴더로 전송))
	public int imguploadServer(HttpServletRequest request, HttpServletResponse response, ArrayList<String> realimglist,String category, String folderNum) {
		// result : 파일 이동 및 임시폴더 삭제완료시 반환 값 , dfm : 파일이동 유무 확인, dfr : 디렉토리 파일 삭제 유무 확인
		// result = 0:실패 / 1:성공
		int result = 0, dfr = 0, dfm = 0;
		// 세션영역에서 유저아이디 얻어옴 (for 임시폴더 path설정)
		String id = (String) request.getSession().getAttribute("user_id");
		// DB글 번호 (서버에 저장 될 폴더이름)
		String serverFolderName = folderNum;
		// 임시파일 경로
		String tempPath = request.getSession().getServletContext().getRealPath("/resources/images/Temporary/" + id);
		// 서버파일업로드 경로(실제 저장 폴더)
		String serverUploadPath = request.getSession().getServletContext().getRealPath("/resources/images/" + category + "/" + serverFolderName);
		// 파일 이동
		File serverFolder = new File(serverUploadPath);
		// 글번호로 서버 저장 폴더 생성
		if (!serverFolder.exists()) {
			serverFolder.mkdir();
		}
		// 파일 이동 (임시폴더 -> 서버 저장 폴더)
		for (int i = 0; i < realimglist.size(); i++) {
			Path beforefilePath = Paths.get(tempPath + "/" + realimglist.get(i));
			Path afterfilePath = Paths.get(serverUploadPath + "/" + realimglist.get(i));
			try {
				// 파일 이동
				Files.move(beforefilePath, afterfilePath);
				++dfm;
			} catch (Exception e) {
				System.out.println("파일 이동 오류 (임시->서버)");
				result = 0;
			}
		}
		// 삭제 디렉토리,파일 경로
		File deleteDir = new File(tempPath);
		if (dfm == realimglist.size()) {
			// 임시 디렉토리 파일 전부 삭제
			File[] tempfiles = deleteDir.listFiles();
			if (tempfiles.length == 0) {
				dfr = 1;
			} else {
				// 삭제 for문
				for (File tempfile : tempfiles) {
					tempfile.delete();
					if (!tempfile.isFile()) {
						dfr = 1;
					} else {
						result = 0;
					}
				}
			}
			// 디렉토리 삭제
			if (dfr == 1) {
				if (deleteDir.exists()) {
					if (deleteDir.delete()) {
						System.out.println("임시 폴더 삭제 완료");
						result = 1;
					} else {
						System.out.println("임시 폴더 삭제 실패");
						result = 0;
					}
				}
			}
		}
		return result;
	}
	
	//글 삭제시 해당 파일 저장 폴더 삭제
	public int DirDelete(HttpServletRequest request, HttpServletResponse response, String category, String folderNum) {
		//폴더 삭제 결과
		int fileDeleteResult = 0;
		//폴더 삭제 결과
		int dirDeleteResult = 0;
		// DB글 번호 (서버 폴더이름)
		String serverFolderName = folderNum;
		// 서버파일업로드 경로(파일 저장 폴더)
		String serverUploadPath = request.getSession().getServletContext().getRealPath("/resources/images/" + category + "/" + serverFolderName);
		// 삭제 디렉토리,파일 경로
		File deleteDir = new File(serverUploadPath);
		File[] tempfiles = deleteDir.listFiles();
		// 삭제 for문
		File serverFolder = new File(serverUploadPath);
		// 폴더가 있으면
		if (serverFolder.exists()) {
			for (File tempfile : tempfiles) {
				tempfile.delete();
				if (!tempfile.isFile()) {
					fileDeleteResult = 1;
				} else {
					fileDeleteResult = 0;
				}
			}
			if(fileDeleteResult == 1) {
				// 디렉토리 삭제
				if (deleteDir.exists()) {
					if (deleteDir.delete()) {
						System.out.println("디렉토리 삭제 성공");
						// 디렉토리 삭제 성공
						dirDeleteResult = 1;
					} else {
						System.out.println("디렉토리 삭제 실패");
						// 디렉토리 삭제 실패
						dirDeleteResult = 0;
					}
				}
			}
		} else {
			dirDeleteResult = 2;
		}
		return dirDeleteResult;
	}

}
