package co.cod.app.admin.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.admin.AdminVO;
import co.cod.app.admin.service.AdminService;
import co.cod.app.member.MemberVO;
import vofile.WorkerVO;

@Controller class AdminController {
		
	@Autowired
	AdminService adminService;
	
	//e등로폼 
	@RequestMapping("adminInsertForm")
	public String insertAdmin(AdminVO adminVO) {			
		return "admin/adminInsert";
	
	}

	//등록처리
	@RequestMapping("adminInsert")
	public String insertAdmin(AdminVO adminVO, Model model) {
	adminService.insertAdmin(adminVO);
	return "redirect:admin";
	}
	
	//업테이트
	@RequestMapping("adminUpdate")
	public String updateAdmin(AdminVO adminVO) {
	return "admin/adminUpdate";
	}
	
	//직원 리스트 
	@RequestMapping("adminWorkerList")
	public String adminWorker(WorkerVO WorkerVO) {			
		return "ad/adminManage/adminWorkerList";
	
	
	}	
	//직원등록 
	@RequestMapping("insertWorker")
	public String insertWorker(WorkerVO WorkerVO) {			
		return "ad/adminManage/insertWorker";	
	}	
}