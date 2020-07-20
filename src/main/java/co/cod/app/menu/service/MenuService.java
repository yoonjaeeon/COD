package co.cod.app.menu.service;

import java.util.List;
import java.util.Map;

import co.cod.app.menu.MenuVO;

public interface MenuService {

	public MenuVO getMenu(MenuVO MenuVO);
	public List<MenuVO> getMenuList(MenuVO MenuVO);
	public void insertMenu(MenuVO MenuVO); 
	public void updateMenu(MenuVO MenuVO);
	public void deleteMenu(MenuVO MenuVO);
	public List<Map<String, Object>> getCafeMap();
}
