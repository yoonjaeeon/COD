package co.cod.app.message.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.cod.app.message.service.MessageService;
import vofile.MessageVO;

@Controller
public class MessageController {

	
	 
	 
	
	@Autowired
	MessageService messageService;
	
	@RequestMapping("getMessageCount")
	@ResponseBody
	public int getMessageCount(MessageVO messageVO) {
		 messageVO.setAdminId("ha");
		 return messageService.getMessageCount(messageVO);		
	}
	
	@RequestMapping("adminMessage")	
	public String adminMessage(Model model, MessageVO messageVO) {
		model.addAttribute("messageList",messageService.messageList("ha"));		
		return "ad/adminCommunity/adminMessage";
	}

	
	@RequestMapping("insertMessage") //메세지 전송
	public String insertMessage(HttpSession session,  MessageVO messageVO, Model model) {
		messageVO.setAdminId("ha");//((String) session.getAttribute("adminId"));
		messageVO.setSendReceive(1); //1 발신, 0 송신
		messageService.insertMessage(messageVO);
		return "redirect:adminMessage";
	}
	
	@RequestMapping("updateMessage")
	public String updateMessage(MessageVO messageVO, HttpServletRequest request, Model model) {	
		return "redirect:adminMessage";
	}
	
	@RequestMapping("getMessage/{getMessageContent}") /* 새로하기 */
	public String getMessage(@PathVariable Integer messageSeq, Model model, MessageVO messageVO) {
		Integer seq = messageVO.getMessageSeq();
		model.addAttribute("getMessageContent", messageService.getMessage(messageSeq));
		messageService.updateMessage(messageSeq);
		return "redirect:adminMessage";		
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
