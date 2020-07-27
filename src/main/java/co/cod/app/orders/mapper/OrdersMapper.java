package co.cod.app.orders.mapper;

import java.util.List;

import co.cod.app.orders.OrdersVO;


public interface OrdersMapper {
	public OrdersVO getOrders(OrdersVO ordersVO);
	public List<OrdersVO> getOrdersList(OrdersVO ordersVO);
	public void insertOrders(OrdersVO ordersVO);
	public void updateOrders(OrdersVO ordersVO);
	public void deleteOrders(OrdersVO ordersVO);
}
