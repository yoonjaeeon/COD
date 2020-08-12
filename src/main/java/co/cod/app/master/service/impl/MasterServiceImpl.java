package co.cod.app.master.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.master.mapper.MasterMapper;
import co.cod.app.master.service.MasterService;
import co.cod.app.message.mapper.MessageMapper;
import vofile.MasterVO;
import vofile.MessageVO;

@Service
public class MasterServiceImpl implements MasterService{

	
	@Autowired MasterMapper masterMapper;
	@Autowired MessageMapper messageMapper;  
	
	@Override
	public MasterVO getMaster(MasterVO masterVO) {
		return null;
	}
	@Override
	public List<MasterVO> MasterList(MasterVO masterVO) {		
		return masterMapper.MasterList(masterVO);
	}
	

	@Override
	public void insertMasterMessage(MasterVO masterVO) {
		MessageVO messageVO = new MessageVO();
		masterMapper.insertMasterMessage(masterVO);	
		//messageMapper.getMasterSend(messageVO);
	}
	@Override
	public void deleteMaster(MasterVO masterVO) {
		masterMapper.deleteMaster(masterVO);
	}

	
	@Override
	public List<MessageVO> masterMessage() {
		return masterMapper.masterMessage();
	}

	@Override
	public int getMasterMessageCount() {
		return masterMapper.getMasterMessageCount();
	}

	@Override
	public MasterVO getMasterMessage(MasterVO masterVO) {
		MasterVO result = masterMapper.getMasterMessage(masterVO);
		if(result != null && result.getRead() ==1 )
			masterMapper.updateMessage(masterVO.getMessageSeq());
		return result;
	}
	

	@Override
	public List<MessageVO> receiveMasterMessage(MessageVO messageVO) {
		return masterMapper.receiveMasterMessage(messageVO);
	}


	@Override
	public List<MessageVO> sendMasterMessage(MessageVO messageVO) {
		return masterMapper.sendMasterMessage(messageVO);
	}


	@Override
	public List<MessageVO> getFiveMessage(MessageVO messageVO) {
		return masterMapper.getFiveMessage(messageVO);
	}

	// 마스터 올 리스트 
	@Override
	public Map allList() {		
		return  masterMapper.allList();
	}


	@Override
	public void insertMaster(MasterVO masterVO) {
		masterMapper.insertMaster(masterVO);
	}
	@Override
	public int masterCount(MasterVO masterVO) {
		return masterMapper.masterCount(masterVO);
	}


	
}
