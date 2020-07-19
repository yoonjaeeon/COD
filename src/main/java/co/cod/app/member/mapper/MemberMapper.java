package co.cod.app.member.mapper;

import java.util.List;

import co.cod.app.member.MemberVO;
import vofile.BookmarksVO;


public interface MemberMapper {


	public MemberVO getMember( MemberVO memberVO); //회원정보조회
	public List< MemberVO> getMemberList(MemberVO memberVO); //회원 전체 조회
	public void insertMember( MemberVO memberVO); //회원가입
	public void updateMember( MemberVO memberVO); //회원수정
	public void deleteMember( MemberVO memberVO); //회원탈퇴
	public void memberLogin(String email, String pw); //로그인
	public List<BookmarksVO> getBookmarks(BookmarksVO bookmakrsVO);
}
