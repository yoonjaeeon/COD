package co.cod.app.admin.adminInsert.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.admin.adminInsert.mapper.AdminInsertMapper;

@Controller
public class AdminInsertController {

	@Autowired
	AdminInsertMapper adminInsertmapper;
	
	@RequestMapping("adminInsert")
	public String adminInsert(String num) {
		return "admin/adminInsertModel";
	}
}


