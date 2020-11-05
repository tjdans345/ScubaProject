package com.scuba.freeboard;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scuba.common.Common;

@Service
public class FreeBoardService {
	@Autowired
	private FreeBoardDAO freeboardDAO;

	// 자유게시판 모든(글)리스트 조회
	public List<FreeBoardVO> allBoardList() {
		return freeboardDAO.allBoardList();
	}

	// 에디터 글 등록
	public String write(FreeBoardVO freeboardVO, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// ID값 설정 지워도 됨 나중에
		request.getSession().setAttribute("id", "test3");

		// 임시 닉네임값.
		String nickname = "1";
		freeboardVO.setNickname(nickname);
		// 이미지 사용 여부
		int imgexist = 0;
		Common common = new Common();
		// 커뮤니티 이름설정 카테고리
		String category = (String) request.getSession().getAttribute("category");
//		System.out.println("에디터 내용"+freeboardVO.getContent());
		// 컨텐트 내용 저장후 정규식을 이용하여 src 경로만 추출
		String content = freeboardVO.getContent();
		System.out.println("content : " + content);
		// src경로 추출 정규식
		Pattern pattern = Pattern.compile("<*src=[\\\\\\\"']?([^>\\\\\\\"']+)[\\\\\\\"']?[^>]*>");
		Matcher matcher = pattern.matcher(content);
		// imglist : src경로 list , realimglist : 실제 이미지(파일)명 list
		ArrayList<String> imglist = new ArrayList<String>();
		ArrayList<String> realimglist = new ArrayList<String>();
		// while문 list증가 변수용 i
		int i = 0;
		// 컨텐트 전체내용에서 src경로가 나올때까지 설정한 정규식을 통하여 추출함
		while (matcher.find()) {
			System.out.println("정규식 추출" + matcher.group(1));
			if (matcher.group(1) == null) {
				break;
			}
			// 정규식으로 src경로 추출 후 list에 담아줌
			imglist.add(matcher.group(1));
			// 이미지명만 따로 추출
			realimglist.add(imglist.get(i).substring(imglist.get(i).lastIndexOf("/") + 1));
			System.out.println("imgList : " + i + " : " + imglist.get(i));
			System.out.println("realimgList !!!: " + i + " : " + realimglist.get(i));
			i++;
			imgexist = 1;
		}
		// 글 등록 결과 값
		String writeResult = freeboardVO.getContent();
		// 최근게시글 번호 +1값 가져오기 새로생길 저장 폴더 이름 용도
		String folderNum = Integer.toString(freeboardDAO.getMaxNextNum());
		// DB 인설트 구문 성공시 1 반환 글 작성 완료시 진행
		if (freeboardDAO.write(freeboardVO) == 1) {
			if (imgexist == 1) {
				// 글 등록 성공시 임시폴더 파일 서버폴더로 이동 후 임시폴더 삭제 *서버폴더는 카테고리/글번호로 한다
				int result = common.imguploadServer(request, response, realimglist, category, folderNum);
				// 이미지 이동 성공 시 (임시 -> 서버) src 경로 변경
				if (result == 1) {
					String beforeContent = freeboardVO.getContent();
					String changePath = beforeContent.replace("Temporary", "free");
					String afterContent = changePath.replace("test3", folderNum);
//					System.out.println("비포어 컨텐트 : "+beforeContent);
//					System.out.println("에프터 컨텐트 : "+afterContent);
					writeResult = afterContent;
				} else {
					System.out.println("프리보드 컨트롤러쪽임 이동 실패");
					writeResult = "zzz";
				}
			}
		} else {
			writeResult = "zz";
		}
		return writeResult;
	}

}
