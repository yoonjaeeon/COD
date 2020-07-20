package co.cod.app;

import java.util.List;

import co.cod.app.master.MasterVO;

public interface MasterService {

	public MasterVO getMaster( MasterVO masterVO);
	public List< MasterVO> getMasterList();
	public void insertMaeter( MasterVO masterVO);
	public void updateMaeter( MasterVO masterVO);
	public void deleteMaeter( MasterVO masterVO);
}
