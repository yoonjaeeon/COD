package co.cod.app.advertisement.service;

import java.util.List;
import java.util.Map;

import co.cod.app.advertisement.AdvertisementVO;

public interface AdvertisementService {
	public AdvertisementVO getAdvertisement(AdvertisementVO advertisementVO);
	public List<AdvertisementVO> getAdvertisementList(AdvertisementVO advertisementVO);
	public void insertAdvertisement(AdvertisementVO advertisementVO);
	public void deleteAdvertisement(AdvertisementVO advertisementVO);
	public void updateAdvertisement(AdvertisementVO advertisementVO);
	public List<Map<String, Object>> getAdvertisementMap();
	public List<Map<String, Object>> monthAdvertisementMap();
}
