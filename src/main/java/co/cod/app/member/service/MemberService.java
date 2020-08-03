package co.cod.app.member.service;

import java.util.List;

import co.cod.app.member.MemberVO;
import vofile.BookmarksVO;
import vofile.GetMemberDayOrder;
import vofile.MessageVO;

public interface MemberService {

	public MemberVO getMember( MemberVO memberVO);
	public List<MemberVO> getMemberList( );
	public void insertMember( MemberVO memberVO);
	public void updateMember( MemberVO memberVO);
	public void deleteMember( MemberVO memberVO);
	public List<BookmarksVO> getBookmarks(BookmarksVO bookmarksVO);	
	public MemberVO memberLogin(MemberVO memberVO);	
	public void insertBookmark(BookmarksVO bookmarksVO);
	public void deleteBookmark(BookmarksVO bookmarksVO);
	//멤버  결제 조회 
	public List <MemberVO> getMyorderList(MemberVO memberVO);
	//멤버 결제 상세 조회 
	public List <MemberVO> getMyMenuList(MemberVO memberVO);
	public String getEmail(MemberVO memberVO);
	public MemberVO getPhone(MemberVO memberVO);
	public List<GetMemberDayOrder> getMemberDayOrder(GetMemberDayOrder getMemberDayOrder);
	public List<GetMemberDayOrder> getMemberOrders(GetMemberDayOrder getMemberDayOrder);

	
}
