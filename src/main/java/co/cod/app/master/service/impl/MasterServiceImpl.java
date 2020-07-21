package co.cod.app.master.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.master.MasterVO;
import co.cod.app.master.mapper.MasterMapper;
import co.cod.app.master.service.MasterService;


@Service
public class MasterServiceImpl implements MasterService{

	
	@Autowired MasterMapper masterMapper;

	@Override
	public MasterVO getMaster(MasterVO masterVO) {
		return null;
	}

	@Override
	public List<MasterVO> getMasterList() {
		return null;
	}

	@Override
	public void insertMaster(MasterVO masterVO) {
		masterMapper.insertMaster(masterVO);
		
	}

	@Override
	public void updateMaster(MasterVO masterVO) {
		masterMapper.updateMaster(masterVO);
	}

	@Override
	public void deleteMaster(MasterVO masterVO) {
		masterMapper.deleteMaster(masterVO);
	}
	
}
