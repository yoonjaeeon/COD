package co.cod.app.member.memberinsert.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.member.memberinsert.mapper.MemberInsertMapper;

@Controller
public class MemberInsertController {
	
	@Autowired
	MemberInsertMapper memberInsertmapper;
	
	@RequestMapping("memberInsert")
	public String adminInsert(String num) {
		return "member/memberInsertModel";
	}
}
