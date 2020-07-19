package co.cod.app.member.mapper;

import java.util.List;

import co.cod.app.member.MemberVO;


public interface MemberMapper {


	public MemberVO getMember( MemberVO memberVO);
	public List< MemberVO> getMemberList();
	public void insertMember( MemberVO memberVO);
	public void updateMember( MemberVO memberVO);
	public void deleteMember( MemberVO memberVO);
}
