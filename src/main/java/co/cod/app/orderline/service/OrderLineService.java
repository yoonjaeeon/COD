package co.cod.app.orderline.service;

import java.util.List;
import java.util.Map;

import co.cod.app.orderline.OrderLineVO;

public interface OrderLineService {
	
	public OrderLineVO getOrderLine(OrderLineVO orderLineVO);
	public List<OrderLineVO> getOrderLineList(String adminId);
	public int insertOrderLine(List<OrderLineVO> orderLineVO); 
	public int updateOrderLine(OrderLineVO orderLineVO);
	public int deleteOrderLine(OrderLineVO orderLineVO);
	public List<Map<String, Object>> getOrderLineMap();
}
