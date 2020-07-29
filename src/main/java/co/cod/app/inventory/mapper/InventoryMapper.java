package co.cod.app.inventory.mapper;

import java.util.List;
import java.util.Map;

import co.cod.app.inventory.InventoryVO;

public interface InventoryMapper {
	
	//단건 조회
	public InventoryVO getInventory(InventoryVO inventoryVO);
	//전체 조회
	public List<InventoryVO> getInventoryList(String adminId);
	//등록
	public int insertInventory(InventoryVO inventoryVO); 
	//수정
	public int updateInventory(InventoryVO inventoryVO);
	//삭제
	public int deleteInventory(InventoryVO inventoryVO);
	//
	public List<Map<String, Object>> getCafeMap();
}
