package co.cod.app.member.mapper;

import java.util.List;

import co.cod.app.cafe.CafeVO;
import co.cod.app.member.MemberVO;
import vofile.BookmarksVO;
import vofile.GetMemberDayOrder;


public interface MemberMapper {


	public MemberVO getMember( MemberVO memberVO);
	public List<MemberVO> getMemberList();
	public void insertMember( MemberVO memberVO);
	public void kakaoInsert(MemberVO memberVO);
	public void updateMember( MemberVO memberVO);
	public void deleteMember(String email);
	public List<BookmarksVO> getBookmarks(BookmarksVO bookmarksVO);
	public MemberVO memberLogin(MemberVO memberVO);
	public void insertBookmark(BookmarksVO bookmarksVO);
	public void deleteBookmark(BookmarksVO bookmarksVO);
	
	//아이디 중복 체크 
	public int idcheck(MemberVO memberVO);
	//멤버  결제 조회 
	public List <MemberVO> getMyorderList(MemberVO memberVO);
	//멤버 결제 상세 조회
	public List <MemberVO> getMyMenuList(MemberVO memberVO);
	public String getEmail(MemberVO memberVO);
	public MemberVO getPhone(MemberVO memberVO);
	public List<GetMemberDayOrder> getMemberDayOrder(GetMemberDayOrder getMemberDayOrder);
	public List<GetMemberDayOrder> getMemberOrders(GetMemberDayOrder getMemberDayOrder);
	public List<GetMemberDayOrder> getFiveDayOrder(GetMemberDayOrder getMemberDayOrder);
	public List<GetMemberDayOrder> getFiveBookmarks(GetMemberDayOrder getMemberDayOrder);
	public List<GetMemberDayOrder> getFiveReview(GetMemberDayOrder getMemberDayOrder);
	public List<MemberVO> popularList(MemberVO memberVO);
	public List<MemberVO> newCafeList(MemberVO memberVO);
	public List<CafeVO> location(CafeVO cafeVO);
	public void deleteAfterUpdate(String email); 
	
}
