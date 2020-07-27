package co.cod.app.menu.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.menu.MenuVO;
import co.cod.app.menu.mapper.MenuMapper;
import co.cod.app.menu.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	MenuMapper menuMapper;

	@Override
	public MenuVO getMenu(MenuVO menuVO) {
		return menuMapper.getMenu(menuVO);
	}

	@Override
	public List<MenuVO> getMenuList(String adminId) {
		return menuMapper.getMenuList(adminId);
	}

	@Override
	public int insertMenu(MenuVO menuVO) {
		return menuMapper.insertMenu(menuVO);
	}

	@Override
	public int updateMenu(MenuVO menuVO) {
		return menuMapper.updateMenu(menuVO);
	}

	@Override
	public int deleteMenu(MenuVO menuVO) {
		return menuMapper.deleteMenu(menuVO);		
	}

	@Override
	public List<Map<String, Object>> getCafeMap() {
		return null;
	}
	
	
	
	
}
