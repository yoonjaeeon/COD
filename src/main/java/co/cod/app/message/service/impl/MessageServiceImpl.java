package co.cod.app.message.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.message.mapper.MessageMapper;
import co.cod.app.message.service.MessageService;
import vofile.MessageVO;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired 
	MessageMapper messageMapper;
	
	//메세지 전체 조회
	@Override
	public List<MessageVO> messageList(String adminId) { 
		return messageMapper.messageList(adminId);
	}
	//메세지 단건조회 (클릭시)
	@Override
	public MessageVO getMessage(MessageVO messageVO) {
		MessageVO result = messageMapper.getMessage(messageVO);
		if(result != null && result.getRead() ==1 )
			messageMapper.updateMessage(messageVO.getMessageSeq());
		return result;
	}

	@Override
	public void insertMessage(MessageVO messageVO) {
		messageMapper.insertMessage(messageVO);
		
	}
	@Override  //메세지 카운트
	public int getMessageCount(MessageVO messageVO) {
		return messageMapper.getMessageCount(messageVO);
		
	}
	
	
	

}
