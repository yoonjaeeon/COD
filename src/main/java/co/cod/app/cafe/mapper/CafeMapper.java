package co.cod.app.cafe.mapper;

import java.util.List;
import java.util.Map;

import co.cod.app.cafe.CafeVO;

public interface CafeMapper {

	public CafeVO getCafe(CafeVO cafeVO);
	public List<CafeVO> getCafeList(CafeVO cafeVO);
	public void insertCafe(CafeVO cafeVO); 
	public void updateCafe(CafeVO cafeVO);
	public void deleteCafe(CafeVO cafeVO);
	public List<Map<String, Object>> getCafeMap();
	public List<CafeVO> getThemeList(CafeVO cafeVO);
}
