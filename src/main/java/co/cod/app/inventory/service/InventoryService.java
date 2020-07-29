package co.cod.app.inventory.service;

import java.util.List;
import java.util.Map;

import co.cod.app.inventory.InventoryVO;

public interface InventoryService {

	public InventoryVO getInventory(InventoryVO inventoryVO);
	public List<InventoryVO> getInventoryList(String adminId);
	public int insertInventory(InventoryVO inventoryVO); 
	public int updateInventory(InventoryVO inventoryVO);
	public int deleteInventory(InventoryVO inventoryVO);
	public List<Map<String, Object>> getCafeMap();
}
