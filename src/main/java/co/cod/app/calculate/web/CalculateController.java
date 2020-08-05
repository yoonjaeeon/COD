package co.cod.app.calculate.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.cod.app.calculate.CalculateVO;
import co.cod.app.calculate.service.CalculateService;

@Controller
public class CalculateController {
	@Autowired CalculateService calculateService;
	
	
	@RequestMapping(value="/calculate" ,method=RequestMethod.GET)	   
	@ResponseBody
	public CalculateVO updateDayPay(Model model,HttpSession session) {
		return calculateService.dayCalculate((String) session.getAttribute("adminId"));
	}
}
