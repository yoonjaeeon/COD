package co.cod.app.master.mapper;

import java.util.List;
import java.util.Map;

import vofile.MasterVO;
import vofile.MessageVO;

public interface MasterMapper {

	public MasterVO getMasterMessage(MasterVO masterVO);
	public void insertMaster(MasterVO masterVO);
	public void insertMasterMessage( MasterVO masterVO);
	public void updateMaster(Integer messageSeq);
	public void deleteMaster( MasterVO masterVO);
	public List<MasterVO> MasterList(MasterVO masterVO);
	public int getMasterMessageCount();
	public List<MessageVO> masterMessage();
	public void updateMessage(Integer messageSeq); 
	public List<MessageVO> receiveMasterMessage(MessageVO messageVO);
	public List<MessageVO> sendMasterMessage(MessageVO messageVO);
	public List<MessageVO> getFiveMessage(MessageVO messageVO);
	// 마스터 올 리스트
	public Map allList();
	public int masterCount(MasterVO masterVO); 
 }