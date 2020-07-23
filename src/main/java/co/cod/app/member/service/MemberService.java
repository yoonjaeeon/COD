package co.cod.app.member.service;

import java.util.List;

import co.cod.app.cafe.CafeVO;
import co.cod.app.member.MemberVO;
import vofile.BookmarksVO;

public interface MemberService {

	public MemberVO getMember( MemberVO memberVO);
	public List< MemberVO> getMemberList( );
	public void insertMember( MemberVO memberVO);
	public void updateMember( MemberVO memberVO);
	public void deleteMember( MemberVO memberVO);
	public List<BookmarksVO> getBookmarks(BookmarksVO bookmarksVO);	
	public MemberVO memberLogin(MemberVO memberVO);	
	public void insertBookmark(BookmarksVO bookmarksVO);
	public void deleteBookmark(BookmarksVO bookmarksVO);
}
