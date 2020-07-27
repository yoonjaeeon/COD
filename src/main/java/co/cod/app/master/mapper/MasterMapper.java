package co.cod.app.master.mapper;

import java.util.List;

import vofile.MasterVO;
import vofile.MessageVO;

public interface MasterMapper {

	public MasterVO getMasterMessage(MasterVO masterVO);
	public void insertMasterMessage( MasterVO masterVO);
	public void updateMaster(Integer messageSeq);
	public void deleteMaster( MasterVO masterVO);
	public int getMasterMessageCount();
	public List<MessageVO> masterMessage();
	public void updateMessage(Integer messageSeq); 
	
}
