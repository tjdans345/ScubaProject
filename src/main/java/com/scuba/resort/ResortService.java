package com.scuba.resort;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.scuba.common.Common;

@Service
public class ResortService {
	@Autowired
	private ResortDAO resortDAO;
	Common common = new Common();
	
	//리조트 글등록
	public int EnterResort(MultipartHttpServletRequest multipartHttpServletRequest,
							HttpServletRequest request,
							HttpServletResponse response) throws Exception {
		ResortVO resortVO = new ResortVO();
		int num = 1;
		if(resortDAO.CheckNum()!=0) {
			num = resortDAO.getMaxNum()+1;
		}
		resortVO.setNum(num);
		resortVO.setId((String)request.getSession().getAttribute("user_id"));
		resortVO.setResortName(multipartHttpServletRequest.getParameter("resortName"));
		resortVO.setPhoneNumber(multipartHttpServletRequest.getParameter("phoneNumber"));
		resortVO.setCacaoId(multipartHttpServletRequest.getParameter("cacaoId"));
		if(multipartHttpServletRequest.getParameter("phoneNumber")==null) resortVO.setPhoneNumber("");
		if(multipartHttpServletRequest.getParameter("cacaoId")==null) resortVO.setCacaoId("");
		resortVO.setHomepageAddress(multipartHttpServletRequest.getParameter("homepageAddress"));
		if(multipartHttpServletRequest.getParameter("homepageAddress")==null) resortVO.setHomepageAddress("");
		resortVO.setSimpleIntroduce(multipartHttpServletRequest.getParameter("simpleIntroduce"));
		resortVO.setContents(multipartHttpServletRequest.getParameter("contents"));
		resortVO.setTag(multipartHttpServletRequest.getParameter("tag"));
		resortVO.setAddress(multipartHttpServletRequest.getParameter("address"));
		resortVO.setCountry(multipartHttpServletRequest.getParameter("country"));
		resortVO.setCity(multipartHttpServletRequest.getParameter("city"));
		List<MultipartFile> list = new ArrayList<MultipartFile>();
		for(int i = 1 ; i < 4 ; i ++) {
			if(multipartHttpServletRequest.getFile("image"+i).getOriginalFilename() != "") {
				list.add(multipartHttpServletRequest.getFile("image"+i));
			}
		}
		resortVO.setImage1(list.get(0).getOriginalFilename());
		if(list.size()>=2) resortVO.setImage2(list.get(1).getOriginalFilename());
		if(list.size()==3) resortVO.setImage3(list.get(2).getOriginalFilename());
		String url = request.getSession().getServletContext().getRealPath("/resources/images/Resort/thumbnail/"+num+"/");
		for(int i = 0 ; i < list.size() ; i++) {
			resortDAO.FileUpload(list.get(i), url);
		}
		//성문이 코드 
		int imgexists = 0 ;
		String category = "Resort";
		String content = resortVO.getContents();
		Pattern pattern = Pattern.compile("<img[^>]*src=[\\\"']?(?!https:)([^>\\\"']+)[\\\"']?[^>]*>");
		Matcher matcher = pattern.matcher(content);
		ArrayList<String> imglist = new ArrayList<String>();
		ArrayList<String> realimglist = new ArrayList<String>();
		int i = 0;
		while(matcher.find()) {
			if(matcher.group(1)==null) {
				break;
			}
			imglist.add(matcher.group(1));
			realimglist.add(imglist.get(i).substring(imglist.get(i).lastIndexOf("/")+1));
			i++;
			imgexists = 1 ;
		}
		if(resortDAO.EnterResort(resortVO)==1) {
			String folderNum = Integer.toString(num);
			if(imgexists == 1) {
				int result = common.imguploadServer(request, response, realimglist, category, folderNum);
				if(result == 1 ) {
					String beforeContent = resortVO.getContents();
					String changePath = beforeContent.replace("Temporary",category);
					String afterContent = changePath.replace((String)request.getSession().getAttribute("user_id"), folderNum);
					HashMap<String,Object> map = new HashMap<String, Object>();
					map.put("afterContent",afterContent);
					map.put("contentNum",folderNum);
					if(resortDAO.contentChange(map)==1) {
						System.out.println("성공");
					}else {
						System.out.println("글 등록 실패");
					}
				}else {
					System.out.println("글삭제 쿼리 ?");
				}
			}else {
				System.out.println("이미지 없는글 인서트 성공");
			}
		}else {
			System.out.println("글 등록 실패");
		}
		return num;
	}
	//관리자페이지 리조트 리스트
	public HashMap<String,Object> getAdminResortList(int nowpage , int resortStatus,String search){
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("search","%"+search+"%");
		map.put("resortStatus",resortStatus);
		int total = resortDAO.getResortCount(map);
		map = common.paging(nowpage, total , 5 , 3);
		map.put("search","%"+search+"%");
		map.put("resortStatus",resortStatus);
		map.put("resortList",resortDAO.getAdminResortList(map));
		map.put("search",search);
		return map;
	}
	//리조트 번호로 리조트 정보 가져오기
	public ResortVO getResortInfo(int num) {
		//조회수 추가
		resortDAO.viewCountAdd(num);
		return resortDAO.getResortInfo(num);
	}
	//리조트 삭제
	public void delResort(int num) {
		
	}
}
