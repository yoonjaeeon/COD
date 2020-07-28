package co.cod.app.master.web;

import java.util.List;

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
import co.cod.app.admin.service.AdminService;
import co.cod.app.master.service.MasterService;
import co.cod.app.menu.MenuVO;
import vofile.MasterVO;
import vofile.MessageVO;

@Controller
public class MasterController {

	@Autowired MasterService masterService;
	@Autowired AdminService	adminService;

	//마스터 메세지
	
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
	

	// admin 조회
	
	@RequestMapping("adminListForm")
	public String adminListForm() {
		return "ma/master/adminList";
	}

	// 관리자 카페 상태 에 따른 조회 ( 0/1/2 )
	@RequestMapping(value="/adminList/{cafeState}",  method=RequestMethod.GET)
	@ResponseBody
	public List<AdminVO> getAdminList2(@PathVariable String cafeState, AdminVO vo, Model model) {
		vo.setCafeState(Integer.parseInt(cafeState));
		return  adminService.getAdminList(vo);
	}
	// 관리자 카페 상태 수정
	@RequestMapping(value = "/adminList", method = RequestMethod.PUT, consumes = "application/json")
	@ResponseBody
	public AdminVO UpdateCafeState(@RequestBody AdminVO adminVO, Model model) {
		System.out.println(adminVO);
		adminService.updateCafeState(adminVO);
		return adminVO;
	}	
	
	// 관리자 단건 조회
	// 단건조회
	@RequestMapping("adminList/{adminId}") // getreview? reviewseq=aaaa
	public String getAdmin(@PathVariable String adminId, HttpSession session) {
		return "ad/admin/adminList";
	}
	// 로그아웃
	@RequestMapping("masterLogout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main/home";
	}

	


}
	