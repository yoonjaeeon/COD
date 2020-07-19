package co.cod.app.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
