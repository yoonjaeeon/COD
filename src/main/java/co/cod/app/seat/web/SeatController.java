package co.cod.app.seat.web;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.cod.app.FileRenamePolicy;
import co.cod.app.Paging;
import co.cod.app.inventory.InventoryVO;
import co.cod.app.photo.service.PhotoService;
import co.cod.app.seat.SeatVO;
import co.cod.app.seat.service.SeatService;

@Controller
public class SeatController {

	@Autowired
	SeatService seatService;
	@Autowired
	PhotoService photoService;

	// 등록폼
	@RequestMapping("seatForm")
	public String SeatForm() {
		return "ad/adminManage/adminSeat";
	}

	// 등록
	@RequestMapping(value = "/seat", method = RequestMethod.POST, headers = ("content-type=multipart/*"))
	@ResponseBody
	public Map<String, Object> insertSeat(SeatVO seatVO, Model model, HttpSession session) throws IOException {
		String path = session.getServletContext().getRealPath("resources/upload");
		seatVO.setAdminId((String)session.getAttribute("adminId"));	
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
		return map;
	}

	// 수정
	@RequestMapping(value = "/seatup", method = RequestMethod.POST, headers = ("content-type=multipart/*"))
	// 요청헤더
	@ResponseBody
	public Map<String, Object> updateSeat(SeatVO seatVO, Model model, HttpSession session) throws IOException {
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
		return Collections.singletonMap("result", true);
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
	public List<SeatVO> getSeatList(Model model, HttpSession session) {
		return seatService.getSeatList((String) session.getAttribute("adminId"));
	}
	
	//좌석상태 업데이트
	@RequestMapping(value="/seatsetting" ,method=RequestMethod.PUT ,consumes="application/json")	   
	@ResponseBody
	public SeatVO seatsetting(@RequestBody SeatVO seatVO, Model model) {
		seatService.updateSeatReserve(seatVO);
		return  seatVO;
	}
	@RequestMapping(value="/seatReserve" ,method=RequestMethod.PUT ,consumes="application/json")	   
	@ResponseBody
	public SeatVO seatReserve(@RequestBody SeatVO seatVO, Model model) {
		seatService.updateSeatReserve(seatVO);
		return  seatVO;
	}
}
