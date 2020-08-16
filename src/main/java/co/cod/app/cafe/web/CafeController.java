package co.cod.app.cafe.web;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriComponentsBuilder;

import co.cod.app.FileRenamePolicy;
import co.cod.app.admin.AdminVO;
import co.cod.app.admin.service.AdminService;
import co.cod.app.cafe.CafeVO;
import co.cod.app.cafe.service.CafeService;
import co.cod.app.menu.service.MenuService;
import co.cod.app.photo.PhotoVO;
import co.cod.app.photo.service.PhotoService;
import co.cod.app.review.ReviewVO;
import co.cod.app.review.service.ReviewService;
import co.cod.app.seat.SeatVO;
import co.cod.app.seat.service.SeatService;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;





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
	@Autowired
	@Qualifier("dataSourceSpied")
	DataSource datasource;


	/* 카페지역 리스트 */
	@RequestMapping("areaList")
	public String AreaList(CafeVO cafeVO, Model model, HttpSession session) {
		cafeVO.setEmail((String) session.getAttribute("loginEmail"));
		List list = cafeService.AreaList(cafeVO);
		/*
		 * ArrayList<String> area = new ArrayList<>(); area.add("location");
		 * area.add("중구"); area.add("남구"); area.add("서구"); area.add("북구");
		 * area.add("동구"); area.add("수성구"); area.add("달서구"); area.add("달성군");
		 */
		model.addAttribute("getArea", list);
		//model.addAttribute("areas",area);
		return "memberList/memberAreaList";
	}

	@RequestMapping("cafeList")
	public String cafeList(Model model ,HttpSession session,CafeVO cafeVO, AdminVO adminVO) {			
		model.addAttribute("cafeList",cafeService.getCafe(cafeVO));
		return "ma/cafe/cafeList";
	}
	
	/* 카페 테마 리스트 보여주게하기. */
	@RequestMapping("themeList")
	public String getThemeList(HttpSession session, CafeVO cafeVO, Model model) {
		cafeVO.setEmail((String) session.getAttribute("loginEmail"));
		List list = cafeService.getThemeList(cafeVO);
		model.addAttribute("getTheme", list);
		return "memberList/memberThemeList";
	}
