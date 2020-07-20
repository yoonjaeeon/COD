package co.cod.app.member.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.cod.app.member.MemberVO;
import co.cod.app.member.service.MemberService;
import vofile.BookmarksVO;

@Controller
public class MemberController {
	
	@Autowired MemberService memberService;
	
	
	//등록폼 
	@RequestMapping("memberInsertForm")
	public String insertMember(MemberVO memberVO) {
		return "member/memberInsert";			
	}
	//등록처리
	@RequestMapping("memberInsert")
	public String insertMember(MemberVO memberVO, Model model) {
	memberService.insertMember(memberVO);
	return "redirect:home";
	}
	
	//전체조회
	   @RequestMapping("MemberList")
	   public String getMemberList(MemberVO memberVO, Model model) {
	      model.addAttribute( "MemberList", memberService.getMemberList());
	      return "ma/member/memberList";
	   }
	 //전체조회
	   @RequestMapping("MemberMyPage")
	   public String MemberMyPage() {	      
	      return "member/memberMyPage";
	   }
	   
	   @RequestMapping("bookmarks")
	   public String bookmarks(Model model, BookmarksVO bookmarksVO) {
		   model.addAttribute("getBookmarks", memberService.getBookmarks(bookmarksVO));
		   return "member/bookmark";
	   }
	   
	   @RequestMapping("memberLogin")
	   public String memberLogin(
			   Model model, MemberVO memberVO, HttpSession session) {
		   
		   MemberVO result = memberService.memberLogin(memberVO);
		   if(result.getEmail().equals(memberVO.getEmail()) && result.getPw().equals(memberVO.getPw())) {			   
			   return "redirect:home";
		   }else if(result.getPw().equals(null)) {
		   model.addAttribute("msg", "잘못된 PW입니다.");
		   	return "memberLoginForm";
		   }else if(result.getEmail().equals(null)) {
			   return "memberLoginForm";
		   }
		   
		   return null;
		   
		/*
		 * if() { model.addAttribute("msg", email +"님 환영합니다");
		 * session.setAttribute("sessionEmail", email); return "redirect:home"; }else
		 * if( ) { model.addAttribute("msg", "잘못된 ID입니다."); return "memberLoginForm";
		 * }else if(memberVO.getPw() != pw) { model.addAttribute("msg", "잘못된 PW입니다.");
		 * return "memberLoginForm"; } return "redirect:home";
		 */
	   }
	   
	   @RequestMapping("memberLoginForm") 
		  public String aLogin() { 
			  return  "e/member/Login"; 
			  }
	 
	 

}
