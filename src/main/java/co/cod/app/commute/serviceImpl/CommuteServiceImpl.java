package co.cod.app.commute.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.commute.CommuteVO;
import co.cod.app.commute.mapper.CommuteMapper;
import co.cod.app.commute.service.CommuteService;

@Service
public class CommuteServiceImpl implements CommuteService{
	@Autowired CommuteMapper commuteMapper;
	@Override
	public void insertCommute(CommuteVO commuteVO) {
		commuteMapper.insertCommute(commuteVO);
	}

	@Override
	public void updateCommute(CommuteVO commuteVO) {
		commuteMapper.updateCommute(commuteVO);
	}

	@Override
	public List<CommuteVO> getCommuteList(CommuteVO commuteVO) {
		List<CommuteVO> list=commuteMapper.getCommuteList(commuteVO);
		return list;
	}

	@Override
	public CommuteVO getCommute(String CommuteSeq) {
		return commuteMapper.getCommute(CommuteSeq);
	}

}
