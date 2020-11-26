package com.scuba.resort;

import java.io.File;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class ResortDAO {
	@Autowired
	private SqlSession sqlSession;
	//등록리조트 갯수 구하기
	public int CheckNum(){
		return sqlSession.selectOne("mapper.resort.CheckNum");
	}
	//최대 번호 구하기
	public int getMaxNum(){
		return sqlSession.selectOne("mapper.resort.getMaxNum");
	}
	//파일 업로드
	public void FileUpload(MultipartFile file,String url) throws Exception {
		File saveFile =new File(url,file.getOriginalFilename());
		if(!new File(url).exists()) new File(url).mkdirs();
		file.transferTo(saveFile);
	}
	//리조트 등록하기
	public void EnterResort(ResortVO resortVO) {
		System.out.println(resortVO.toString());
		sqlSession.insert("mapper.resort.EnterResort", resortVO);
	}
}
