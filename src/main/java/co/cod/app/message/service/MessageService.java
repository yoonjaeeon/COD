package co.cod.app.message.service;

import java.util.List;

import vofile.MessageVO;

public interface MessageService {
	public List<MessageVO> messageList(String adminId); //메세지 전체 조회 (adminId에 따른)
	public MessageVO getMessage(Integer MessageSeq);   //메세지 단건조회(클릭시)
	public void insertMessage(MessageVO messageVO);   //메세지 보내기
	public void updateMessage(Integer messageSeq);    //메세지 읽음 표시	
	public int getMessageCount(MessageVO messageVO); //메세지 카운트
}
