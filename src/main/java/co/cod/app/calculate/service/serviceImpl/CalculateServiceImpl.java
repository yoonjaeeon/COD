package co.cod.app.calculate.service.serviceImpl;

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
}
