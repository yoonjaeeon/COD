package co.cod.app.cafe.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.admin.AdminVO;
import co.cod.app.admin.mapper.AdminMapper;
import co.cod.app.cafe.CafeVO;
import co.cod.app.cafe.mapper.CafeMapper;
import co.cod.app.cafe.service.CafeService;
import co.cod.app.member.mapper.MemberMapper;


@Service
public class CafeServiceImpl implements CafeService{

   @Autowired 
   CafeMapper cafeMapper;
   
   @Autowired
   AdminMapper adminMapper;
   
   @Autowired
   MemberMapper memberMapper;
   
   

   @Override
public CafeVO getCafe(CafeVO cafeVO) {
	return cafeMapper.getCafe(cafeVO);
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
   public void deleteCafe(String adminId) {
      cafeMapper.deleteCafe(adminId);   
   }

   
   @Override
   public List<Map<String, Object>> getCafeMap(CafeVO cafeVO) {
      return cafeMapper.getCafeMap(cafeVO);
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
   public List<Map<String, Object>> monthGetCafeMap(CafeVO cafeVO) {
      return cafeMapper.monthGetCafeMap(cafeVO);
   }

@Override
public CafeVO adminNotice(CafeVO cafeVO) {
	return cafeMapper.adminNotice(cafeVO);
}

@Override
public List<CafeVO> getRandomList(CafeVO cafeVO) {	
	return  cafeMapper.getRandomList(cafeVO);
}

@Override
public List<Map<String, Object>> dayGetCafeMap(CafeVO cafeVO) {
	return cafeMapper.dayGetCafeMap(cafeVO);
}

@Override
public List<CafeVO> selectCafe(CafeVO cafeVO) {
	return cafeMapper.selectCafe(cafeVO);
}
   
   

}