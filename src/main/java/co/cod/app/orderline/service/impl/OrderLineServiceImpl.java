package co.cod.app.orderline.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.orderline.OrderLineVO;
import co.cod.app.orderline.service.OrderLineService;

@Service
public class OrderLineServiceImpl implements OrderLineService {

	@Autowired
	OrderLineService orderLineService;

	@Override
	public OrderLineVO getOrderLine(OrderLineVO orderLineVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderLineVO> getOrderLineList(String adminId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertOrderLine(List<OrderLineVO> orderLineVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateOrderLine(OrderLineVO orderLineVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOrderLine(OrderLineVO orderLineVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, Object>> getOrderLineMap() {
		// TODO Auto-generated method stub
		return null;
	}
	

	
}
