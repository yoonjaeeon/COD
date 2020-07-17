package co.cod.app.admin.adminnotice.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.admin.adminnotice.AdminNoticeVO;
import co.cod.app.admin.adminnotice.service.AdminNoticeService;

@Controller
public class AdminNoticeController {

	@Autowired
	AdminNoticeService adminNoticeService;
	
	@RequestMapping("insertAdminNotice")
	public String insertAdminNotice(HttpSession session, AdminNoticeVO adminNoticeVO, Model model) {
		adminNoticeVO.setAdminId("ha");		
		adminNoticeService.insertAdminNotice(adminNoticeVO);
		return "redirect:admin";
	}
	
	@RequestMapping("adminSales")
	public String  adminSales() {
		return "ad/adminOrder/adminSales";
	}
	
	@RequestMapping("adminNotice")
	public String adminnotice() {
		return "ad/adminnotice/adminNotice";
	}
	
}
