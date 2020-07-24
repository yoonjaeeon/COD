package co.cod.app.admin.web;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.admin.AdminVO;
import co.cod.app.admin.service.AdminService;
import co.cod.app.admin.worker.WorkerVO;

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
	return "redirect:home";
	}
	
	// admin 로그인  
	@RequestMapping("adminLoginForm")
	public String adminLoginForm() {
			 return "admin/adminLogin";
	}
	
	
	//로그인시 카페 스테이트가 0일 때 ( 카페 등록 인서트 폼 이동)
		//	카페 스테이트가 1일때 ( 처리중 화면 )
		// 카페 스테이트가 2 일때 (admin main 화면 )
	//또한 
		// 로그인시 admin_state가  0일때 일반 admin 
		//  	로그인 admin_state 가 1일때 master 화면으로 이동 
	
	
	//로그인 처리
	@RequestMapping("adminLogin")
	public String adminLogin(Model model, AdminVO adminVO, HttpSession session){
			AdminVO result = adminService.adminLogin(adminVO);		
			
			String rt = "";
			System.out.println(result);
			
			if(result.getAdminId().equals(adminVO.getAdminId()) && result.getPw().equals(adminVO.getPw())) {	
				session.setAttribute("adminId", adminVO.getAdminId());
				rt = "ad/admin/adminMain" ;				
			if(result.getAdminState()==0) {
				if (result.getCafeState()== 0 ){	
						rt = "e/cafe/cafeInsertForm" ;
				}else if (result.getCafeState()== 1) {
						rt = "admin/loading";					
				}else if(result.getCafeState()== 2){
						rt = "ad/admin/admin";	
				}
			}else { 
				rt ="ma/master/masterMain";
			}											
			}
			return rt;
			}		

	@RequestMapping("adminList")
	public String getAdminList(AdminVO adminVO, Model model, HttpSession session) {		
		adminVO.setAdminId((String)session.getAttribute("adminId"));
		model.addAttribute("cafeStateList", adminService.getAdminList(adminVO));		
		return "ma/master/adminList";
	
	}
	
	//카페대기리스트 조회
	@RequestMapping("cafeStateList")
	public String cafeStateList(AdminVO adminVO, Model model, HttpSession session) {		
		adminVO.setAdminId((String)session.getAttribute("adminId"));
		model.addAttribute("cafeStateList", adminService.getAdminList(adminVO));		
		return "ma/master/cafeStateList";
	
	}
	//카페스테이트 업데이트
	@RequestMapping("cafeStateUpdate")
	public String cafeStateUpdate(Model model, AdminVO adminVO) {		
		adminService.cafeStateUpdate(adminVO);
		return "admin/cafeStateUpdate";
		
	}
	
	//업테이트
	@RequestMapping("adminUpdate")
	public String updateAdmin(AdminVO adminVO) {
	return "admin/adminUpdate";
	}
	
	//직원 리스트 
	@RequestMapping("adminWorkerList")
	public String adminWorker(WorkerVO workerVO) {			
		return "ad/adminManage/adminWorkerList";
	
	
	}	
	//직원등록 
	@RequestMapping("insertWorker")
	public String insertWorker(WorkerVO WorkerVO) {			
		return "ad/adminManage/insertWorker";	
	}	
}