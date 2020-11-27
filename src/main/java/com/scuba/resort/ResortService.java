package com.scuba.resort;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class ResortService {
	@Autowired
	private ResortDAO resortDAO;
	//리조트 글등록
	public void EnterResort(MultipartHttpServletRequest multipartHttpServletRequest,
							HttpSession session) throws Exception {
		ResortVO resortVO = new ResortVO();
		int num = 1;
		if(resortDAO.CheckNum()!=0) {
			num = resortDAO.getMaxNum()+1;
		}
		resortVO.setNum(num);
		resortVO.setId((String)session.getAttribute("user_id"));
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
		if(list.size()==2) resortVO.setImage2(list.get(1).getOriginalFilename());
		if(list.size()==3) resortVO.setImage3(list.get(2).getOriginalFilename());
		String url = session.getServletContext().getRealPath("/resources/upload/Resort/"+num+"/");
		for(int i = 0 ; i < list.size() ; i++) {
			resortDAO.FileUpload(list.get(i), url);
		}
		resortDAO.EnterResort(resortVO);
	}
	public HashMap<String,Object> getAdminResortList(int nowpage , int resortStatus,String search){
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("search","%"+search+"%");
		map.put("resortStatus",resortStatus);
		int total = resortDAO.getResortCount(map);
		int pagesize = 5;
		int totalpage = total/pagesize+(total%pagesize==0?0:1);
		int pagefirst = (nowpage-1)*pagesize;
		int blocksize = 3 ;
		int blockfirst = nowpage -((nowpage-1)%blocksize);
		int blocklast = blockfirst + (blocksize-1);
		if(blocklast>totalpage) blocklast = totalpage;
		map.put("totalpage",totalpage);
		map.put("resortStatus",resortStatus);
		map.put("pagefirst",pagefirst);
		map.put("resortList",resortDAO.getAdminResortList(map));
		map.put("search",search);
		map.put("blockfirst",blockfirst);
		map.put("blocklast",blocklast);
		map.put("blocksize",blocksize);
		return map;
	}
}
