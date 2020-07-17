package co.cod.app;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
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
	
	@RequestMapping("adminLogin")
	public String Login() {
			return "e/admin/adminLogin";
	}
	
}
