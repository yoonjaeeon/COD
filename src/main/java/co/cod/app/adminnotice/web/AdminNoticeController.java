package co.cod.app.adminnotice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.adminnotice.mapper.AdminNoticeMapper;

@Controller
public class AdminNoticeController {

	@Autowired
	AdminNoticeMapper adminNoticemapper;
	
	@RequestMapping("adminNotice.do")
	public String adminNotice(String num) {
		return "adminnotice/adminNoticeModal";
	}
}
