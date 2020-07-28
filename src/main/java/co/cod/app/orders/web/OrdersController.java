package co.cod.app.orders.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.cod.app.orders.service.OrdersService;
import vofile.MenuVO;

@Controller
public class OrdersController {
	
	@Autowired
	OrdersService ordersService;

	// 카페 등록폼
	@RequestMapping("cafeOrder")
	public String cafeOrder(Model model, MenuVO menuVO, @RequestParam String adminId) {		
		List menuList = ordersService.getMenuList(adminId);
		List seatList = ordersService.getSeatList(adminId);
		model.addAttribute("menuList", menuList);
		model.addAttribute("seatList", seatList);
		
		return "cafe/cafeOrder";
	}

}
