package co.cod.app.cafe.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.admin.AdminVO;
import co.cod.app.admin.mapper.AdminMapper;
import co.cod.app.cafe.CafeVO;
import co.cod.app.cafe.mapper.CafeMapper;
import co.cod.app.cafe.service.CafeService;


@Service
public class CafeServiceImpl implements CafeService{

	@Autowired 
	CafeMapper cafeMapper;
	
	@Autowired
	AdminMapper adminMapper;
	
	@Override
	public CafeVO getCafe(String adminId) {
		return cafeMapper.getCafe(adminId);
	}

	@Override
	public List<CafeVO> getCafeList(CafeVO cafeVO) {
		return cafeMapper.getCafeList(cafeVO);
	}

	@Override
	public void insertCafe(CafeVO cafeVO) {
		cafeMapper.insertCafe(cafeVO);
	}

	@Override
	public void updateCafe(CafeVO cafeVO) {
		cafeMapper.updateCafe(cafeVO);	
	}

	
	@Override
	public void deleteCafe(CafeVO cafeVO) {
		cafeMapper.deleteCafe(cafeVO);	
	}

	
	@Override
	public List<Map<String, Object>> getCafeMap() {
		return cafeMapper.getCafeMap();
	}

	@Override
	public List<CafeVO> getThemeList(CafeVO cafeVO) {
		return cafeMapper.getThemeList(cafeVO);
	}

	@Override
	public List<CafeVO> ThemeList(CafeVO cafeVO) {
		return cafeMapper.getThemeList(cafeVO);
	}

	@Override
	public List<CafeVO> AreaList(CafeVO cafeVO) {
		return cafeMapper.getAreaList(cafeVO);
	}

	@Override
	public void updateCafeState(AdminVO adminVO) {
		adminMapper.updateCafeState(adminVO);
		
	}

	@Override
	public List<CafeVO> memberThemeList(CafeVO cafeVO) {
		return cafeMapper.memberThemeList(cafeVO);
	}

	@Override
	public List<CafeVO> memberAreaList(CafeVO cafeVO) {
		return cafeMapper.memberAreaList(cafeVO);
	}

	@Override
	public CafeVO getLocation(CafeVO cafeVO) {
		return cafeMapper.getLocation(cafeVO);
	}

	@Override
	public void updateOpenClose(CafeVO cafeVO) {
		cafeMapper.updateOpenClose(cafeVO);
	}

	@Override
	public Integer getCafeOpenClose(String adminId) {
		return cafeMapper.getCafeOpenClose(adminId);
	}

	@Override
	public void updateCafeSubmit(String adminId) {
		cafeMapper.updateCafeSubmit(adminId);
	}

	@Override
	public List<Map<String, Object>> monthGetCafeMap() {
		return cafeMapper.monthGetCafeMap();
	}
	
	
}
