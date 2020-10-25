package com.scuba.information;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
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
}
