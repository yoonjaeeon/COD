package co.cod.app.seat.web;

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
import co.cod.app.Paging;
import co.cod.app.seat.SeatVO;
import co.cod.app.seat.service.SeatService;
import co.cod.app.photo.service.PhotoService;

@Controller
public class SeatController {

	@Autowired
	SeatService seatService;
	@Autowired
	PhotoService photoService;

	// 등록폼
	@RequestMapping("seatForm")
	public String SeatForm() {
		return "adminManage/adminSeat";
	}

	// 등록
	@RequestMapping(value = "/seat", method = RequestMethod.POST, headers = ("content-type=multipart/*"))
	@ResponseBody
	public Map<String, Object> insertSeat(SeatVO seatVO, Model model, @RequestParam("upload") MultipartFile uploadfile,
			HttpSession session) throws IOException {
		String path = session.getServletContext().getRealPath("resources/upload");
		Map<String, Object> map = new HashMap<String, Object>();
		MultipartFile seatimg = seatVO.getUpload();
		if (seatimg != null) {
			String filename = seatimg.getOriginalFilename();
			if (seatimg != null && seatimg.getSize() > 0) {
				File upFile = FileRenamePolicy.rename(new File(path, filename));
				filename = upFile.getName();
				seatimg.transferTo(upFile);
			}
			seatVO.setSeatImg(filename);
		}
		seatService.insertSeat(seatVO);
		map.put("result", true);
		map.put("kkk", "재수없어");
		return map;
	}

	// 수정 폼
		@RequestMapping("UpdateSeatForm")
		public String UpdateSeatForm() {
			return "adminManage/adminSeat";
		}
	
	// 수정
	@RequestMapping(value = "/seat", method = RequestMethod.PUT, headers = ("content-type=multipart/*"))
	// 요청헤더
	@ResponseBody
	public SeatVO updateSeat(@RequestBody SeatVO seatVO, Model model, @RequestParam("upload") MultipartFile uploadfile,
			HttpSession session) throws IOException {
		String path = session.getServletContext().getRealPath("resources/upload");
		Map<String, Object> map = new HashMap<String, Object>();
		MultipartFile seatimg = seatVO.getUpload();
		if (seatimg != null) {
			String filename = seatimg.getOriginalFilename();
			if (seatimg != null && seatimg.getSize() > 0) {
				File upFile = new File(path, filename);/* FileRenamePolicy.rename(new File(path, filename)); */
				filename = upFile.getName();
				seatimg.transferTo(upFile);
			}
			seatVO.setSeatImg(filename);
		}
		seatService.updateSeat(seatVO);
		return seatVO;
	}

	// 삭제
	@RequestMapping(value = "/seat/{seatSeq}", method = RequestMethod.DELETE)
	@ResponseBody
	public Map<String, Object> deleteSeat(@PathVariable Integer seatSeq, SeatVO seatVO, Model model) {
		seatVO.setSeatSeq(seatSeq);
		seatService.deleteSeat(seatVO);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}

	// 단건조회
	@RequestMapping(value = "/seat/{seatSeq}", method = RequestMethod.GET)
	@ResponseBody
	public SeatVO getSeat(@PathVariable Integer seatSeq, SeatVO seatVO, Model model) {
		seatVO.setSeatSeq(seatSeq);
		return seatService.getSeat(seatVO);
	}

	// 전체조회
	@RequestMapping(value = "/seat", method = RequestMethod.GET)
	@ResponseBody
	public List<SeatVO> getSeatList(Model model, SeatVO seatVO, HttpSession session) {
//			SeatVO.setAdminId((String)session.getAttribute("adminId"));  // 세션수정 테스트
		// 페이징 처리
		// (현재 페이지 파라미터 받기)
		int p = 1;
		if (seatVO.getP() != null && !seatVO.getP().isEmpty()) {
			p = Integer.parseInt(seatVO.getP());
		}
		// (페이징 객체를 생성)
		Paging paging = new Paging();
		paging.setPageUnit(5); // 한 페이지에 출력할 레코드 건수
		paging.setPageSize(3); // 한 페이지에 출력할 페이지 번호 수
		paging.setPage(p); // 현재 페이지
		paging.setTotalRecord(seatService.getCount(seatVO)); // 전체 레코드 건수 조회
		model.addAttribute("paging", paging);

		seatVO.setStart(Integer.toString(paging.getFirst())); // start
		seatVO.setEnd(Integer.toString(paging.getLast())); // end
		return seatService.getSeatList(seatVO);
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
