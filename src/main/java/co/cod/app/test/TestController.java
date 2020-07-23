package co.cod.app.test;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class TestController {

	// 좌석 수정폼
	@RequestMapping("updateSeatForm")
	public String updateSeatForm() {
		return "ad/adminManage/updateSeat";
	}

	// 좌석 등록폼
	@RequestMapping("insertSeatForm")
	public String insertSeat() {
		return "ad/adminManage/insertSeat";
	}

	// 관리자 리뷰 리스트
	@RequestMapping("adminReviewList")
	public String adminReviewList() {
		return "ad/adminCommunity/adminReviewList";
	}

	// 광고
	@RequestMapping("advertisementForm")
	public String advertisementForm() {
		return "ma/master/advertisement";
	}

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

}