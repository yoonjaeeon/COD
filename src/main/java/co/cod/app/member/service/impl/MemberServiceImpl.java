package co.cod.app.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.member.MemberVO;
import co.cod.app.member.mapper.MemberMapper;
import co.cod.app.member.service.MemberService;
import co.cod.app.menu.MenuVO;
import vofile.BookmarksVO;
import vofile.GetMemberDayOrder;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired MemberMapper memberMapper;
	
	@Override
	public MemberVO getMember(MemberVO memberVO) {		
		return memberMapper.getMember(memberVO);
	}

	@Override
	public List<MemberVO> getMemberList() {		
		return memberMapper.getMemberList();
	}

	@Override
	public void insertMember(MemberVO memberVO) {
		memberMapper.insertMember(memberVO);
		
	}

	@Override
	public void updateMember(MemberVO memberVO) {
		memberMapper.updateMember(memberVO);
	}

	@Override
	public void deleteMember(MemberVO memberVO) {
		memberMapper.deleteMember(memberVO);
	}

	@Override
	public List<BookmarksVO> getBookmarks(BookmarksVO bookmarksVO) {
		return memberMapper.getBookmarks(bookmarksVO);
	}

	@Override
	public MemberVO memberLogin(MemberVO memberVO) {
		return memberMapper.memberLogin(memberVO);
	}

	@Override
	public void insertBookmark(BookmarksVO bookmarksVO) {
		memberMapper.insertBookmark(bookmarksVO);
		
	}

	@Override
	public void deleteBookmark(BookmarksVO bookmarksVO) {
		memberMapper.deleteBookmark(bookmarksVO);
		
	}

	@Override
	public List<MemberVO> getMyorderList(MemberVO memberVO) {
		return memberMapper.getMyorderList(memberVO);
	}

	@Override
	public List<MemberVO> getMyMenuList(MemberVO memberVO) {
		return memberMapper.getMyMenuList(memberVO);
	}

	@Override
	public String getEmail(MemberVO memberVO) {
		return memberMapper.getEmail(memberVO);
	}

	@Override
	public MemberVO getPhone(MemberVO memberVO) {
		return memberMapper.getPhone(memberVO);
	}

	@Override
	public List<GetMemberDayOrder> getMemberDayOrder(GetMemberDayOrder getMemberDayOrder) {
		return memberMapper.getMemberDayOrder(getMemberDayOrder);
	}

	@Override
	public List<GetMemberDayOrder> getMemberOrders(GetMemberDayOrder getMemberDayOrder) {
		return memberMapper.getMemberOrders(getMemberDayOrder);
	}

	@Override
	public List<GetMemberDayOrder> getFiveDayOrder(GetMemberDayOrder getMemberDayOrder) {
		return memberMapper.getFiveDayOrder(getMemberDayOrder);
	}

	@Override
	public List<GetMemberDayOrder> getFiveBookmarks(GetMemberDayOrder getMemberDayOrder) {
		return memberMapper.getFiveBookmarks(getMemberDayOrder);
	}


	
	
	
	
	
}
