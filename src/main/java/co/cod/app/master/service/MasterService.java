package co.cod.app.master.service;

import java.util.List;

import vofile.MasterVO;
import vofile.MessageVO;

public interface MasterService {

	public MasterVO getMaster(MasterVO masterVO);
	public void deleteMaster(MasterVO masterVO);
	public void insertMasterMessage(MasterVO masterVO); //메세지보내기
	public int getMasterMessageCount(); //메세지 카운트
	public List<MessageVO> masterMessage(); //메세지 리스트
	public MasterVO getMasterMessage(MasterVO masterVO);
	public List<MessageVO> receiveMasterMessage(MessageVO messageVO);
	public List<MessageVO> sendMasterMessage(MessageVO messageVO);
	public List<MessageVO> getFiveMessage(MessageVO messageVO);
}
