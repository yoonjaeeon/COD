package co.cod.app.test;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.cafe.service.CafeService;


@Controller
public class TestController {
	@Autowired
	CafeService cafeservice;

	// 관리자 리뷰 리스트
	@RequestMapping("adminReviewList")
	public String adminReviewList() {
		return "ad/adminCommunity/adminReviewList";
	}

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

	@RequestMapping("cafeList")
	public String memberMyPage(Model model ,HttpSession session) {
		model.addAttribute("cafe",cafeservice.getCafe((String)session.getAttribute("adminId")));
		return "ad/cafe/cafeList";
	}
	
	@RequestMapping("cafeWaiting")
	public String cafeWaiting() {
		return "ad/cafe/cafeWaiting";
	}

	@RequestMapping("apiSampleApplicationJSON")
	public String apiSampleApplicationJSON() {
		return "ad/test/apiSampleApplicationJSON";
	}
	
	//마스터 차트
	@RequestMapping("masterSales")
	public String masterSales() {
		return "ma/master/masterSales";
	}
	
}