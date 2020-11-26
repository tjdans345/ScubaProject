package com.scuba.underwaterboard;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.scuba.common.Common;

@Service
public class UnderwaterboardService {
	@Autowired
	private UnderwaterboardDAO underwaterboardDAO;

	Common common = new Common();
	// 글 작성(등록)
	public HashMap<String, Object> writeinsert(UnderwaterboardVO underwaterboardVO, MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String thumbNail = "";
		// 썸네일 이미지
		if (file.getSize() > 0) {
			// 이미지 이름 얻어오기(실제이름)
			String fileOriginalName = file.getOriginalFilename();
			// 파일 확장자 얻기
			String ext = fileOriginalName.substring(fileOriginalName.lastIndexOf("."));
			// 이미지 이름 UUID사용 후 수정
			UUID uuid = UUID.randomUUID();
			// 업로드 될 파일 이름 UUID.확장자
			String fileSaveName = uuid.toString() + ext;
			// 이미지 파일이름 VO 설정
			underwaterboardVO.setThumbnail(fileSaveName);
			thumbNail = underwaterboardVO.getThumbnail();
		} else { //이미지 없을 시 baseImage로 설정
			underwaterboardVO.setThumbnail("baseImage.PNG");
		}

		// ID값 설정 지워도 됨 나중에
		request.getSession().setAttribute("user_id", "test3");
		// 닉네임값 설정 지워도 됨 나중에
		request.getSession().setAttribute("user_nickname", "1");
		// 임시 닉네임값.
		String nickname = "1";
		underwaterboardVO.setNickname(nickname);

		// 이미지 사용 여부
		int imgexists = 0;
		// 커뮤니티 이름설정 카테고리 *임시
		String category = underwaterboardVO.getCommunityname();
		// 컨텐트 내용 저장후 정규식을 이용하여 src 경로만 추출
		String content = underwaterboardVO.getContent();
		// src경로 추출 정규식 ********src태그만 뽑아오는
		// 정규식<src=[\\\\\\\"']?([^>\\\\\\\"']+)[\\\\\\\"']?[^>]*>*******
		Pattern pattern = Pattern.compile("<img[^>]*src=[\\\"']?(?!https:)([^>\\\"']+)[\\\"']?[^>]*>");
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
				System.out.println("설마 여기냐 ?");
				break;
			}
			// 정규식으로 src경로 추출 후 list에 담아줌
			imglist.add(matcher.group(1));
			System.out.println("임지리스트 : " + imglist.get(i));
			// 이미지명만 따로 추출
			realimglist.add(imglist.get(i).substring(imglist.get(i).lastIndexOf("/") + 1));
			System.out.println("리얼임지리스트 : " + realimglist.get(i));
			i++;
			// 이미지 유무 확인
			imgexists = 1;
		}
		// 글 등록 결과 값
		HashMap<String, Object> resultmap = new HashMap<String, Object>();
		// DB 인설트 구문 성공시 1 반환 글 작성 완료시 진행
		if (underwaterboardDAO.write(underwaterboardVO) == 1) {
			
			// 최근게시글 번호 값 가져오기 새로생길 저장 폴더 이름(추가될 게시글 번호) 용도
			String folderNum = Integer.toString(underwaterboardDAO.getMaxNum());
			
			//썸네일이 있으면 썸네일 이미지 업로드
			if(file.getSize() > 0) {
				common.ThumbnailUpload(file, thumbNail, folderNum, category, request, response);
			}
			
			// 이미지가 있을 때
			if (imgexists == 1) {
				// 글 등록 성공시 임시폴더 파일 서버폴더로 이동 후 임시폴더 삭제 *서버폴더는 카테고리/글번호로 한다
				int result = common.imguploadServer(request, response, realimglist, category, folderNum);
				// 이미지 이동 성공 시 (임시 -> 서버) src 경로 변경
				if (result == 1) {
					// 이미지 경로 변경
					String beforeContent = underwaterboardVO.getContent();
					String changePath = beforeContent.replace("Temporary", category);
					String afterContent = changePath.replace("test3", folderNum);
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("afterContent", afterContent);
					map.put("contentNum", folderNum);
					// 이미지 경로 수정
					if (underwaterboardDAO.contentChange(map) == 1) {
						resultmap.put("contentNum", folderNum);
						resultmap.put("writeResult", 1); // content 내용 path변경 성공
					} else {
						// 글삭제 쿼리 넣어줘야함
						/* 글 삭제 쿼리 */
						resultmap.put("writeResult", 0); // 글 등록 실패
					}
				} else {
					// 글삭제 쿼리 넣어줘야함
					/* 글 삭제 쿼리 */
					resultmap.put("writeResult", 0);
				}
			} else {// 이미지 없을때
				resultmap.put("contentNum", folderNum);
				resultmap.put("writeResult", 2); // 이미지 없는글 인서트 성공
			}
		} else {
			resultmap.put("writeResult", 0); // 글 등록 실패
		}
		return resultmap;
	}
	
	//글 상세보기
	public UnderwaterboardVO viewList(int contentNum) {
		return underwaterboardDAO.viewList(contentNum);
	}
	
	//수중 게시판 모든(글)리스트 조회 
	public List<UnderwaterboardVO> allBoardList() {
		return underwaterboardDAO.allBoardList();
	}

}
