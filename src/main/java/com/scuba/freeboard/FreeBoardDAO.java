package com.scuba.freeboard;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDAO {
	@Autowired
	private SqlSession sqlsession;

	//글 작성
	public int write(FreeBoardVO freeboardVO) {
		
		return 0;
	}
	
}
