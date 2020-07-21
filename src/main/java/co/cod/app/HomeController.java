
package co.cod.app;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.cafe.CafeVO;
import co.cod.app.cafe.service.CafeService;
import co.cod.app.admin.AdminVO;
import co.cod.app.admin.service.AdminService;

@Controller
public class HomeController {

	@Autowired
	AdminService adminService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	CafeService cafeService;

	@RequestMapping("home")
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		System.out.println("main");
		return "main/home";
	}

	@RequestMapping("admin")
	public String adminHome(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "ad/admin/adminMain";
	}

	@RequestMapping("master")
	public String masterHome(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "ma/master/masterMain";
	}

	@RequestMapping("c")
	public String Login() {
		return "e/admin/adminLogin";
	}

	// admin Login
	@RequestMapping("adminLogin")
	public String adminLogin(Model model, AdminVO adminVO, HttpSession session) {
		AdminVO result = adminService.getAdmin(adminVO);
		if (result.getAdminId().equals(adminVO.getAdminId()) && result.getPw().equals(adminVO.getPw())) {
		}
		return "ad/admin/adminMain";
	}

	/* 카페 테마 리스트 보여주게하기. */
	/*
	 * @RequestMapping("themeList") public String ThemaList(CafeVO cafeVO, Model
	 * model) { List list = cafeService.getThemeList(cafeVO);
	 * model.addAttribute("getTheme", list);
	 * 
	 * return "memberList/memberThemeList"; }
	 */

	@RequestMapping("areaList")
	public String AreaList() {
		return "memberList/memberAreaList";
	}

	@RequestMapping("themeListTest")
	public String ThemaListTest() {
		return "cafe/cafeThemeList";
	}

	@RequestMapping("adminWorker")
	public String adminWorker() {
		return "ad/adminManage/adminWorker";
	}

	@RequestMapping("cafe")
	public String cafe() {
		return "cafe/cafeMain";
	}
}
