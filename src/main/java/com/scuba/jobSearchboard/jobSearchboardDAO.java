package com.scuba.jobSearchboard;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class jobSearchboardDAO {
	@Autowired
	SqlSession sqlsession;
	
	
}
