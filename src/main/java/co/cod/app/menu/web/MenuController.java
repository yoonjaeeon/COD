package co.cod.app.menu.web;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
	@RequestMapping("menuForm")
	public String adminMenuForm() {
		return "ad/adminManage/adminMenu";
	}
	//전체조회
	@RequestMapping(value="/menu", method=RequestMethod.GET)
	@ResponseBody
	public List<MenuVO> getMenuList(Model model, MenuVO vo, HttpSession session) {
		vo.setAdminId((String) session.getAttribute("adminId"));
		return  menuService.getMenuList(vo);
	}
	
	//단건조회
	@RequestMapping(value="/menu/{menuSeq}",  method=RequestMethod.GET)
	@ResponseBody
	public MenuVO getMenu(@PathVariable String menuSeq, MenuVO vo, Model model) {
		vo.setMenuSeq(Integer.parseInt(menuSeq));
		return  menuService.getMenu(vo);
	}
	
	//삭제
	@RequestMapping(value="/menu/{menuSeq}", method=RequestMethod.DELETE)
	@ResponseBody
	public Map  getMenuList( @PathVariable String menuSeq, MenuVO vo, Model model) {
		vo.setMenuSeq(Integer.parseInt(menuSeq));
		menuService.deleteMenu(vo);
		Map result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}
	//등록
	@RequestMapping(value="/menu",method=RequestMethod.POST)
	@ResponseBody
	public Map insertMenu(MenuVO vo, Model model, HttpSession session) {
		vo.setAdminId((String)session.getAttribute("adminId"));		
		menuService.insertMenu(vo);
		return  Collections.singletonMap("result", true);
	}
	
	//수정
	@RequestMapping(value="/menu" ,method=RequestMethod.PUT ,consumes="application/json")
	@ResponseBody
	public MenuVO updateMenu(@RequestBody MenuVO vo, Model model) {
		menuService.updateMenu(vo);
		return  vo;
	}	
}
