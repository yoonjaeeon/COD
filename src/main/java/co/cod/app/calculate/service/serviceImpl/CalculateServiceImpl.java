package co.cod.app.calculate.service.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.calculate.CalculateVO;
import co.cod.app.calculate.mapper.CalculateMapper;
import co.cod.app.calculate.service.CalculateService;

@Service
public class CalculateServiceImpl implements CalculateService {
	@Autowired CalculateMapper calculateMapper;
	@Override
	public CalculateVO dayCalculate(String adminId) {
		return calculateMapper.dayCalculate(adminId);
	}
	@Override
	public List<Map> commuteList(String adminId) {
		return calculateMapper.commuteList(adminId);
	}
	@Override
	public List<CalculateVO> calculateList(CalculateVO calculateVO) {
		return calculateMapper.calculateList(calculateVO);
	}
	@Override
	public List<Map> getcalculateList(CalculateVO calculateVO) {
		return calculateMapper.getcalculateList(calculateVO);
	}
	@Override
	public List<Map<String, Object>> excel(CalculateVO calculateVO) {
		return calculateMapper.excel(calculateVO);
	}	
	
	
}
