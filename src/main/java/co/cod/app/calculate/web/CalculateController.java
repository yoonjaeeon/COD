package co.cod.app.calculate.web;

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

import co.cod.app.calculate.CalculateVO;
import co.cod.app.calculate.service.CalculateService;
import co.cod.app.menu.MenuVO;

@Controller
public class CalculateController {
	@Autowired CalculateService calculateService;

	@RequestMapping(value="/calculate" ,method=RequestMethod.GET)	   
	@ResponseBody
	public CalculateVO updateDayPay(Model model,HttpSession session) {
		return calculateService.dayCalculate((String) session.getAttribute("adminId"));
	}
	
	@RequestMapping("workerCalculateView")
	public String adminWorkerForm(Model model, HttpSession session) {
		model.addAttribute("commute",calculateService.commuteList((String) session.getAttribute("adminId")));
		return "ad/adminManage/adminWorkerCalculate";
	}
	@RequestMapping("calculateView")
	public String adminCalculateForm(Model model, HttpSession session) {
		return "ad/adminManage/adminCalculate";
	}
	@RequestMapping(value="/commuteworkerlist", method=RequestMethod.GET)
	@ResponseBody
	public List<Map> getcommuteList(Model model,HttpSession session) {
		return  calculateService.commuteList((String) session.getAttribute("adminId"));	
	}
	@RequestMapping(value="/calculateList", method=RequestMethod.GET)
	@ResponseBody
	public List<CalculateVO> getcalculate(CalculateVO calculateVO, Model model,HttpSession session){
		System.out.println(calculateVO);
		calculateVO.setAdminId((String)session.getAttribute("adminId"));
		List<CalculateVO> list = calculateService.calculateList(calculateVO);
		for (CalculateVO c : list) {
	         c.setOrderTime(c.getOrderTime().substring(0, 10));  
		}
		return list;
	}
	//단건조회
	@RequestMapping(value="/calculateList/{orderTime}",  method=RequestMethod.GET)
	@ResponseBody
	public List<Map> getMenu(@PathVariable String orderTime, CalculateVO calculateVO, Model model, HttpSession session) {
		calculateVO.setAdminId((String)session.getAttribute("adminId"));
		calculateVO.setOrderTime(orderTime);
		return calculateService.getcalculateList(calculateVO);
	}
}
