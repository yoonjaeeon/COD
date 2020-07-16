package co.cod.app.message.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.message.MessageVO;
import co.cod.app.message.service.MessageService;

@Controller
public class MessageController {

	@Autowired
	MessageService messageService;

	@RequestMapping("adminMessage")
	public String adminMessage(Model model, MessageVO messageVO) {
		model.addAttribute("messageList",messageService.messageList("ha"));		
		return "message/adminMessage";

	}

	@RequestMapping("insertMessage") //메세지 전송
	public String insertMessage(HttpSession session, HttpServletRequest request, MessageVO messageVO, Model model) {
		messageVO.setAdminId("ha");//((String) session.getAttribute("adminId"));
		messageVO.setSendReceive(1); //1 발신, 0 송신
		messageService.insertMessage(messageVO);
		return "redirect:adminMessage";
	}
	
	@RequestMapping("updateMessage")
	public void updateMessage(MessageVO messageVO, HttpServletRequest request, Model model) {		
	}
	
	/*
	 * @RequestMapping("getMessage") //메세지 한건조회 public MessageVO getMessage{
	 * 
	 * }
	 * 
	 * 
	 * @RequestMapping("messageList") //메세지 전체조회 public List<> messageList(){
	 * 
	 * }
	 */
}
