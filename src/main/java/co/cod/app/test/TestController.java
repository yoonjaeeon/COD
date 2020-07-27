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
	//회원 최근 결제 내역 보기
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
	@RequestMapping("cafeList")
	public String cafeList() {
		return "ad/cafe/cafeList";
	}
	//마스터 매출
	@RequestMapping("masterSales")
	public String masterSales() {
		return "ma/master/masterSales";
	}

}