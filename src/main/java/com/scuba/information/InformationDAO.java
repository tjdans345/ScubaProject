package com.scuba.information;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InformationDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//국가 DB 인설트
	public void enterCountry(InformationVO informationVO) {
		sqlSession.insert("mapper.information.enterCountry",informationVO);
	}
	//국가명 리스트 가져오기
	public List<String> getCountryName(){
		return sqlSession.selectList("mapper.information.getCountryName");
	}
	//국가명에따른 이미지 가져오기
	public InformationVO getCountryinfo(String CountryName) {
		return sqlSession.selectOne("mapper.information.getCountryinfo",CountryName);
	}
	//도시 DB 인설트
	public void enterCity(InformationVO informationVO) {
		sqlSession.insert("mapper.information.enterCity",informationVO);
	}
	//국가에 따른 도시명 가져오기
	public List<String> getCityList(String CountryName){
		return sqlSession.selectList("mapper.information.getCityList",CountryName);
	}
	//도시 정보 가져오기 
	public InformationVO getCityinfo(String CityName) {
		return sqlSession.selectOne("mapper.information.getCityinfo",CityName);
	}
	//국가 포인트 정보 가져오기
	public List<HashMap<String, Object>> getCountryPointinfo(String countryName) {
		return sqlSession.selectList("mapper.information.getCountryPointinfo",countryName);
	}
	//다이빙사이트 리스트 가져오기
	public List<InformationVO> getDivinglist(String CityName){
		return sqlSession.selectList("mapper.information.getDivinglist",CityName);
	}
	//국가 테이블 도시가 도시테이블 도시에 있는지 확인 
	public int CityCheck (String CityName) {
		return sqlSession.selectOne("mapper.information.CityCheck", CityName);
	}
	//다이빙사이트 정보 가져오기
	public InformationVO DivingSiteinfo(HashMap<String,Object> map) {
		return sqlSession.selectOne("mapper.information.DivingSiteinfo",map);
	}
}
