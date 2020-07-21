package co.cod.app.master.service;

import java.util.List;

import co.cod.app.master.MasterVO;

public interface MasterService {

	public MasterVO getMaster( MasterVO masterVO);
	public List< MasterVO> getMasterList();
	public void insertMaster( MasterVO masterVO);
	public void updateMaster( MasterVO masterVO);
	public void deleteMaster( MasterVO masterVO);

}

