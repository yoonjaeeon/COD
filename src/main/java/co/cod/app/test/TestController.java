package co.cod.app.test;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class TestController {


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

	@RequestMapping("memberMyPage")
	public String memberMyPage() {
		return "ad/member/memberMyPage";
	}
	
	@RequestMapping("cafeWaiting")
	public String cafeWaiting() {
		return "ad/cafe/cafeWaiting";
	}

	@RequestMapping("apiSampleApplicationJSON")
	public String apiSampleApplicationJSON() {
		return "ad/test/apiSampleApplicationJSON";
	}
	
	
}