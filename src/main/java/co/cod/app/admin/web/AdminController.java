package co.cod.app.admin.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import co.cod.app.admin.AdminVO;
import co.cod.app.admin.service.AdminService;
import co.cod.app.seat.service.SeatService;

@Controller
class AdminController {

	@Autowired
	AdminService adminService;
	@Autowired
	SeatService seatService;

	// e등로폼
	@RequestMapping("adminInsertForm")
	public String insertAdmin(AdminVO adminVO) {
		return "admin/adminInsert";
	}
	//아이디 체크 
		@ResponseBody
		@RequestMapping(value="/idcheck1", method = RequestMethod.POST)
		public int idcheck1(AdminVO adminVO){
		int result = adminService.idcheck1(adminVO);		
		return result;
		}
	
	// 등록처리
	@RequestMapping("adminInsert")
	public String insertAdmin(AdminVO adminVO, Model model) {
		adminService.insertAdmin(adminVO);	
			 return "redirect:home";
	}

	// 업데이트
	@RequestMapping("adminUpdate")
	public String updateAdmin(AdminVO adminVO) {
		return "admin/adminUpdate";
	}

	// admin 로그인
	@RequestMapping("adminLoginForm")
	public String adminLoginForm() {
		return "admin/adminLogin";
	}

	/*
	 * 관리자 로그인 cafeState == 0 ( 카페 등록 인서트 폼 이동) == 1 ( 처리중 화면 ) == 2 (admin main 화면)
	 * admin_state == 0 (일반 admin) == 1 (master 화면)
	 */

	// 로그인 처리
	@RequestMapping("adminLogin")
	public String adminLogin(Model model, AdminVO adminVO, HttpSession session) {
		AdminVO result = adminService.adminLogin(adminVO);
		String rt = "";
		if (result != null) {
			if (result.getPw().equals(adminVO.getPw())) {
				session.setAttribute("adminId", adminVO.getAdminId());
				if (result.getAdminState() == 0) {
					if (result.getCafeState() == 0) {
						return "e/cafe/cafeInsertForm";
					} else if (result.getCafeState() == 1) {
						return "e/admin/loading";
					} else if (result.getCafeState() == 2) {
						return "redirect:admin";
					} else{
						model.addAttribute("id", adminVO.getAdminId());
						return "e/admin/adminCancel";
					}
				} else{
					return "redirect:masterMain";
				}
			} else {
				model.addAttribute("msg", "잘못된 비밀번호입니다.");
				return "admin/adminLogin";
			}
		} else{
			model.addAttribute("msg", "잘못된 이메일입니다.");
			return "admin/adminLogin";
		} /*
			 * else { model.addAttribute("msg", "이메일 또는 비밀번호를 확인해주세요"); return
			 * "ma/master/masterMain"; }
			 */
//		return rt;
		// return null;
	}

	@RequestMapping("adminLogout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main/home";
	}

	@RequestMapping(value = "/adminrespAPI")
	@ResponseBody
	public Map respAPI() {
		RestTemplate rest = new RestTemplate();
		return rest.getForObject(
				"http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=430156241533f1d058c603178cc3ca0e&targetDt=20200713",
				Map.class);
	}
	
	@RequestMapping("getOrderCount")
	@ResponseBody
	public Integer getOrderCount(AdminVO adminVO,HttpSession session) {
		adminVO.setAdminId((String)session.getAttribute("adminId"));
		return adminService.getOrderCount(adminVO);
	}
	
	@RequestMapping(value="updateOrderSubmit/{orderSeq}", method=RequestMethod.GET)
	@ResponseBody
	public String updateOrderSubmit(@PathVariable String orderSeq, HttpSession session) {
		adminService.updateOrderSubmit(orderSeq);
		return "주문 처리완료";
	}
	
	@RequestMapping(value="deleteOrderSubmit/{orderSeq}", method=RequestMethod.GET)
	@ResponseBody
	public String deleteOrderSubmit(AdminVO adminVO, HttpSession session) {
		adminService.deleteOrderSubmit(adminVO);
		return "삭제 완료";
	}

	/* 서빙완료 가져오는 매퍼 */
	@RequestMapping("getCompleteOrder")
	@ResponseBody
	public List<AdminVO> getCompleteOrder(AdminVO adminVO, HttpSession session, Model model){
		adminVO.setAdminId((String)session.getAttribute("adminId"));
		List lists;
		lists = adminService.getCompleteOrder(adminVO);
		model.addAttribute("completeOrder", lists);
		return adminService.getCompleteOrder(adminVO);
	}

	// 좌석 전체조회
	/*
	 * @RequestMapping(value="/seats", method=RequestMethod.GET)
	 * 
	 * @ResponseBody public List<SeatVO> getSeatLists(Model model, HttpSession
	 * session) { String adminId = (String)session.getAttribute("adminId"); return
	 * seatService.getSeatLists(adminId); }
	 */

}
