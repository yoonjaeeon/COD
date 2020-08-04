package co.cod.app;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.member.MemberVO;
import co.cod.app.member.service.MemberService;

@Controller
public class HomeController {
	@Autowired MemberService memberService;
   
   @RequestMapping("home")
   public String home(Model model, MemberVO memberVO,HttpSession session) {
      memberService.popularList(memberVO);
      memberVO.setEmail((String)session.getAttribute("loginEmail"));
      model.addAttribute("popularList", memberService.popularList(memberVO));
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