//	// 카페 랜덤으로 보여주기 
//	@RequestMapping("memberRandomList")
//	public static String getRandomList(HttpSession session, CafeVO cafeVO, Model model, int len) {
//        String randomStr = "abcdefghijklmnopqrstuvwxyz123456789";
//        StringBuffer strB = new StringBuffer();
//        Random random =  CafeController.current();
//         for (int i = 0; i < len; i++) {
//            int rdIdx = random.nextInt(35);
//            strB.append(randomStr.substring(rdIdx, rdIdx + 1));
//        }
//        return strB.toString();
//
//    }
	/* 카페 테마 리스트 보여주게하기. */
	@RequestMapping("getRandomList")
	public String getRandomList(HttpSession session, CafeVO cafeVO, Model model) {
		cafeVO.setEmail((String) session.getAttribute("loginEmail"));
		List list = cafeService.getRandomList(cafeVO);
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
	public String cafe(Model model, CafeVO cafeVO, ReviewVO reviewVO,PhotoVO photoVO, SeatVO seatVO, HttpSession session) {
		cafeVO.setEmail((String) session.getAttribute("loginEmail"));
		cafeVO =cafeService.getCafe(cafeVO);
		model.addAttribute("cafeDetail", cafeVO);
		model.addAttribute("cafeMenu", menuService.getMenuList(cafeVO.getAdminId()));
		model.addAttribute("cafeLocation", cafeService.getLocation(cafeVO));
		model.addAttribute("reviewList", reviewService.getReviewList(reviewVO));
		model.addAttribute("seatList", seatService.getSeatList(seatVO.getAdminId()));
		model.addAttribute("adminNotice", cafeService.adminNotice(cafeVO));	
		if(cafeVO.getPhotoGroup() != null) {
			photoVO.setPhotoGroup(cafeVO.getPhotoGroup());
			model.addAttribute("fileList", photoService.getPhotoList(photoVO));
		}
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
		String pathSet = session.getServletContext().getRealPath("resources/upload");
		if (cafeThumbnail != null) {
			String filename = cafeThumbnail.getOriginalFilename();
			if (cafeThumbnail != null && cafeThumbnail.getSize() > 0) {
				File upFile = FileRenamePolicy
						.rename(new File(pathSet, filename));
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
							.rename(new File(pathSet, filename));
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
	public @ResponseBody List<Map<String, Object>> getAdvertisementMap(HttpSession session, CafeVO cafeVO) {
		cafeVO.setAdminId((String)session.getAttribute("adminId"));
		return cafeService.getCafeMap(cafeVO);
	}

	// 차트 불러옴

	@RequestMapping("adminSalesForm")
	public String masterSalesForm() {
		return "ad/adminOrder/adminSales";
	}

	@RequestMapping("monthAdminSalesForm")
	public String monthAdminSalesForm(CafeVO cafeVO) {
		return "ad/adminOrder/adminSales";
	}
	
	@RequestMapping("monthAdminSales")
	public @ResponseBody List<Map<String, Object>> monthAdminSales(HttpSession session, CafeVO cafeVO) {
		cafeVO.setAdminId((String)session.getAttribute("adminId"));
		return cafeService.monthGetCafeMap(cafeVO);
	}
	
	@RequestMapping("dayAdminSalesForm")
	public String dayAdminSalesForm(CafeVO cafeVO) {
		return "ad/adminOrder/adminSales";
	}
	
	@RequestMapping("dayAdminSales")
	public @ResponseBody List<Map<String, Object>> dayAdminSales(HttpSession session, CafeVO cafeVO) {
		cafeVO.setAdminId((String)session.getAttribute("adminId"));
		return cafeService.dayGetCafeMap(cafeVO);
	}
	

	// 카페on/off
	@RequestMapping(value = "/cafeOpenClose", method = RequestMethod.GET)
	@ResponseBody
	public Integer getCafeOpenClose(HttpSession session, Model model) {
		return cafeService.getCafeOpenClose((String) session.getAttribute("adminId"));
	}

	// 카페 open/colse
	@RequestMapping(value = "/cafeOpenClose", method = RequestMethod.PUT, consumes = "application/json")
	@ResponseBody
	public void updateOpenClose(@RequestBody CafeVO cafeVO, HttpSession session, Model model) {
		cafeVO.setAdminId((String) session.getAttribute("adminId"));
		cafeService.updateOpenClose(cafeVO);

	}

	@RequestMapping("cafeUpdateForm")
	public String cafeUpdateForm(Model model, CafeVO cafeVO, PhotoVO photoVO, HttpSession session) {
		cafeVO.setAdminId((String) session.getAttribute("adminId"));
		cafeVO=cafeService.getCafe(cafeVO);
		model.addAttribute("getCafe",cafeVO );
		if (cafeVO.getPhotoGroup() != null) {
			photoVO.setPhotoGroup(cafeVO.getPhotoGroup());
			model.addAttribute("fileList", photoService.getPhotoList(photoVO));
			System.out.println("확인" + photoVO);
		}
		
		return "ad/cafe/cafeUpdate";
	}

	@RequestMapping("cafeUpdate")
	public String cafeUpdate(Model model, CafeVO cafeVO, PhotoVO photoVO, HttpSession session) throws Exception, IOException {
		cafeVO.setAdminId((String) session.getAttribute("adminId"));
		MultipartFile cafeThumbnail = cafeVO.getUpload();
		String pathSet = session.getServletContext().getRealPath("resources/upload");
		if (cafeThumbnail != null) {
			String filename = cafeThumbnail.getOriginalFilename();
			if (cafeThumbnail != null && cafeThumbnail.getSize() > 0) {
				File upFile = FileRenamePolicy
						.rename(new File(pathSet, filename));
				System.out.println(upFile.getAbsolutePath()+"확==============================");
				filename = upFile.getName();    
				cafeThumbnail.transferTo(upFile);
			}
			cafeVO.setCafeThumbnail(filename);
		}

		MultipartFile[] files = photoVO.getUploadFile();
		System.out.println(files.length+"확==============================");
		if (files != null && files.length>0 && files[0].getSize()>0 ) {
			PhotoVO photoMaxVO = photoService.getPhotoMax();
			for (MultipartFile file : files) {
				String filename = file.getOriginalFilename();
				if (file != null && file.getSize() > 0) {
					File upFile = FileRenamePolicy
							.rename(new File(pathSet, filename));

					System.out.println(upFile.getAbsolutePath()+"확==============================");
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
		cafeService.updateCafe(cafeVO);
		AdminVO adminVO = new AdminVO();
		adminVO.setAdminId((String) session.getAttribute("adminId"));
		adminVO.setCafeState(2);
		adminService.updateCafeState(adminVO);
		return "redirect:admin";
	}

	@RequestMapping("report.do")
	public void report(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = datasource.getConnection();
		InputStream jasperStream = getClass().getResourceAsStream("/reports/bills.jasper");
		JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream);
		// 파라미터 맵
		HashMap<String, Object> map = new HashMap<>();
		map.put("p_orderSeq", request.getParameter("orderSeq"));

		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, map, conn);
		JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());

	}
	//삭제
	@RequestMapping(value="/adminList/{adminId}", method=RequestMethod.DELETE)
	@ResponseBody
	public Map<String, Object>deleteCafe(@PathVariable String adminId,  Model model, HttpSession session) {
		cafeService.deleteCafe(adminId);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}
	
	//사업자 번호 받아오기
	@RequestMapping("checkBus")
    public  void checkBus(@RequestParam String value,HttpServletResponse res) throws IOException {
		value = value.replaceAll("-", "");
        res.setContentType("text/xml; charset=UTF-8");
        String url = "https://teht.hometax.go.kr/wqAction.do?actionId=ATTABZAA001R08";
        RestTemplate template = new RestTemplate(new HttpComponentsClientHttpRequestFactory());

        URI uri = UriComponentsBuilder.fromUriString(url).buildAndExpand().encode().toUri(); 

        String prop = "<map id=\"ATTABZAA001R08\">" + 
                "<pubcUserNo/>" + 
                "<mobYn>N</mobYn>" + 
                "<inqrTrgtClCd>1</inqrTrgtClCd>" + 
                "<txprDscmNo>"+value+"</txprDscmNo>" + 
                "<dongCode>15</dongCode>" + 
                "<psbSearch>Y</psbSearch>" + 
                "<map id=\"userReqInfoVO\"/>" + 
                "</map>";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.TEXT_XML);
        HttpEntity<String> request = new HttpEntity<>(prop, headers);
        String result = template.postForObject(url, request, String.class);
        res.getWriter().print(result);
    }
	
	@RequestMapping("selectCafe")
	public String selectCafe(CafeVO cafeVO, Model model,HttpSession session){
		cafeVO.setEmail((String)session.getAttribute("loginEmail"));
		List list = cafeService.selectCafe(cafeVO);
		model.addAttribute("search", cafeVO.getSearch());
		model.addAttribute("sCafe", list);
		return "member/selectCafe";
	}

}