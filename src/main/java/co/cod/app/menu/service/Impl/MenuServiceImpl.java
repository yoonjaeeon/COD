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
	public MenuVO getMenu(MenuVO MenuVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MenuVO> getMenuList(MenuVO MenuVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertMenu(MenuVO MenuVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateMenu(MenuVO MenuVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMenu(MenuVO MenuVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Map<String, Object>> getCafeMap() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
}
