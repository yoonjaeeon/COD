package co.cod.app.master.mapper;

import java.util.List;

import co.cod.app.master.MasterVO;

public interface MasterMapper {

	public MasterVO getMaster( MasterVO masterVO);
	public List< MasterVO> getMasterList();
	public void insertMaster( MasterVO masterVO);
	public void updateMaster( MasterVO masterVO);
	public void deleteMaster( MasterVO masterVO);
	
	
}
