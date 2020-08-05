package co.cod.app.advertisement.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.advertisement.AdvertisementVO;
import co.cod.app.advertisement.mapper.AdvertisementMapper;
import co.cod.app.advertisement.service.AdvertisementService;

@Service
public class AdvertisementServiceImpl implements AdvertisementService {
	
	@Autowired
	AdvertisementMapper advertisementMapper;
	
	@Override
	public AdvertisementVO getAdvertisement(AdvertisementVO advertisementVO) {
		return advertisementMapper.getAdvertisement(advertisementVO);
	}

	@Override
	public List<AdvertisementVO> getAdvertisementList(AdvertisementVO advertisementVO) {
		return advertisementMapper.getAdvertisementList(advertisementVO);
	}
	
	@Override
	public List<Map<String, Object>> getAdvertisementMap() {
		return advertisementMapper.getAdvertisementMap();
	}

	@Override
	public void insertAdvertisement(AdvertisementVO advertisementVO) {
		advertisementMapper.insertAdvertisement(advertisementVO);
	}
	
	@Override
	public void updateAdvertisement(AdvertisementVO advertisementVO) {
		advertisementMapper.updateAdvertisement(advertisementVO);
	}

	@Override
	public void deleteAdvertisement(AdvertisementVO advertisementVO) {
		advertisementMapper.deleteAdvertisement(advertisementVO);
	}




		
}
