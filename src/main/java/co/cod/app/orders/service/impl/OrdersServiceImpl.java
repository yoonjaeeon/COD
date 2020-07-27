package co.cod.app.orders.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.orders.OrdersVO;
import co.cod.app.orders.mapper.OrdersMapper;
import co.cod.app.orders.service.OrdersService;

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
	public void insertOrders(OrdersVO ordersVO) {
		ordersMapper.insertOrders(ordersVO);
		
	}

	@Override
	public void updateOrders(OrdersVO ordersVO) {
		ordersMapper.updateOrders(ordersVO);
		
	}

	@Override
	public void deleteOrders(OrdersVO ordersVO) {
		ordersMapper.deleteOrders(ordersVO);
		
	}
	
	
	
}
