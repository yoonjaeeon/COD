package co.cod.app.master.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.master.MasterVO;
import co.cod.app.master.service.MasterService;

@Controller
public class MasterController {

	@Autowired MasterService masterService;
	
	
	// 문의 사항 리스트 조회
	@RequestMapping("masterQuestionList")
	public String getMasterList(MasterVO MasterVO, Model model) {
	//	 model.addAttribute( "Masterlist", masterService.getMasterList());
	return "ma/masterQuestion/masterQuestionList";			
		}
	
		
	//문의 입력
	@RequestMapping("masterQuestionOn")
	public String InsertMaster(MasterVO MasterVO) {
	//	 model.addAttribute( "Masterlist", masterService.getMasterList());
	return "ma/masterQuestion/masterQuestionOn";			
	}
	
	
	//문의 사항 댓글 입력 
	@RequestMapping("masterQuestionMs")
	public String getMasterList(MasterVO MasterVO) {
	//	 model.addAttribute( "Masterlist", masterService.getMasterList());
	return "ma/masterQuestion/masterQuestionMs";			
	}
		

}	