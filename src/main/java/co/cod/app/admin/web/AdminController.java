package co.cod.app.admin.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.admin.AdminVO;
import co.cod.app.admin.service.AdminService;
import vofile.WorkerVO;

@Controller class AdminController {
		
	@Autowired
	AdminService adminService;

	
	//e등로폼 
	@RequestMapping("insertAdmin")
	public String insertAdmin(AdminVO adminVO) {			
		return "ad/admin/insertAdmin";
	
	}	
	//직원 리스트 
	@RequestMapping("adminWorkerList")
	public String adminWorker(WorkerVO WorkerVO) {			
		return "ad/adminManage/adminWorkerList";
	
	
		
	}	
	//e등로폼 
	@RequestMapping("insertWorker")
	public String insertWorker(WorkerVO WorkerVO) {			
		return "ad/adminManage/insertWorker";	
	}	
}