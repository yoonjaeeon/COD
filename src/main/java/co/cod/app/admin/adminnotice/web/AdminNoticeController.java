package co.cod.app.admin.adminnotice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.admin.mapper.AdminNoticeMapper;

@Controller
public class AdminNoticeController {

	@Autowired
	AdminNoticeMapper adminNoticemapper;
	
	@RequestMapping("adminNotice")
	public String adminNotice(String num) {
		return "adminnotice/adminNoticeModal";
	}
}
