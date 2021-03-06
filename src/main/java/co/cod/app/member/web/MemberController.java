package co.cod.app.member.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;

import co.cod.app.cafe.CafeVO;
import co.cod.app.kakao.KakaoController;
import co.cod.app.member.MemberVO;
import co.cod.app.member.service.MemberService;
import vofile.BookmarksVO;
import vofile.GetMemberDayOrder;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	@Autowired
	KakaoController kakaoController;
	// 등록폼
	@RequestMapping("memberInsertForm")
	public String insertMember(MemberVO memberVO) {
		return "member/memberInsert";
	}

	//아이디 체크 
	@ResponseBody
	@RequestMapping(value="/idcheck", method = RequestMethod.POST)
	public int idcheck(MemberVO memberVO){
		int result = memberService.idcheck(memberVO);		
		return result;
	}

	// 등록처리
	@RequestMapping(value = "/memberInsert", method = RequestMethod.POST)
	public String insertMember(MemberVO memberVO, Model model) {
		memberService.insertMember(memberVO);
		return "redirect:home";
	}

	// 회원탈퇴
	@RequestMapping(value="memberDelete", method = RequestMethod.POST)
	public String deleteMember(HttpSession session) {
		memberService.deleteMember((String)session.getAttribute("loginEmail"));
		session.invalidate();
		return "redirect:home";
	}
	// 전체조회
	@RequestMapping("getMemberList")
	public List getMemberList(MemberVO memberVO, Model model) {
		model.addAttribute("MemberList", memberService.getMemberList());		
		return memberService.getMemberList();
	}

	// 마이페이지
	@RequestMapping("memberMyPage")
	public String MemberMyPage(Model model,GetMemberDayOrder getMemberDayOrder,MemberVO memberVO,HttpSession session) {
		memberVO.setEmail((String)session.getAttribute("loginEmail"));
		getMemberDayOrder.setEmail((String)session.getAttribute("loginEmail"));
		model.addAttribute("member", memberService.getMember(memberVO));
		model.addAttribute("FiveOrders", memberService.getFiveDayOrder(getMemberDayOrder));
		model.addAttribute("getMemberBookmarks", memberService.getFiveBookmarks(getMemberDayOrder));
		model.addAttribute("fiveReview", memberService.getFiveReview(getMemberDayOrder));
		return "member/memberMyPage";
	}

	//내 정보 수정 폼으로 
	@RequestMapping("memberUpdateForm")
	public String getMember(MemberVO memberVO, Model model ,HttpSession session) {
		memberVO.setEmail((String)session.getAttribute("loginEmail"));
		model.addAttribute("member", memberService.getMember(memberVO));
		return "member/memberUpdate";
	}

	// 멤버 업데이트
	@RequestMapping("updateMember")
	public String updateMember(Model model,MemberVO memberVO,HttpSession session) {
		memberService.updateMember(memberVO);
		return "redirect:memberMyPage";
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
				return "member/Login";
			} else if (!result.getEmail().equals(memberVO.getEmail())) {
				model.addAttribute("msg", "잘못된 이메일입니다.");
				return "member/Login";
			}
		} else {
			model.addAttribute("msg", "이메일 또는 비밀번호를 확인해주세요");
			return "member/Login";
		}

		return null;

	}

	@RequestMapping("memberLoginForm")
	public String aLogin(Model model, HttpSession session) {
		String kakaoUrl = kakaoController.getAuthorizationUrl(session);
        model.addAttribute("kakao_url", kakaoUrl);
		return "member/Login";
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
	public String getPhone(MemberVO memberVO) {
		memberService.getPhone(memberVO);
		return "사용불가";
		
	}
	
	@RequestMapping("getEmail")
	public String getEmail(MemberVO memberVO) {
		memberService.getEmail(memberVO);
		return "사용불가";
	}
	
	@RequestMapping("getMemberDayOrder")
	public List<GetMemberDayOrder> getMemberDayOrder(GetMemberDayOrder getMemberDayOrder,Model model,HttpSession session) {
		getMemberDayOrder.setEmail((String)session.getAttribute("loginEmail"));
		model.addAttribute("getMemberDayOrder", memberService.getMemberDayOrder(getMemberDayOrder));		
		return memberService.getMemberDayOrder(getMemberDayOrder);
	}
	
	@RequestMapping("getMemberOrders")
	@ResponseBody
	public List<GetMemberDayOrder> getMemberOrders(HttpSession session, GetMemberDayOrder getMemberDayOrder, Model model){
		getMemberDayOrder.setEmail((String)session.getAttribute("loginEmail"));
		return memberService.getMemberOrders(getMemberDayOrder);
	}
	
	@RequestMapping("location")	
	public String location(Model model, HttpSession session, CafeVO cafeVO){
		cafeVO.setEmail((String)session.getAttribute("loginEmail"));
		model.addAttribute("getArea", memberService.location(cafeVO));
		return "memberList/memberAreaList";
	}
	
	//카카오 로그인
	@RequestMapping(value = "/memberloginform.do", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView memberLoginForm(HttpSession session) { 
		ModelAndView mav = new ModelAndView(); 
		/*인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */ 
		String kakaoUrl = kakaoController.getAuthorizationUrl(session); /* 생성한 인증 URL을 View로 전달 */ 
		mav.setViewName("memberloginform"); // mav.addObject("naver_url", naverAuthUrl); 
		// 카카오 로그인
		mav.addObject("kakao_url", kakaoUrl); 
		return mav; 
	}// end memberLoginForm()	   
   @RequestMapping(value = "/kakaologin")
   public String getKakaoSignIn(Model model,@RequestParam("code") String code, HttpSession session,MemberVO vo) throws Exception {
	   JsonNode userInfo = kakaoController.getKakaoUserInfo(code);
	   System.out.println(userInfo);
       String kakaoId = userInfo.get("id").toString();
       vo.setEmail(kakaoId);
       JsonNode properties = userInfo.get("properties");
		/* 1회성 로그인시 자동 회원가입처리 */
       if(memberService.getMember(vo) == null) {
    	   vo.setEmail(kakaoId);
           vo.setNickname(properties.get("nickname").toString());
           memberService.kakaoInsert(vo);
       };
      
       session.setAttribute("loginEmail", kakaoId);
       return "redirect:/home";
   }
}
