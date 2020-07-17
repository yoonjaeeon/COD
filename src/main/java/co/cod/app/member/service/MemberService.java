package co.cod.app.member.service;

import java.util.List;

import co.cod.app.member.MemberVO;

public interface MemberService {

	public MemberVO getMember( MemberVO memberVO);
	public List< MemberVO> getMemberList( MemberVO memberVO );
	public void insertMember( MemberVO memberVO);
	public void updateMember( MemberVO memberVO);
	public void deleteMember( MemberVO memberVO);
	
}
