package com.dbal.app.emp.service.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dbal.app.emp.EmpVO;

@Repository					//빈등록, connection 설정	//@Component 상속 받아서 만들어진애
public class EmpDAO {//
   
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<EmpVO> empList(){
		return mybatis.selectList("EmpDAO.empList");  
	}
}
