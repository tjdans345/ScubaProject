package com.scuba.information;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.commons.fileupload.UploadContext;
import org.json.simple.JSONObject;
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
	//도시 DB 인설트
	public void enterCity(InformationVO informationVO) {
		informationDAO.enterCity(informationVO);
	}
	//국가에 따른 도시명 리스트 가져오기
	public List<String> getCityList(String CountryName){
		return informationDAO.getCityList(CountryName);
	}
	//도시 정보 가져오기
	public InformationVO getCityinfo(String CityName) {
		return informationDAO.getCityinfo(CityName);
	}
	//국가 포인트 정보 가져오기
	public List<HashMap<String,Object>> getCountryPointinfo(String CountryName){
		return informationDAO.getCountryPointinfo(CountryName);
	}
	//다이빙 포인트 리스트 가져오기
	public List<InformationVO> getDivinglist(String CityName){
		return informationDAO.getDivinglist(CityName);
	}
	//국가 테이블 도시가 도시테이블 도시에 있는지 확인 
	public int CityCheck (String CityName) {
		return informationDAO.CityCheck(CityName);
	}
	//다이빙사이트 정보 가져오기
	public InformationVO DivingSiteinfo(HashMap<String,Object> map) {
		return informationDAO.DivingSiteinfo(map);
	}
	//어류등록
	public void SendFish(InformationVO informationVO) {
		informationDAO.SendFish(informationVO);
	}
	//어류리스트 가져오기
	public List<InformationVO> getFishList(){
		return informationDAO.getFishList();
	}
	//특정 어류 서식지 가져오기
	public String getHauntingCity(String FishName) {
		return informationDAO.getHauntingCity(FishName);
	}
	//어류 서식지 추가
	public void addHaunting(HashMap<String,Object> map) {
		informationDAO.addHaunting(map);
	}
}
