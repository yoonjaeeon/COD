package co.cod.app.orders.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.orders.OrdersVO;
import co.cod.app.orders.mapper.OrdersMapper;

@Controller
public class OrdersController {
		OrdersMapper OrdersMapper;
		
		//등록
		@RequestMapping("cafeOrder")
		public String cafeOrder() {
			return "cafe/cafeOrder";
		}
		
}
