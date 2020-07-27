package co.cod.app.orderline.mapper;

import java.util.List;
import java.util.Map;

import co.cod.app.orderline.OrderLineVO;



public interface OrderLineMapper {

	
	public OrderLineVO getMenu(OrderLineVO orderLineVO);
	public List<OrderLineVO> getMenuList(String adminId);
	public int insertOrderLine(List<OrderLineVO> orderLineVO); 
	public int updateOrderLine(OrderLineVO orderLineVO);
	public int deleteOrderLine(OrderLineVO orderLineVO);
	public List<Map<String, Object>> getOrderLineMap();
}
