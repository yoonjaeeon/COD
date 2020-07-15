package co.cod.app.message.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.message.MessageVO;
import co.cod.app.message.mapper.MessageMapper;

@Controller
public class MessageController {

	@Autowired
	MessageMapper messageMapper;

	@RequestMapping("adminMessage")
	public String adminMessage() {
		return "message/adminMessage";

	}

	@RequestMapping("insertMessage") //메세지 전송
	public void insertMessage(HttpSession session, MessageVO messageVO) {
		messageVO.setAdminId((String) session.getAttribute("adminId"));
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
