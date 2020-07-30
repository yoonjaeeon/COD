package co.cod.app.menu.mapper;

import java.util.List;
import java.util.Map;

import co.cod.app.menu.MenuVO;

public interface MenuMapper {
	
	public MenuVO getMenu(MenuVO menuVO);
	public List<MenuVO> getMenuList(String adminId);
	public int insertMenu(MenuVO menuVO); 
	public int updateMenu(MenuVO menuVO);
	public int deleteMenu(MenuVO menuVO);
	public List<Map<String, Object>> getCafeMap();

	// 멤버 결제 상세 조회 리스트 
	
}


