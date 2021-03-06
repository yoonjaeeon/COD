package co.cod.app.cafe.mapper;

import java.util.List;
import java.util.Map;

import co.cod.app.cafe.CafeVO;

public interface CafeMapper {

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
   public List<CafeVO> getAreaList(CafeVO cafeVO);
   public List<CafeVO> memberThemeList(CafeVO cafeVO);
   public List<CafeVO> memberAreaList(CafeVO cafeVO);
   public CafeVO getLocation(CafeVO cafeVO);
   //카페 on off
   public Integer getCafeOpenClose(String adminId);
   public void updateOpenClose(CafeVO cafeVO);
   public void updateCafeSubmit(String adminId);
   public CafeVO adminNotice(CafeVO cafeVO);
   public List<CafeVO> getRandomList(CafeVO cafeVO);
   public List<CafeVO> selectCafe(CafeVO cafeVO);
   

   
}