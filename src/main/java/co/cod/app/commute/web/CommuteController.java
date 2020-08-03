package co.cod.app.commute.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.cod.app.admin.worker.WorkerVO;
import co.cod.app.commute.CommuteVO;
import co.cod.app.commute.service.CommuteService;

@Controller
class CommuteController {
	
	@Autowired CommuteService commuteService;
	
	@RequestMapping(value="/commute",method=RequestMethod.POST)	            
	@ResponseBody
	public CommuteVO insertCommute(CommuteVO commuteVO, Model model) {		
		Map<String, Object> map = new HashMap<String, Object>();
		commuteService.insertCommute(commuteVO);
		return  commuteVO;
	}
	@RequestMapping(value="/commuteup",method=RequestMethod.POST)	            
	@ResponseBody
	public Map updateCommute(CommuteVO commuteVO, Model model) {		
		Map<String, Object> map = new HashMap<String, Object>();
		commuteService.updateCommute(commuteVO);
		map.put("result", true);
		return  map;
	}
}
