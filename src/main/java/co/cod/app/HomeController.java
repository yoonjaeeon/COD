package co.cod.app;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.admin.AdminVO;
import co.cod.app.admin.service.AdminService;
import co.cod.app.admin.worker.service.WorkerService;
import co.cod.app.cafe.service.CafeService;

@Controller
public class HomeController {

   @Autowired AdminService adminService;
   @Autowired CafeService cafeService;
   @Autowired WorkerService workerService;
   
   @RequestMapping("home")
   public String home(Locale locale, Model model) {
      System.out.println("main");
      return "main/home";
   }
   
   @RequestMapping("admin")
   public String adminHome(Model model, HttpSession session) {
	  String adminId = (String)session.getAttribute("adminId");
      model.addAttribute("workerList",workerService.getWorkerList(adminId));  
      return "ad/admin/adminMain";
   }
   @RequestMapping("master")
   public String masterHome(Locale locale, Model model) {
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