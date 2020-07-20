package co.cod.app.master.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.MasterService;
import co.cod.app.master.MasterVO;
import co.cod.app.master.mapper.MasterMapper;


@Service
public class MasterServiceImpl implements MasterService{

	
	@Autowired MasterMapper masterMapper;
	
	@Override
	public MasterVO getMaster(MasterVO masterVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MasterVO> getMasterList() {
		// TODO Auto-generated method stub
		return masterMapper.getMasterList();
	}

	@Override
	public void insertMaeter(MasterVO masterVO) {
		masterMapper.insertMaster(masterVO);
		
	}

	@Override
	public void updateMaeter(MasterVO masterVO) {
		masterMapper.updateMaster(masterVO);
		
	}

	@Override
	public void deleteMaeter(MasterVO masterVO) {
		masterMapper.deleteMaster(masterVO);
		
	}
	
	
}
