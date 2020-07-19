package co.cod.app.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.member.MemberVO;
import co.cod.app.member.mapper.MemberMapper;
import co.cod.app.member.service.MemberService;
import vofile.BookmarksVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired MemberMapper memberMapper;
	
	@Override
	public MemberVO getMember(MemberVO memberVO) {		
		return null;
	}

	@Override
	public List<MemberVO> getMemberList(MemberVO memberVO) {		
		return memberMapper.getMemberList(memberVO);
	}

	@Override
	public void insertMember(MemberVO memberVO) {
		memberMapper.insertMember(memberVO);
		
	}

	@Override
	public void updateMember(MemberVO memberVO) {
	}

	@Override
	public void deleteMember(MemberVO memberVO) {
	}

	@Override
	public List<BookmarksVO> getBookmarks(BookmarksVO bookmarksVO) {
		return memberMapper.getBookmarks(bookmarksVO);
	}
	
	
	
}
