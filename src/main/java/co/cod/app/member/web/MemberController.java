package co.cod.app.member.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.member.MemberVO;
import co.cod.app.member.service.MemberService;
import vofile.BookmarksVO;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	

	// 등록폼
	@RequestMapping("memberInsertForm")
	public String insertMember(MemberVO memberVO) {
		return "member/memberInsert";
	}

	// 등록처리
	@RequestMapping("memberInsert")
	public String insertMember(MemberVO memberVO, Model model) {
		memberService.insertMember(memberVO);
		return "redirect:home";
	}

	// 전체조회
	@RequestMapping("getMemberList")
	public String getMemberList(MemberVO memberVO, Model model) {
		model.addAttribute("MemberList", memberService.getMemberList(memberVO));
		return "member/memberList";
	}

	// 로그인
	@RequestMapping("MemberLoginForm")
	public String MemberLoginForm() {
		return "memberLogin.jsp";
	}

	@RequestMapping("memberLogin")
	public String MemberLogin(HttpSession session, String email, String pw, Model model, MemberVO memberVO) {
		/*
		 * Map<String,Object> map = new HashMap<String,Object>();
		 * 
		 * if(email != memberVO.getEmail()) { map.put("errorMsg", "아이디를 확인해주세요");
		 * map.comput("result", false); }else if(pw != memberVO.getPw()) {
		 * 
		 * } 
		 */
		session.setAttribute("sessionEmail", memberVO.getEmail());
		return "redirect:home";
	}
	@RequestMapping("bookmarks")
	public String bookmarks(Model model, BookmarksVO bookmarksVO) {
		model.addAttribute("getBookmarks", memberService.getBookmarks(bookmarksVO));
		bookmarksVO.setEmail("test");
		return "member/bookmark";
	}
}
