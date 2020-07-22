package co.cod.app.master.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.master.service.MasterService;

@Controller
public class MasterController {

	@Autowired MasterService masterService;
	
//	@RequestMapping("masterMain")
//	public String masterMain() {
//		return "ma/master/masterMain";
//	}
	
	@RequestMapping("loading")
	public String masterMain() {
		return "admin/loading";
	}
	
	
	
}
	