package co.cod.app.admin.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.admin.AdminVO;
import co.cod.app.admin.service.AdminService;

@Controller class AdminController {
		
	@Autowired
	AdminService adminService;

	
	//e등로폼 
	@RequestMapping("insertAdmin")
	public String insertAdmin(AdminVO adminVO) {			
		return "ad/admin/insertAdmin";
	}	
}