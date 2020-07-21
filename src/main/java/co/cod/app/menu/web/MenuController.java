package co.cod.app.menu.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.menu.MenuVO;
import co.cod.app.menu.service.MenuService;

@Controller
public class MenuController {

	
	@Autowired
	MenuService menuService;
	
	//메뉴리스트 목록조회
	@RequestMapping("menuList")
	public String menuList(Model model, MenuVO menuVO) {
		model.addAttribute("menuList", menuService.getMenuList(menuVO));
		return "cafe/cafeOrder";
	}
}
