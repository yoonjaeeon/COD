package co.cod.app.cafe.service;

import java.util.List;
import java.util.Map;

import co.cod.app.admin.AdminVO;
import co.cod.app.cafe.CafeVO;

public interface CafeService {
	public CafeVO getCafe(CafeVO cafeVO); 
	public List<CafeVO> getCafeList(CafeVO cafeVO);
	public void insertCafe(CafeVO cafeVO); 
	public void updateCafe(CafeVO cafeVO);
	public void deleteCafe(CafeVO cafeVO);
	public List<Map<String, Object>> getCafeMap();
	public List<CafeVO> getThemeList(CafeVO cafeVO);	
	public List<CafeVO> ThemeList(CafeVO cafeVO);
	public List<CafeVO> AreaList(CafeVO cafeVO);
	public void updateCafeState(AdminVO adminVO);
}
