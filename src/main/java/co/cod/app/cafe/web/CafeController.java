package co.cod.app.cafe.web;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.cod.app.FileRenamePolicy;
import co.cod.app.admin.AdminVO;
import co.cod.app.admin.service.AdminService;
import co.cod.app.admin.worker.WorkerVO;
import co.cod.app.cafe.CafeVO;
import co.cod.app.cafe.service.CafeService;
import co.cod.app.menu.service.MenuService;
import co.cod.app.photo.PhotoVO;
import co.cod.app.photo.service.PhotoService;
import co.cod.app.review.ReviewVO;
import co.cod.app.review.service.ReviewService;
import co.cod.app.seat.SeatVO;
import co.cod.app.seat.service.SeatService;

@Controller
public class CafeController {

   @Autowired
   CafeService cafeService;
   @Autowired
   PhotoService photoService;
   @Autowired
   AdminService adminService;
   @Autowired
   MenuService menuService;
   @Autowired
   ReviewService reviewService;
   @Autowired
   SeatService seatService;

   /* 카페지역 리스트 */
   @RequestMapping("areaList")
   public String AreaList(CafeVO cafeVO, Model model, HttpSession session) {
      cafeVO.setEmail((String) session.getAttribute("loginEmail"));
      List list = cafeService.AreaList(cafeVO);
      model.addAttribute("getArea", list);
      return "memberList/memberAreaList";
   }

   /* 카페 테마 리스트 보여주게하기. */
   @RequestMapping("themeList")
   public String getThemeList(HttpSession session, CafeVO cafeVO, Model model) {
      cafeVO.setEmail((String) session.getAttribute("loginEmail"));
      List list = cafeService.getThemeList(cafeVO);
      model.addAttribute("getTheme", list);
      return "memberList/memberThemeList";
   }

   // 비회원 리스트 보여주기
   @RequestMapping("memberThemeList")
   public String MemberThemeList(HttpSession session, CafeVO cafeVO, Model model) {
      List list = cafeService.memberThemeList(cafeVO);
      model.addAttribute("getTheme", list);
      return "memberList/memberThemeList";
   }

   @RequestMapping("memberAreaList")
   public String MemberAreaList(CafeVO cafeVO, Model model, HttpSession session) {
      List list = cafeService.memberAreaList(cafeVO);
      model.addAttribute("getArea", list);
      return "memberList/memberAreaList";
   }
   // 비회원 리스트 끝

   /* 카페상세페이지 */
   @RequestMapping("cafe")
   public String cafe(Model model, CafeVO cafeVO, ReviewVO reviewVO, SeatVO seatVO, HttpSession session) {
      model.addAttribute("cafeDetail", cafeService.getCafe(cafeVO.getAdminId()));
      model.addAttribute("cafeMenu", menuService.getMenuList(cafeVO.getAdminId()));
      model.addAttribute("cafeLocation", cafeService.getLocation(cafeVO));
      model.addAttribute("reviewList", reviewService.getReviewList(reviewVO));
      model.addAttribute("seatList", seatService.getSeatList(seatVO.getAdminId()));
      return "cafe/cafeMain";
   }

   // 등록폼
   @RequestMapping("cafeInsertForm")
   public String insertCafeForm(CafeVO cafeVO) {
      return "ad/cafe/cafeInsertForm";
   }
   
   // 상태 대기 거절 창 
   
   
   // 카페등록
   @RequestMapping("insertCafe")
   public String insertCafe(CafeVO cafeVO, PhotoVO photoVO, HttpSession session) throws IOException {
      cafeVO.setAdminId((String) session.getAttribute("adminId"));
      AdminVO adminVO = new AdminVO();
      adminVO.setAdminId((String) session.getAttribute("adminId"));
      adminVO.setCafeState(1);
      MultipartFile cafeThumbnail = cafeVO.getUpload();
      if (cafeThumbnail != null) {
         String filename = cafeThumbnail.getOriginalFilename();
         if (cafeThumbnail != null && cafeThumbnail.getSize() > 0) {
            File upFile = FileRenamePolicy
                  .rename(new File("C:\\Dev\\git\\COD\\src\\main\\webapp\\resources\\upload", filename));
            filename = upFile.getName();
            cafeThumbnail.transferTo(upFile);
         }
         cafeVO.setCafeThumbnail(filename);
      }

      MultipartFile[] files = photoVO.getUploadFile();
      if (files != null) {
         PhotoVO photoMaxVO = photoService.getPhotoMax();
         for (MultipartFile file : files) {
            String filename = file.getOriginalFilename();
            if (file != null && file.getSize() > 0) {
               File upFile = FileRenamePolicy
                     .rename(new File("C:\\Dev\\git\\COD\\src\\main\\webapp\\resources\\upload", filename));
               filename = upFile.getName();
               file.transferTo(upFile);
            }
            photoVO.setPhotoName(filename);
            photoVO.setPhotoUse(1);
            photoVO.setPhotoGroup(photoMaxVO.getPhotoGroup());
            photoService.insertPhoto(photoVO);
         }
         cafeVO.setPhotoGroup(photoMaxVO.getPhotoGroup());
      }
      cafeService.insertCafe(cafeVO);
      adminService.updateCafeState(adminVO);
      return "e/admin/loading";
   }

   // 단건조회
   @RequestMapping("/getCafe/{cafeName}/{adminId}")
   public String getCafe(@PathVariable String cafeName, @PathVariable String adminId) {

      System.out.println(cafeName + " : " + adminId);
      return "main/home";
   }

   // 차트 JSON값
   @RequestMapping("adminSales")
   public @ResponseBody List<Map<String, Object>> getAdvertisementMap() {
      return cafeService.getCafeMap();
   }

   // 차트 불러옴

   @RequestMapping("adminSalesForm")
   public String masterSalesForm() {
      return "ad/adminOrder/adminSales";
   }
   
   @RequestMapping("monthAdminSales")
   public @ResponseBody List<Map<String, Object>> monthAdminSales(){
      return cafeService.monthGetCafeMap();
   }
   
   @RequestMapping("monthAdminSalesForm")
   public String monthAdminSalesForm() {
      return "ad/adminOrder/adminSales";
   }
   
   //카페on/off
   @RequestMapping(value="/cafeOpenClose",  method=RequestMethod.GET)
   @ResponseBody
   public Integer getCafeOpenClose(HttpSession session, Model model) {      
      return cafeService.getCafeOpenClose((String)session.getAttribute("adminId"));
   }
   // 카페 open/colse
   @RequestMapping(value="/cafeOpenClose" ,method=RequestMethod.PUT ,consumes="application/json")      
   @ResponseBody
   public void updateOpenClose(@RequestBody CafeVO cafeVO,HttpSession session, Model model) {
      cafeVO.setAdminId((String)session.getAttribute("adminId"));
      cafeService.updateOpenClose(cafeVO);
   }
   @RequestMapping("cafeUpdateForm")
   public String cafeUpdateForm(Model model, CafeVO cafeVO, HttpSession session) {
      model.addAttribute("getCafe", cafeService.getCafe((String)session.getAttribute("adminId")));
      return "ad/cafe/cafeUpdate";
   }
   
   @RequestMapping("cafeUpdate")
   public String cafeUpdate(Model model, CafeVO cafeVO, HttpSession session) {
      cafeVO.setAdminId((String)session.getAttribute("adminId"));
      cafeService.updateCafe(cafeVO);
      return "redirect:admin";
   }
   
}