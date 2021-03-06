package co.cod.app.test;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.admin.AdminVO;
import co.cod.app.cafe.CafeVO;
import co.cod.app.cafe.service.CafeService;


@Controller
public class TestController {
	@Autowired
	CafeService cafeservice;


	// 광고


	@RequestMapping("insertMenuForm")
	public String insertMenuForm() {
		return "ad/adminOrder/adminOrders";
	}

	@RequestMapping("adminMenuForm")
	public String adminMenuForm() {
		return "ad/adminManage/adminMenu";
	}

	@RequestMapping("memberOrderListForm")
	public String memberOrderListForm() {
		return "ad/memberList/memberOrderList";
	}

	
	
	@RequestMapping("cafeWaiting")
	public String cafeWaiting() {
		return "ad/cafe/cafeWaiting";
	}

	@RequestMapping("apiSampleApplicationJSON")
	public String apiSampleApplicationJSON() {
		return "ad/test/apiSampleApplicationJSON";
	}
	
	@RequestMapping("membertest")
	public String membertest() {
		return "ad/member/membertest";
	}
	@RequestMapping("chart")
	public String chart() {
		return "ad/test/chart";
	}
	
}