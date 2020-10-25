package com.scuba.information;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.commons.fileupload.UploadContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
@Service
public class InformationService {
	@Autowired
	private InformationDAO informationDAO;
	//파일 업로드
	public void FileUpload(MultipartFile file,String url) throws Exception {
		//이름변경 메소드 
		//용량줄이는 메소드
		File saveFile =new File(url,file.getOriginalFilename());
		if(!new File(url).exists()) new File(url).mkdirs();
		file.transferTo(saveFile);
	}
	//국가 DB 인설트
	public void enterCountry(InformationVO informationVO) {
		informationDAO.enterCountry(informationVO);
	}
	//국가명 리스트 가져오기
	public List<String> getCountryName(){
		return informationDAO.getCountryName();
	}
	//국가 정보 가져오기
	public InformationVO getCountryinfo(String CountryName) {
		return informationDAO.getCountryinfo(CountryName);
	}
}
