package co.cod.app.inventory.web;

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

import co.cod.app.inventory.InventoryVO;
import co.cod.app.inventory.service.InventoryService;

@Controller
public class InventoryController {

	@Autowired
	InventoryService inventoryService;
	
	//메뉴리스트 목록조회
	@RequestMapping("inventoryList")
	public String InventoryList(Model model, HttpSession session) {
		String adminId = (String)session.getAttribute("adminId");
		model.addAttribute("inventoryList", inventoryService.getInventoryList(adminId));
		return "ad/adminManage/adminInventory";
	}
	
	
	@RequestMapping("inventoryForm")
	public String adminInventoryForm() {
		return "ad/adminManage/adminInventory";
	}
	//전체조회
	@RequestMapping(value="/inventory", method=RequestMethod.GET)
	@ResponseBody
	public List<InventoryVO> getInventoryList(Model model, HttpSession session) {
		String adminId = (String)session.getAttribute("adminId");
		return  inventoryService.getInventoryList(adminId);
	}
	
	//단건조회
	@RequestMapping(value="/inventory/{inventorySeq}",  method=RequestMethod.GET)
	@ResponseBody
	public InventoryVO getInventory(@PathVariable String inventorySeq, InventoryVO vo, Model model) {
		vo.setInventorySeq(Integer.parseInt(inventorySeq));
		return  inventoryService.getInventory(vo);
	}
	
	//삭제
	@RequestMapping(value="/inventory/{inventorySeq}", method=RequestMethod.DELETE)
	@ResponseBody
	public Map  getInventoryList( @PathVariable String inventorySeq, InventoryVO vo, Model model) {
		vo.setInventorySeq(Integer.parseInt(inventorySeq));
		inventoryService.deleteInventory(vo);
		Map result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}
	//등록
	@RequestMapping(value="/inventory",method=RequestMethod.POST)
	@ResponseBody
	public Map insertInventory(InventoryVO vo, Model model, HttpSession session) {
		vo.setAdminId((String)session.getAttribute("adminId"));		
		inventoryService.insertInventory(vo);
		return  Collections.singletonMap("result", true);
	}
	
	//수정
	@RequestMapping(value="/inventory" ,method=RequestMethod.PUT ,consumes="application/json")
	@ResponseBody
	public InventoryVO updateInventory(@RequestBody InventoryVO vo, Model model) {
		inventoryService.updateInventory(vo);
		return  vo;
	}	
}
