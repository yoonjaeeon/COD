package com.dbal.app.emp.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dbal.app.emp.service.Impl.EmpDAO;

@Controller		// 빈등록, 디스패처 서블릿이 인식 할 수 있는 컨트롤러로 전환 	//@Component
public class EmpController {
	@Autowired
	EmpDAO dao;
	
	@RequestMapping("/empList.do")
	public String empList(Model model) {
		model.addAttribute("empList", dao.empList());
		return "emp/list";
	}
}
