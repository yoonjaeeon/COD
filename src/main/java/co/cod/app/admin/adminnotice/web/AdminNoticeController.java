package co.cod.app.admin.adminnotice.web;

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

import co.cod.app.admin.AdminVO;
import co.cod.app.admin.adminnotice.AdminNoticeVO;
import co.cod.app.admin.adminnotice.service.AdminNoticeService;
import co.cod.app.menu.MenuVO;
@Controller
public class AdminNoticeController {

	@Autowired
	AdminNoticeService adminNoticeService;

	// list form
	@RequestMapping("adminNoticeList")
	public String adminNoticeList() {
		return "ad/adminNotice/adminNotice";
	}

	//전체조회
	@RequestMapping(value="/adminNotice", method=RequestMethod.GET)
	@ResponseBody
	public List<AdminNoticeVO> getAdminNoticeList(Model model, HttpSession session) {
		return  adminNoticeService.getAdminNoticeList((String)session.getAttribute("adminId"));
	}
	
	//단건조회
	@RequestMapping(value="/adminNotice/{adminNoticeSeq}",  method=RequestMethod.GET)
	@ResponseBody
	public AdminNoticeVO getadminNotice(@PathVariable String adminNoticeSeq, AdminNoticeVO vo, Model model) {
		vo.setAdminNoticeSeq(Integer.parseInt(adminNoticeSeq));
		return  adminNoticeService.getAdminNotice(vo);
	}
	
	//삭제
	@RequestMapping(value="/adminNotice/{adminNoticeSeq}", method=RequestMethod.DELETE)
	@ResponseBody
	public Map  getadminNoticeList( @PathVariable String adminNoticeSeq, AdminNoticeVO vo, Model model) {
		adminNoticeService.deleteAdminNotice(adminNoticeSeq);
		Map result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}
	//등록
	@RequestMapping(value="/adminNotice" , method=RequestMethod.POST)
	@ResponseBody
	public Map insertAdminNotice(AdminNoticeVO adminNoticeVO, Model model, HttpSession session) {
		adminNoticeVO.setAdminId((String)session.getAttribute("adminId"));
		System.out.println(adminNoticeVO);
		adminNoticeService.insertAdminNotice(adminNoticeVO);
		return  Collections.singletonMap("result", true);
	}
	
	//수정
	@RequestMapping(value="/adminNotice" ,method=RequestMethod.PUT ,consumes="application/json")
	@ResponseBody
	public AdminNoticeVO updateAdminNotice(@RequestBody AdminNoticeVO vo, Model model) {
		adminNoticeService.updateAdminNotice(vo);
		return  vo;
	}	
	@RequestMapping("insertAdminNotice") 
	public String
	 insertAdminNotice(HttpSession session, AdminNoticeVO adminNoticeVO, Model model){ 
		adminNoticeVO.setAdminId((String)session.getAttribute("adminId"));
		adminNoticeService.insertAdminNotice(adminNoticeVO);
		return "redirect:admin";
	}
	/*
	 * @RequestMapping("insertAdminNotice") public String
	 * insertAdminNotice(HttpSession session, AdminNoticeVO adminNoticeVO, Model
	 * model) { adminNoticeVO.setAdminId("ha");
	 * adminNoticeService.insertAdminNotice(adminNoticeVO); return "redirect:admin";
	 * }
	 * 
	 * @RequestMapping("adminSales") public String adminSales() { return
	 * "ad/adminOrder/adminSales"; }
	 * 
	 * @RequestMapping("adminNotice") public String adminnotice() { return
	 * "ad/adminnotice/adminNotice"; }
	 * 
	 * @RequestMapping("adminInventory") public String adminInventory() { return
	 * "ad/adminManage/adminInventory"; }
	 * 
	 * @RequestMapping("adminSeat") public String adminSeat() { return
	 * "ad/adminManage/adminSeat"; }
	 * 
	 * @RequestMapping("cafeOrderComplete") public String cafeOrderComplete(Model
	 * model) { return "ad/cafe/cafeOrderComplete"; }
	 */
	
}
