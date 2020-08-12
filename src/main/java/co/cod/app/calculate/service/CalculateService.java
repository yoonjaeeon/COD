package co.cod.app.calculate.service;

import java.util.List;
import java.util.Map;

import co.cod.app.calculate.CalculateVO;

public interface CalculateService {
	public CalculateVO dayCalculate(String adminId);
	public List<Map> commuteList(String adminId);
	public List<CalculateVO> calculateList(CalculateVO calculateVO);
	public List<Map> getcalculateList(CalculateVO calculateVO);
	public List<Map<String, Object>> excel(CalculateVO calculateVO);
}
