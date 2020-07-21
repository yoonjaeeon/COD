package co.cod.app.admin.web;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.admin.AdminVO;
import co.cod.app.admin.service.AdminService;
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
	
	// admin 로그인  
	@RequestMapping("adminLoginForm")
	public String adminLoginForm() {
			 return "admin/adminLogin";
	}
	
	//로그인 처리
	@RequestMapping("adminLogin")
	public String adminLogin(Model model, AdminVO adminVO, HttpSession session){
			AdminVO result = adminService.adminLogin(adminVO);		
			if(result.getAdminId().equals(adminVO.getAdminId()) && result.getPw().equals(adminVO.getPw())) {	
				return "ad/admin/adminMain" ;
			}
		 return "admin/adminLogin";
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