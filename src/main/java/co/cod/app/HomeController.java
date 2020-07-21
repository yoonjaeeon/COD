package co.cod.app;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.cafe.CafeVO;
import co.cod.app.cafe.service.CafeService;

@Controller
public class HomeController {

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
	@RequestMapping("Login")
	public String aLogin() {
			return "e/admin/Login";
	}
	
	/* 카페 테마 리스트 보여주게하기. */
	@RequestMapping("themeList")
	public String ThemaList(CafeVO cafeVO, Model model) {
		List list = cafeService.getThemeList(cafeVO);
		model.addAttribute("getTheme", list);
		
			return "memberList/memberThemeList";
	}
	
	
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
