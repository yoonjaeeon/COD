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
   public void deleteCafe(String adminId);
   public List<Map<String, Object>> getCafeMap(CafeVO cafeVO);
   public List<Map<String, Object>> monthGetCafeMap(CafeVO cafeVO);
   public List<Map<String, Object>> dayGetCafeMap(CafeVO cafeVO);
   public List<CafeVO> getThemeList(CafeVO cafeVO);   
   public List<CafeVO> ThemeList(CafeVO cafeVO);
   public List<CafeVO> AreaList(CafeVO cafeVO);
   public void updateCafeState(AdminVO adminVO);
   public List<CafeVO> memberThemeList(CafeVO cafeVO);
   public List<CafeVO> memberAreaList(CafeVO cafeVO);
   public CafeVO getLocation(CafeVO cafeVO);
//   카페 on off
   public Integer getCafeOpenClose(String adminId);
   public void updateOpenClose(CafeVO cafeVO);
   public void updateCafeSubmit(String adminId);
   //공지사항
   public CafeVO adminNotice(CafeVO cafeVO);
  
   // 테마별 리스트에서 랜덤으로 카페 조회 
   public List<CafeVO> getRandomList(CafeVO cafeVO);
   //카페 업데이트 할때 cafe_state 변경
  // public void updateCafeState(CafeVO cafeVO);
   public List<CafeVO> selectCafe(CafeVO cafeVO); //카페 검색
   
}