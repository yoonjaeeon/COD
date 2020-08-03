package co.cod.app.message.mapper;

import java.util.List;

import vofile.MessageVO;

public interface MessageMapper {
	public List<MessageVO> messageList(String adminId); //메세지 전체 조회 (adminId에 따른)
	public MessageVO getMessage(MessageVO messageVO);   //메세지 단건조회(클릭시)
	public void insertMessage(MessageVO messageVO);   //메세지 보내기
	public void updateMessage(Integer messageSeq);    //메세지 읽음 표시
	public int getMessageCount(MessageVO messageVO);  //메세지 카운트 
	public List<MessageVO> sendMessage(MessageVO messageVO);
	public List<MessageVO> receiveMessage(MessageVO messageVO);
	public void getMasterSend(MessageVO messageVO);  //마스터 보낸메세지
	public List<MessageVO> fiveMessage(MessageVO messageVO);
}
