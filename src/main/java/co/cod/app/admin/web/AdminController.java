package co.cod.app.admin.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import co.cod.app.admin.AdminVO;
import co.cod.app.admin.service.AdminService;
import co.cod.app.admin.worker.WorkerVO;

@Controller
class AdminController {

	@Autowired
	AdminService adminService;

	// e등로폼
	@RequestMapping("adminInsertForm")
	public String insertAdmin(AdminVO adminVO) {
		return "admin/adminInsert";

	}

	// 등록처리
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

	/*
	 * 관리자 로그인
	 * cafeState	== 0 ( 카페 등록 인서트 폼 이동) 
	 * 				== 1 ( 처리중 화면 )
	 * 				== 2 (admin main 화면)
	 *  admin_state == 0 (일반 admin) 
	 *  			== 1 (master 화면)
	 */

	// 로그인 처리
	@RequestMapping("adminLogin")
	public String adminLogin(Model model, AdminVO adminVO, HttpSession session) {
		AdminVO result = adminService.adminLogin(adminVO);
		String rt = "";
		if (result.getAdminId().equals(adminVO.getAdminId()) && result.getPw().equals(adminVO.getPw())) {
			session.setAttribute("adminId", adminVO.getAdminId());
			rt = "ad/admin/adminMain";
			if (result.getAdminState() == 0) {
				if (result.getCafeState() == 0) {
					rt = "e/cafe/cafeInsertForm";
				} else if (result.getCafeState() == 1) {
					rt = "admin/loading";
				} else if (result.getCafeState() == 2) {
					rt = "ad/admin/adminMain";
				}
			} else {
				rt = "ma/master/masterMain";
			}
		}
		return rt;
	}

//	// 관리자 목록 조회 전체 조회 
//	
//	@RequestMapping("adminList")
//	public String getAdminList(AdminVO adminVO, Model model, HttpSession session) {
//		adminVO.setAdminId((String) session.getAttribute("adminId"));
//		model.addAttribute("adminList", adminService.getAdminList(adminVO));
//		return "ma/master/adminList";
//
//	}
//	
	
	@RequestMapping("adminCafeStateForm")
	public String adminCafeStateForm() {
		return "ma/master/adminList";
	}

	// 관리자 카페 상태 1조회
		@RequestMapping(value="/adminList", method=RequestMethod.GET)
		@ResponseBody
		public List<AdminVO> getAdminListCafe1(Model model, AdminVO adminVO,HttpSession session) {
			adminVO.setAdminId((String)session.getAttribute("adminId"));  // 세션수정 테스트
			return  adminService.getAdminListCafe1(adminVO);	
		}	
//	//관리자 카페 스테이트가 2인 사람 조회 
//		@RequestMapping("adminList")
//		public String getAdminListCafe2(AdminVO adminVO, Model model, HttpSession session) {
//			adminVO.setAdminId((String) session.getAttribute("adminId"));
//			model.addAttribute("adminList", adminService.getAdminList(adminVO));
//			return "ma/master/adminList";
//		}
	
	
	// 관리자 단건 조회
	// 단건조회
	@RequestMapping("adminList/{adminId}") // getreview? reviewseq=aaaa
	public String getAdmin(@PathVariable String adminId, HttpSession session) {
		System.out.println(adminId);
		return "ad/admin/adminList";
	}

	
	// 관리자 상태 승인 버튼 컨트롤러 
	@RequestMapping(value="/adminList"
			,method=RequestMethod.PUT
			,consumes="application/json" )
	 		//,headers = {"Content-type=application/json"})
	//요청헤더	   
	@ResponseBody
	public AdminVO updateAdminListCafe1(@RequestBody AdminVO adminVO, Model model) {
		adminService.updateAdminListCafe1(adminVO);
		return  adminVO;
	
	}
	// 수정

	@RequestMapping(value = "/UpdateCafeState", method = RequestMethod.PUT, consumes = "application/json")
	@ResponseBody
	public AdminVO UpdateCafeState(@RequestBody AdminVO adminVO, Model model, HttpSession session) {
		adminVO.setAdminId((String) session.getAttribute("adminId"));
		adminService.updateCafeState(adminVO);
		return adminVO;
	}

	// 업테이트
	@RequestMapping("adminUpdate")
	public String updateAdmin(AdminVO adminVO) {
		return "admin/adminUpdate";
	}

	// 직원 리스트
	@RequestMapping("adminWorkerList")
	public String adminWorker(WorkerVO workerVO) {
		return "ad/adminManage/adminWorkerList";

	}

	// 직원등록
	@RequestMapping("insertWorker")
	public String insertWorker(WorkerVO WorkerVO) {
		return "ad/adminManage/insertWorker";
	}

	@RequestMapping("adminLogout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main/home";
	}
	
	@RequestMapping(value="/adminrespAPI")
	@ResponseBody
	public Map respAPI() {
		RestTemplate rest = new RestTemplate();
		return rest.getForObject("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=430156241533f1d058c603178cc3ca0e&targetDt=20200713", Map.class);
	}
	
	
}
