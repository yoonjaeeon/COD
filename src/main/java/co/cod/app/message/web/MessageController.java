package co.cod.app.message.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.cod.app.Paging;
import co.cod.app.message.service.MessageService;
import co.cod.app.review.ReviewVO;
import co.cod.app.review.service.ReviewService;
import vofile.MessageVO;

@Controller
public class MessageController {
	@Autowired
	MessageService messageService;
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping("getMessageCount")  //메세지 카운트
	@ResponseBody
	public int getMessageCount(MessageVO messageVO, HttpSession session) {
		 messageVO.setAdminId((String)session.getAttribute("adminId"));
		 return messageService.getMessageCount(messageVO);		
	}
	
	@RequestMapping("adminMessage")	
	public String adminMessage(Model model, MessageVO messageVO,ReviewVO reviewVO,HttpSession session) {
		model.addAttribute("messageList",messageService.messageList((String)session.getAttribute("adminId")));		
		//페이징 처리
		int p=1;
		if(reviewVO.getP() != null && !reviewVO.getP().isEmpty()) {
			p = Integer.parseInt(reviewVO.getP());
		}
		Paging paging = new Paging();   
		paging.setPageUnit(5); // 한 페이지에 출력할 레코드 건수
		paging.setPageSize(3); // 한 페이지에 출력할 페이지 번호 수
		paging.setPage(p); // 현재 페이지
		reviewVO.setEmail((String)session.getAttribute("loginEmail"));
		paging.setTotalRecord(reviewService.getCount(reviewVO)); // 전체 레코드 건수 조회
		model.addAttribute("paging", paging);
		
		reviewVO.setStart(Integer.toString(paging.getFirst())); // start
		reviewVO.setEnd(Integer.toString(paging.getLast())); // end
		
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
	
	@RequestMapping("getMasterSend")
	@ResponseBody
	public String getMasterSend(MessageVO messageVO) {
		messageService.getMasterSend(messageVO);
		return "success";
	}
	
	@RequestMapping("fiveMessage")
	@ResponseBody
	public List<MessageVO> fiveMessage(MessageVO messageVO){
		return messageService.fiveMessage(messageVO);
	}
	
	
}
