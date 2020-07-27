package co.cod.app.master.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.cod.app.master.service.MasterService;
import vofile.MasterVO;
import vofile.MessageVO;

@Controller
public class MasterController {

	@Autowired MasterService masterService;
	
	@RequestMapping("masterMain")
	public String masterMain() {
		return "ma/master/masterMain";
	}
	
	@RequestMapping("getMasterMessageCount")  //메세지 카운트
	@ResponseBody
	public int getMessageCount(MessageVO messageVO, HttpSession session) {
		 return masterService.getMasterMessageCount();		
	}
	
	@RequestMapping("masterMessage")
	public String masterMessage(Model model,HttpSession session) {
		model.addAttribute("messageList",masterService.masterMessage());	
		return "ma/masterCommunity/masterMessage";
	}
	
	@RequestMapping("getMasterMessage") 
	@ResponseBody
	public MasterVO getMasterMessage(MasterVO masterVO) {
		//messageVO.setMessageSeq(2);
		
		return masterService.getMasterMessage(masterVO);		
	}	
	
	@RequestMapping("insertMasterMessage")
	@ResponseBody
	public String insertMasterMessage(MasterVO masterVO) {
		masterService.insertMasterMessage(masterVO);
		return "true";
	}
	
//	@RequestMapping("loading")
//	public String masterMain() {
//		return "admin/loading";
//	}

	


}
	