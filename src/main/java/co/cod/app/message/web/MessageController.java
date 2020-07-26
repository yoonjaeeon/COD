package co.cod.app.message.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.cod.app.message.service.MessageService;
import vofile.MessageVO;

@Controller
public class MessageController {
	@Autowired
	MessageService messageService;
	
	@RequestMapping("getMessageCount")  //메세지 카운트
	@ResponseBody
	public int getMessageCount(MessageVO messageVO, HttpSession session) {
		 messageVO.setAdminId((String)session.getAttribute("adminId"));
		 return messageService.getMessageCount(messageVO);		
	}
	
	@RequestMapping("adminMessage")	
	public String adminMessage(Model model, MessageVO messageVO,HttpSession session) {
		model.addAttribute("messageList",messageService.messageList((String)session.getAttribute("adminId")));		
		return "ad/adminCommunity/adminMessage";
	}

	
	@RequestMapping("insertMessage") //메세지 전송
	public String insertMessage(HttpSession session,  MessageVO messageVO, Model model) {
		messageVO.setAdminId((String)session.getAttribute("adminId"));//((String) session.getAttribute("adminId"));
		messageVO.setSendReceive(1); //1 발신, 0 송신
		messageService.insertMessage(messageVO);
		return "redirect:adminMessage";
	}
	
	//메세지 가져오기
	@RequestMapping("getMessage") 
	@ResponseBody
	public MessageVO getMessage(MessageVO messageVO) {
		//messageVO.setMessageSeq(2);
		
		return messageService.getMessage(messageVO);		
	}	
	
	//보낸 메세지함
	@RequestMapping("sendMessage")
	@ResponseBody
	public List<MessageVO> sendMessage(MessageVO messageVO, HttpSession session, Model model) {
		messageVO.setAdminId((String)session.getAttribute("adminId"));
		return messageService.sendMessage(messageVO);
	}
	
	@RequestMapping("receiveMessage")
	@ResponseBody
	public List<MessageVO> receiveMessage(MessageVO messageVO, HttpSession session, Model model) {
		messageVO.setAdminId((String)session.getAttribute("adminId"));
		
		return messageService.receiveMessage(messageVO);
	}
	
	
}
