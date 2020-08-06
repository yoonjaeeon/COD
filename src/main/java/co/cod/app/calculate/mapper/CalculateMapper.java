package co.cod.app.calculate.mapper;

import java.util.List;
import java.util.Map;

import co.cod.app.calculate.CalculateVO;

public interface CalculateMapper {
	public CalculateVO dayCalculate(String adminId);
	public List<Map> commuteList(String adminId);
}
