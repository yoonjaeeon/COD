package co.cod.app.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import vofile.WorkerVO;

@Controller
public class TestController {
	
	
	@RequestMapping("adminReviewList")
	public String adminReviewList() {			
		return "ad/adminCommunity/adminReviewList";
	}

	@RequestMapping("advertisementForm")
	public String advertisementForm() {
		return "ma/master/advertisement";
	}
	
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
	
}