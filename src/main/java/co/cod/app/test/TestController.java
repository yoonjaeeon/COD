package co.cod.app.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	
	
	@RequestMapping("insertMenuForm")
	public String insertMenuForm () {
		return "ad/adminOrder/adminOrders";
	}
	
	@RequestMapping("adminMenuForm")
	public String adminMenuForm() {
		return "ad/adminManage/adminMenu";
	}
	
	@RequestMapping("memberReviewListForm")
	public String memberReviewListForm() {
		return "ad/memberList/memberReviewList";
	}
	
	@RequestMapping("memberOrderListForm")
	public String memberOrderListForm() {
		return "ad/memberList/memberOrderList";
	}
	@RequestMapping("memberMyPage")
		public String memberMyPage() {
			return "ad/member/memberMyPage";
		}
	
	@RequestMapping("cafeOrder")
	public String cafeOrder() {
		return "cafe/cafeOrder";
	}
	
	
}