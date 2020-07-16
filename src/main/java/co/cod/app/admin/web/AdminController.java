package co.cod.app.admin.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.admin.AdminVO;
import co.cod.app.admin.service.AdminService;


@Controller
public class AdminController {
	
	
	@Autowired
	AdminService adminService;
	
	//등록폼
	@RequestMapping("adminInsert")
	public String IsertForeAdmin(AdminVO vo) {
//		model.addAttribute("adminList",adminService.adminList(""));
		return "ad/admin/adminInsert";
	}
	
	//목록조회
	@RequestMapping("adminList")
	public String adminList(Model model, AdminVO adminVO) {
		model.addAttribute("adminList", adminService.getAdminList(adminVO));
		return "ad/admin/adminList";
	}
	
	//단건 조회 
	@RequestMapping("/geAdmin/{adminId}")  
	public String getAdmin(@PathVariable String adminId) {
		System.out.println(adminId);
		return "ad/adminList";
	}
}		
	//수정처리 
//	@RequestMapping("/geAdmin/{adminId}")  
//	public String getAdmin(@PathVariable String adminId) {
//		System.out.println(adminId);
//		return "adminList";	
//		
	// 삭제처리 
	
	
	
//	//등록처리
////	@RequestMapping("insertEmp")
////	public String insertEmp(@ModelAttribute("evo") EmpVO vo, Model model) {
////		System.out.println(vo.getFirstName() +" : " + vo.getLastName());
////		//model.addAttribute("empVO", vo); 안해도 넘어간다, evo랑 empVO랑 같음: view페이지에서 evo사용할수있음
////		//서비스 호출
////		return "home";
////	}
//	
//	@RequestMapping("insertEmp")
//	public String insertEmp(@ModelAttribute("evo") EmpVO vo, //커맨드 객체 자동으로 모델에 저장됨
//							Model model, 
//							@RequestParam String firstName,  //2. String firstName = request.getParameter("firstName")과같음
//							@RequestParam(required = false, defaultValue = "kim", value = "lastName") String ln,
//							//required=false: 필수아님, 변수명이랑 파라미터이름을 다르게 할때: value 사용
//							@RequestParam Map map //3. 모든 파라미터 맵으로 받기
//			
//			
//							) {
//		empService.insertEmp(vo);
////		System.out.println(vo.getFirstName() +" : " + vo.getLastName());
////		System.out.println("parameter: " + firstName + " : " + ln);
////		System.out.println("map " + map.get("firstName") + " : " +map.get("lastName"));
//		//model.addAttribute("empVO", vo); 안해도 넘어간다, evo랑 empVO랑 같음: view페이지에서 evo사용할수있음
//		//서비스 호출
//		return "home";
//	}
//
//	
//	//단건조회
//	@RequestMapping("/getEmp/{employeeId}/{firstName}")  //getEmp?employeeId=aaaa, 여러개도 가능 /{firstName}
//	public String getEmp(@PathVariable Integer employeeId, @PathVariable String firstName) {
//		System.out.println(employeeId + " : " + firstName);
//		return "home";
//	}
//	
//	//목록조회
//	@RequestMapping("empList")
//	public String empList(Model model, EmpVO empVO) {
//		model.addAttribute("empList", empService.getEmpList(empVO));
//		return "emp/empList";
//	}
//	
//	//emp관리, ajax를 씀
//	@RequestMapping("empClient")
//	public String empClient() {
//		return "admin/emp/empClient";
//	}
//	
//	//ajax :목록, @ResponseBody: 결과가 json구조로
//	@RequestMapping("ajaxEmpList")
//	public @ResponseBody List<EmpVO> ajaxEmpList(EmpVO empVO) {
//		return empService.getEmpList(empVO);
//	}
//	
//	
//	//차트 데이터
//	@RequestMapping("getChartData.do")
//	public @ResponseBody List<Map<String, Object>> getDeptEmpCnt() {
//		return empService.getDeptEmpCnt();
//	}
//	
//	
//	
//	//수정폼
//	
//	//수정처리
//	
//	//삭제처리
//	
//	
//}
//	
//	
//	

