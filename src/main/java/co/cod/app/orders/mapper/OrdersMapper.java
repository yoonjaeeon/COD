package co.cod.app.orders.mapper;

import java.util.List;

import co.cod.app.orders.OrdersVO;
import co.cod.app.seat.SeatVO;
import vofile.MenuVO;


public interface OrdersMapper {
	public OrdersVO getOrders(OrdersVO ordersVO);
	public List<OrdersVO> getOrdersList(OrdersVO ordersVO);
	public List<MenuVO> getMenuList(String id);
	public List<SeatVO> getSeatList(String id);	
	public void insertOrders(OrdersVO ordersVO);
	public void updateOrders(OrdersVO ordersVO);
	public void deleteOrders(OrdersVO ordersVO);
}
