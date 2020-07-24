package co.cod.app.menu.service;

import java.util.List;
import java.util.Map;

import co.cod.app.menu.MenuVO;

public interface MenuService {

	public MenuVO getMenu(MenuVO menuVO);
	public List<MenuVO> getMenuList(MenuVO menuVO);
	public int insertMenu(MenuVO menuVO); 
	public int updateMenu(MenuVO menuVO);
	public int deleteMenu(MenuVO menuVO);
	public List<Map<String, Object>> getCafeMap();
}
