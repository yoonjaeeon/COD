package co.cod.app.calculate.service;

import java.util.List;
import java.util.Map;

import co.cod.app.calculate.CalculateVO;

public interface CalculateService {
	public CalculateVO dayCalculate(String adminId);
	public List<Map> commuteList(String adminId);
}
