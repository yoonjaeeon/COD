package co.cod.app.orders.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.member.MemberVO;
import co.cod.app.orders.OrdersVO;
import co.cod.app.orders.mapper.OrdersMapper;
import co.cod.app.orders.service.OrdersService;
import co.cod.app.seat.SeatVO;
import vofile.MenuVO;
import vofile.OrderInsertVO;
import vofile.OrderlineVO;

@Service
public class OrdersServiceImpl implements OrdersService {
	
	@Autowired
	OrdersMapper ordersMapper;

	@Override
	public OrdersVO getOrders(OrdersVO ordersVO) {
	
		return ordersMapper.getOrders(ordersVO);
	}

	@Override
	public List<OrdersVO> getOrdersList(OrdersVO ordersVO) {
		return ordersMapper.getOrdersList(ordersVO);
	}

	@Override
	public void insertOrders(OrderInsertVO orderInsertVO) {
		ordersMapper.insertOrders(orderInsertVO);
		ordersMapper.mileage(orderInsertVO);
		ordersMapper.mileageMinus(orderInsertVO);
		for(OrderlineVO orderlineVO: orderInsertVO.getOrderlineList()) {
			orderlineVO.setOrderSeq(orderInsertVO.getOrderSeq());
			ordersMapper.insertOrderLine(orderlineVO);
		}		
	}

	@Override
	public void updateOrders(OrdersVO ordersVO) {
		ordersMapper.updateOrders(ordersVO);
		
	}

	@Override
	public void deleteOrders(OrdersVO ordersVO) {
		ordersMapper.deleteOrders(ordersVO);
		
	}

	@Override
	public List<MenuVO> getMenuList(String id) {
		return ordersMapper.getMenuList(id);
	}

	@Override
	public List<SeatVO> getSeatList(String id) {
		return ordersMapper.getSeatList(id);
	}

	@Override
	public MemberVO getMileage(MemberVO memberVO) {
		return ordersMapper.getMileage(memberVO);
	}
	
	
	
	
	
}
