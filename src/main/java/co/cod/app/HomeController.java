package co.cod.app;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
   
   @RequestMapping("home")
   public String home(Model model) {
      System.out.println("main");
      return "main/home";
   }
   
   @RequestMapping("admin")
   public String adminHome(Model model) {
      return "ad/admin/adminMain";
   }
   @RequestMapping("master")
   public String masterHome(Model model) {
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