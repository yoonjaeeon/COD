package co.cod.app.orders.mapper;

import java.util.List;

import co.cod.app.member.MemberVO;
import co.cod.app.orders.OrdersVO;
import co.cod.app.seat.SeatVO;
import vofile.MenuVO;
import vofile.OrderInsertVO;
import vofile.OrderlineVO;


public interface OrdersMapper {
	public OrdersVO getOrders(OrdersVO ordersVO);
	public List<OrdersVO> getOrdersList(OrdersVO ordersVO);
	public List<MenuVO> getMenuList(String id);
	public List<SeatVO> getSeatList(String id);	
	public void insertOrders(OrderInsertVO ordersVO);
	public void insertOrderLine(OrderlineVO orderlineVO);
	public void updateOrders(OrdersVO ordersVO);
	public void deleteOrders(OrdersVO ordersVO);	
	public MemberVO getMileage(MemberVO memberVO);
	public void mileage(OrderInsertVO orderInsertVO);
	public void mileageMinus(OrderInsertVO orderInsertVO);
	public void updateSeat(OrderInsertVO orderInsertVO);
}
