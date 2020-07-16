package co.cod.app.menu.mapper;

import java.util.List;
import java.util.Map;

import co.cod.app.menu.MenuVO;

public interface MenuMapper {
	
	public MenuVO getCafe(MenuVO MenuVO);
	public List<MenuVO> getCafeList(MenuVO MenuVO);
	public void insertCafe(MenuVO MenuVO); 
	public void updateCafe(MenuVO MenuVO);
	public void deleteCafe(MenuVO MenuVO);
	public List<Map<String, Object>> getCafeMap();
}
