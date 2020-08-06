package co.cod.app.orders.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.cod.app.member.MemberVO;
import co.cod.app.orders.service.OrdersService;
import vofile.MenuVO;
import vofile.OrderInsertVO;

@Controller
public class OrdersController {

	@Autowired
	OrdersService ordersService;

	// 카페 등록폼
	@RequestMapping("cafeOrder")
	public String cafeOrder(Model model, MenuVO menuVO,MemberVO memberVO, @RequestParam String adminId,HttpSession session) {
		List menuList = ordersService.getMenuList(adminId);
		List seatList = ordersService.getSeatList(adminId);
		memberVO.setEmail((String)session.getAttribute("loginEmail"));	
		
		model.addAttribute("getMileage", ordersService.getMileage(memberVO));
		model.addAttribute("menuList", menuList);
		model.addAttribute("seatList", seatList);

		return "cafe/cafeOrder";
	}

	@RequestMapping("insertOrders")
	@ResponseBody
	public OrderInsertVO insertOrders(Model model,@RequestBody OrderInsertVO orderInsertVO,HttpSession session) {
		orderInsertVO.setEmail((String)session.getAttribute("loginEmail"));
		
		ordersService.insertOrders(orderInsertVO);
		return orderInsertVO;
	}
}
