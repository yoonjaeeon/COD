package co.cod.app.inventory.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.inventory.InventoryVO;
import co.cod.app.inventory.mapper.InventoryMapper;
import co.cod.app.inventory.service.InventoryService;

@Service
public class InventoryServiceImpl implements InventoryService {

	@Autowired
	InventoryMapper inventoryMapper;

	@Override
	public InventoryVO getInventory(InventoryVO inventoryVO) {
		return inventoryMapper.getInventory(inventoryVO);
	}

	@Override
	public List<InventoryVO> getInventoryList(String adminId) {
		return inventoryMapper.getInventoryList(adminId);
	}

	@Override
	public int insertInventory(InventoryVO inventoryVO) {
		return inventoryMapper.insertInventory(inventoryVO);
	}

	@Override
	public int updateInventory(InventoryVO inventoryVO) {
		return inventoryMapper.updateInventory(inventoryVO);
	}

	@Override
	public int deleteInventory(InventoryVO inventoryVO) {
		return inventoryMapper.deleteInventory(inventoryVO);		
	}

	@Override
	public List<Map<String, Object>> getCafeMap() {
		return null;
	}
	
	
	
	
}
