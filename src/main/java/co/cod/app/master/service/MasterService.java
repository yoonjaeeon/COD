package co.cod.app.master.service;

import java.util.List;

import vofile.MasterVO;
import vofile.MessageVO;

public interface MasterService {

	public MasterVO getMaster(MasterVO masterVO);

	public List<MasterVO> getMasterList();

	public void insertMaster(MasterVO masterVO);

	public void updateMaster(MasterVO masterVO);

	public void deleteMaster(MasterVO masterVO);

	public int getMasterMessageCount();

	public List<MessageVO> masterMessage();

	public MasterVO getMasterMessage(MasterVO masterVO);
}
