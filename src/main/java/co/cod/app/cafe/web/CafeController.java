package co.cod.app.cafe.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import co.cod.app.FileRenamePolicy;
import co.cod.app.admin.AdminVO;
import co.cod.app.admin.service.AdminService;
import co.cod.app.cafe.CafeVO;
import co.cod.app.cafe.service.CafeService;
import co.cod.app.photo.PhotoVO;
import co.cod.app.photo.service.PhotoService;

@Controller
public class CafeController {

	@Autowired
	CafeService cafeService;
	@Autowired
	PhotoService photoService;
	@Autowired
	AdminService adminService;

	/* 카페지역 리스트 */
	@RequestMapping("areaList")
	public String AreaList(CafeVO cafeVO, Model model, HttpSession session) {
		System.out.println(session.getAttribute("loginId"));
		System.out.println("===============");
		List list = cafeService.AreaList(cafeVO);
		model.addAttribute("getArea", list);
		return "memberList/memberAreaList";
	}

	/* 카페 테마 리스트 보여주게하기. */
	@RequestMapping("themeList")
	public String getThemeList(HttpSession session, CafeVO cafeVO, Model model) {
		cafeVO.setEmail((String)session.getAttribute("loginEmail")); 
		List list = cafeService.getThemeList(cafeVO);
		model.addAttribute("getTheme", list);
		return "memberList/memberThemeList";
	}

	/* 카페상세페이지 */
	@RequestMapping("cafe")
	public String cafe(Model model, CafeVO cafeVO, HttpSession session) {
		model.addAttribute("cafeDetail", cafeService.getCafe(cafeVO));
		return "cafe/cafeMain";
	}

	// 등록폼
	@RequestMapping("cafeInsertForm")
	public String insertCafeForm(CafeVO cafeVO) {
		return "ad/cafe/cafeInsertForm";
	}

	// 카페등록
	@RequestMapping("insertCafe")
	   public String insertCafe(/* @ModelAttribute("evo") */CafeVO cafeVO, PhotoVO photoVO,HttpSession session) throws IOException {
	    cafeVO.setAdminId((String)session.getAttribute("adminId")); 
	    AdminVO adminVO = new AdminVO();
	    adminVO.setAdminId((String)session.getAttribute("adminId"));
	    adminVO.setCafeState(1);
		MultipartFile cafeThumbnail = cafeVO.getUpload();
	      if (cafeThumbnail != null) {
	         String filename = cafeThumbnail.getOriginalFilename();
	         if (cafeThumbnail != null && cafeThumbnail.getSize() > 0) {
	            File upFile = FileRenamePolicy
	                  .rename(new File("C:\\Users\\User\\git\\COD\\src\\main\\webapp\\resources\\upload", filename));
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
	                     .rename(new File("C:\\Users\\User\\git\\COD\\src\\main\\webapp\\resources\\upload", filename));
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
	      return "e/cafe/cafeWaiting"; 
	   }

	// 단건조회
	@RequestMapping("/getCafe/{cafeName}/{adminId}")
	public String getCafe(@PathVariable String cafeName, @PathVariable String adminId) {
		System.out.println(cafeName + " : " + adminId);
		return "main/home";
	}

	@RequestMapping("cafeOrder")
	public String cafeOrder() {
		return "cafe/cafeOrder";
	}

}