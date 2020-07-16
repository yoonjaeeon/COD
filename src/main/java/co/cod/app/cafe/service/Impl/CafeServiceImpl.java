package co.cod.app.cafe.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.cafe.CafeVO;
import co.cod.app.cafe.mapper.CafeMapper;
import co.cod.app.cafe.service.CafeService;


@Service
public class CafeServiceImpl implements CafeService{

	@Autowired CafeMapper cafeMapper;
	
	//단건조회
	@Override
	public CafeVO getCafe(CafeVO cafeVO) {
		return cafeMapper.getCafe(cafeVO);
	}
     //전체조회
	@Override
	public List<CafeVO> getCafeList(CafeVO cafeVO) {
	System.out.println("getEmpLis 서비스호출");
		return cafeMapper.getCafeList(cafeVO);
	}
	
	//등록
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


}
