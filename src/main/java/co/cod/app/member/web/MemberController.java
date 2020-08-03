package co.cod.app.member.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.cod.app.member.MemberVO;
import co.cod.app.member.service.MemberService;
import vofile.BookmarksVO;
import vofile.GetMemberDayOrder;

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

	// 멤버 탈퇴
	@RequestMapping("memberDelete")
	public String deleteMember(MemberVO memberVO) {
		return "member/memberMyPage";
	}

	// 전체조회
	@RequestMapping("getMemberList")
	public List getMemberList(MemberVO memberVO, Model model) {
		model.addAttribute("MemberList", memberService.getMemberList());		
		return memberService.getMemberList();
	}

	// 마이페이지
	@RequestMapping("memberMyPage")
	public String MemberMyPage(Model model,MemberVO memberVO,HttpSession session) {
		memberVO.setEmail((String)session.getAttribute("loginEmail"));
		model.addAttribute("member", memberService.getMember(memberVO));
		return "member/memberMyPage";
	}

	//회원 정보 조회  
	@RequestMapping("memberUpdateForm")
	public String getMember(MemberVO memberVO, Model model ,HttpSession session) {
		memberVO.setEmail((String)session.getAttribute("loginEmail"));
		model.addAttribute("member", memberService.getMember(memberVO));
		return "member/memberUpdate";
	}

	// 멤버 업데이트
	@RequestMapping("updateMember")
	public String updateMember(Model model,MemberVO memberVO,HttpSession session) {
		memberVO.setEmail((String)session.getAttribute("email"));
		model.addAttribute("member", memberService.getMember(memberVO));
		return "member/memberMyPage";
	}
	
	
	//멤버 결제 조회 
	@RequestMapping("myorderList")
	public String getMyorderList(Model model,GetMemberDayOrder getMemberDayOrder ,MemberVO memberVO, HttpSession session) {		
		memberVO.setEmail((String)session.getAttribute("loginEmail"));
		getMemberDayOrder.setEmail((String)session.getAttribute("loginEmail"));
		model.addAttribute("getMemberDayOrder", memberService.getMemberDayOrder(getMemberDayOrder));
		return "member/myorderList";
	}
	//멤버 결제 조회 
	@RequestMapping("MyMenuList")
	public String getMyMenuList(Model model,MemberVO memberVO) {		
	return "member/MyMenuList";
		}
	
	
		//즐겨찾기
	@RequestMapping("bookmarks")
	public String bookmarks(Model model, BookmarksVO bookmarksVO, HttpSession session) {
		bookmarksVO.setEmail((String) session.getAttribute("loginEmail"));
		model.addAttribute("getBookmarks", memberService.getBookmarks(bookmarksVO));
		return "member/bookmark";
	}
	//회원로그인
	@RequestMapping("memberLogin")
	public String memberLogin(Model model, MemberVO memberVO, HttpSession session) {
		MemberVO result = memberService.memberLogin(memberVO);
		if (result != null) {
			if (result.getEmail().equals(memberVO.getEmail()) && result.getPw().equals(memberVO.getPw())) {
				session.setAttribute("loginEmail", memberVO.getEmail());
				model.addAttribute("msg", "환영합니다.");
				return "redirect:home";

			} else if (result.getEmail().equals(memberVO.getEmail()) && !result.getPw().equals(memberVO.getPw())) {
				model.addAttribute("msg", "잘못된 비밀번호입니다.");
				return "e/member/Login";
			} else if (!result.getEmail().equals(memberVO.getEmail())) {
				model.addAttribute("msg", "잘못된 이메일입니다.");
				return "e/member/Login";
			}
		} else {
			model.addAttribute("msg", "이메일 또는 비밀번호를 확인해주세요");
			return "e/member/Login";
		}

		/*
		 * if(result.getEmail().equals(memberVO.getEmail()) &&
		 * result.getPw().equals(memberVO.getPw())) { return "redirect:home"; }else
		 * if(result.getPw().equals(null)) { model.addAttribute("msg", "잘못된 PW입니다.");
		 * return "memberLoginForm"; }else if(result.getEmail().equals(null)) { return
		 * "memberLoginForm"; }
		 */
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
	public String aLogin(Model model) {
		return "e/member/Login";
	}

	@RequestMapping("memberMain")
	public String memberMain(Model model) {
		return "";
	}

	@RequestMapping("insertBookmark")
	@ResponseBody
	public BookmarksVO insertBookmark(Model model, BookmarksVO bookmarksVO, HttpSession session) {
		bookmarksVO.setEmail((String) session.getAttribute("loginEmail"));
		memberService.insertBookmark(bookmarksVO);
		return bookmarksVO;
	}

	@RequestMapping("deleteBookmark")
	@ResponseBody
	public String deleteBookmark(Model model, BookmarksVO bookmarksVO, HttpSession session) {
		memberService.deleteBookmark(bookmarksVO);
		return "true";
	}
	
	@RequestMapping("getPhone")
	public MemberVO getPhone(MemberVO memberVO) {
		return memberService.getPhone(memberVO);
	}
	
	@RequestMapping("getEmail")
	public String getEmail(MemberVO memberVO) {
		memberService.getEmail(memberVO);
		return "true";
	}
	
	@RequestMapping("getMemberDayOrder")
	public List<GetMemberDayOrder> getMemberDayOrder(GetMemberDayOrder getMemberDayOrder,Model model,HttpSession session) {
		model.addAttribute("getMemberDayOrder", memberService.getMemberDayOrder(getMemberDayOrder));		
		getMemberDayOrder.setEmail((String)session.getAttribute("loginEmail"));
		return memberService.getMemberDayOrder(getMemberDayOrder);
	}
}
