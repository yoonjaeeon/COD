package co.cod.app.cafe.web;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import co.cod.app.FileRenamePolicy;
import co.cod.app.cafe.CafeVO;
import co.cod.app.cafe.service.CafeService;

@Controller
public class CafeController {

	@Autowired
	CafeService cafeService;

//	@RequestMapping("insertCafe") // 등록폼
//	public String insertFormCafe(HttpSession session, HttpServletRequest request, CafeVO cafeVO, Model  model) throws IOException {
//		cafeVO.setAdminId("lee");
//		cafeVO.setAnimal(1);
//		cafeVO.setBeam(1);
//		cafeVO.setBigSeat(1);
//		cafeVO.setCafeAddress("대구광역시 중구");
//		cafeVO.setCafeAskContent("얼마 후에 등록될까요?");
//	    cafeVO.setCafeCloseday("매주 월요일");
//	    cafeVO.setCafeHashtag("야경,풍경");
//	    cafeVO.setCafeName("예담커피");
//	    cafeVO.setCafePhone("01045102299");
//	    cafeVO.setCafeTheme("t1");
//		cafeVO.setCafeTime("09:00~23:00");
//		cafeVO.setCharger(1);
//		cafeVO.setLend(1);
//		cafeVO.setNokid(0);
//		cafeVO.setParking(1);
//		cafeVO.setWifi(1);
//		cafeVO.setCafeThumbnail("사진");
//		cafeVO.setPhtotGroup(1);
//		MultipartFile[] files = cafeVO.getUploadFile();
//		for(MultipartFile file : files) {
//			String filename="";
//			if (file != null && file.getSize() >0) {
//				File upFile = FileRenamePolicy.rename(new File("c:upload",filename));
//				filename = upFile.getName();
//				file.transferTo(upFile);
//			}
//			cafeVO.setProfile(filename);
//		}	
//		 cafeService.insertCafe(cafeVO);
//		return "redirect:ad/cafe/cafeInsert";
//	}
		
	//등록폼
	@RequestMapping("cafeInsertForm")
	public String insertCafeForm(CafeVO cafeVO) {
		return "ad/cafe/cafeInsertForm";
	}

	//등록처리
	@RequestMapping("insertCafe")
	public String insertCafe(@ModelAttribute("evo")CafeVO cafeVO
	)throws IOException{
		MultipartFile[] files = cafeVO.getUploadFile();
		for(MultipartFile file : files) {
			String filename="";
			if (file != null && file.getSize() >0) {
				File upFile = FileRenamePolicy.rename(new File("c:upload",filename));
				filename = upFile.getName();
				file.transferTo(upFile);
			}
			cafeVO.setProfile(filename);
		}	
		 cafeService.insertCafe(cafeVO);
		return "redirect:ad/admin/adminMain";
	}
		
	//단건조회
	@RequestMapping("/getCafe/{cafeName}/{adminId}")
	public String getCafe(@PathVariable String cafeName, @PathVariable String adminId ){
	System.out.println(cafeName+" : "+ adminId);
	return "main/home";
	}
	
	
}	
	