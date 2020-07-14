package co.cod.app.message.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.message.mapper.MessageMapper;

@Controller
public class MessageController {

	@Autowired
	MessageMapper messageMapper;
	

	
}
