package co.cod.app;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.cafe.service.CafeService;
import co.cod.app.admin.service.AdminService;

@Controller
public class HomeController {

   @Autowired AdminService adminService;
   @Autowired CafeService cafeService;
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   
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

   @RequestMapping("memberLogout")
   public String logout(HttpSession session) {
      session.invalidate();
      return "main/home";
   }
}