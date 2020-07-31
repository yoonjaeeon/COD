package co.cod.app.orders.service;

import java.util.List;

import co.cod.app.member.MemberVO;
import co.cod.app.orders.OrdersVO;
import co.cod.app.seat.SeatVO;
import vofile.MenuVO;
import vofile.OrderInsertVO;

public interface OrdersService {
	public OrdersVO getOrders(OrdersVO ordersVO);
	public List<OrdersVO> getOrdersList(OrdersVO ordersVO);
	public List<MenuVO> getMenuList(String id);
	public List<SeatVO> getSeatList(String id);	
	public void insertOrders(OrderInsertVO orderInsertVO);
	public void updateOrders(OrdersVO ordersVO);
	public void deleteOrders(OrdersVO ordersVO);
	public MemberVO getMileage(MemberVO memberVO);
}
