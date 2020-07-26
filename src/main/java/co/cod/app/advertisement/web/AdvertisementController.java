package co.cod.app.advertisement.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.cod.app.FileRenamePolicy;
import co.cod.app.advertisement.AdvertisementVO;
import co.cod.app.advertisement.service.AdvertisementService;
import co.cod.app.photo.service.PhotoService;

@Controller
public class AdvertisementController {
	
	@Autowired
	AdvertisementService advertisementService;

	
	@Autowired
	PhotoService photoService;
	
	// 등록폼
	@RequestMapping("advertisementForm")
	public String advertisementForm() {
		return "ma/advertisement/advertisementList";
	}
	

		
	//등록
		@RequestMapping(value="/advert", method=RequestMethod.POST, headers = ("content-type=multipart/*"))	            
		@ResponseBody
		public Map<String, Object> insertAdvertisement(AdvertisementVO advertisementVO, Model model
				//,@RequestParam("upload")MultipartFile uploadfile
				) throws IOException {		
			Map<String, Object> map = new HashMap<String, Object>();
//			MultipartFile file = advertisementVO.getUpload();
//	        String filename = file.getOriginalFilename();
//	        if (file != null && file.getSize() > 0) {
//	            File upFile = FileRenamePolicy
//	                  .rename(new File("C:\\Users\\User\\git\\COD\\src\\main\\webapp\\resources\\upload", filename));
//	            filename = upFile.getName();
//	            file.transferTo(upFile);
//	            advertisementVO.setAdvertiseFile(filename);
//	         }
		    advertisementService.insertAdvertisement(advertisementVO);
		    map.put("result", true);
		    map.put("kkk","재수없어");	
		    return  map;
			}

	//수정
	@RequestMapping(value="/advert"
			,method=RequestMethod.PUT
			,consumes="application/json" )
	//요청헤더	   
	@ResponseBody
	public AdvertisementVO updateAdvertisement(@RequestBody AdvertisementVO advertisementVO, Model model) {
		advertisementService.updateAdvertisement(advertisementVO);
		return  advertisementVO;
	}	
			
			
	//삭제
	@RequestMapping(value="/advert/{advertiseSeq}", method=RequestMethod.DELETE)
	@ResponseBody
	public Map<String, Object>deleteAdvertisement( @PathVariable Integer advertiseSeq, AdvertisementVO advertisementVO, Model model) {
		advertisementVO.setAdvertiseSeq(advertiseSeq);
		advertisementService.deleteAdvertisement(advertisementVO);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}
		
	//단건조회
	@RequestMapping(value="/advert/{advertiseSeq}",  method=RequestMethod.GET)
	@ResponseBody
	public AdvertisementVO getAdvertisement(@PathVariable Integer advertiseSeq, AdvertisementVO advertisementVO, Model model) {
		advertisementVO.setAdvertiseSeq(advertiseSeq);
		return  advertisementService.getAdvertisement(advertisementVO);
	}
			
			
	//전체조회
	@RequestMapping(value="/advert", method=RequestMethod.GET)
	@ResponseBody
	public List<AdvertisementVO> getAdvertisementList(Model model, AdvertisementVO advertisementVO,HttpSession session) {
//			advertisementVO.setAdminId((String)session.getAttribute("adminId"));  // 세션수정 테스트
		return advertisementService.getAdvertisementList(advertisementVO);	
	}	
			

	/*
	 * @RequestMapping(value="/respAPI")
	 * 
	 * @ResponseBody public Map respAPI() { RestTemplate rest = new RestTemplate();
	 * return rest.getForObject(
	 * "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=430156241533f1d058c603178cc3ca0e&targetDt=20200713",
	 * Map.class); }
	 */
}
