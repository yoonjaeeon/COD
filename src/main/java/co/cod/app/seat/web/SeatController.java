package co.cod.app.seat.web;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import co.cod.app.FileRenamePolicy;
import co.cod.app.Paging;
import co.cod.app.photo.PhotoVO;
import co.cod.app.photo.service.PhotoService;
import co.cod.app.seat.SeatVO;
import co.cod.app.seat.service.SeatService;


@Controller // @Component 빈등록 , 디스패쳐서블릿이 인식할수 있는 컨트롤러로 변환
public class SeatController {

	@Autowired
	SeatService seatService;
	@Autowired
	PhotoService photoService;
	
	// 등록폼
	@RequestMapping("insertSeatForm")
	public String insertFormSeat(SeatVO vo) {
		return "seat/insertSeat";
	}

	// 등록처리
	@RequestMapping("insertSeat")
	public String insertSeat(SeatVO seatVO, PhotoVO photoVO) throws IOException{
		    MultipartFile SeatThumbnail = seatVO.getUpload();
		      if(SeatThumbnail != null) {
		         String filename = SeatThumbnail.getOriginalFilename();
		         if (SeatThumbnail != null && SeatThumbnail.getSize() > 0) {
		            File upFile = FileRenamePolicy.rename(new 
		                  File("D:\\Dev\\git\\COD\\src\\main\\webapp\\resources\\upload", filename));
		            filename = upFile.getName();
		            SeatThumbnail.transferTo(upFile);
		         }
		         seatVO.setSeatThumbImg(filename);		      
		      }
		      MultipartFile[] files = photoVO.getUploadFile();
		      if (files != null) {
		         PhotoVO photoMaxVO = photoService.getPhotoMax();
		         for (MultipartFile file : files) {
		            String filename = file.getOriginalFilename();
		            if (file != null && file.getSize() > 0) {
		               File upFile = FileRenamePolicy
		                     .rename(new File("D:\\Dev\\git\\COD\\src\\main\\webapp\\resources\\upload", filename));
		               filename = upFile.getName();
		               file.transferTo(upFile);
		            }
		            photoVO.setPhotoName(filename);
		            photoVO.setPhotoUse(1);
		            photoVO.setPhotoGroup(photoMaxVO.getPhotoGroup());
		            photoService.insertPhoto(photoVO);
		         }
		         seatVO.setPhotogroup(photoMaxVO.getPhotoGroup());
		      }
		seatService.insertSeat(seatVO);
		// 서비스 호출
		return "redirect:adminSeat";
	}

	// 단건조회
	@RequestMapping("getSeat/{seatSeq}/{email}") // getSeat? Seatseq=aaaa
	public String getSeat(@PathVariable Integer seatSeq, @PathVariable String email) {
		System.out.println(seatSeq);
		System.out.println(email);
		return "main/home";
	}

	// 목록조회
	@RequestMapping("adminSeatList")
	public String SeatList(Model model, SeatVO seatVO) {
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

		seatVO.setStart(Integer.toString(paging.getFirst())); //start
		seatVO.setEnd(Integer.toString(paging.getLast())); //end
		
		model.addAttribute("seatList", seatService.getSeatList(seatVO));
		return "adminManage/adminSeat";
	}
	
	// 수정폼
	@RequestMapping("updateSeatForm")
	public String updateFormSeat(SeatVO seatVO, Model model) {
		model.addAttribute("seat", seatService.getSeat(seatVO));
		return "seat/updateSeat";
	}

	// 수정처리
	@RequestMapping("updateSeat")
	public String updateSeat(SeatVO seatVO) throws Exception {
		  MultipartFile[] files = seatVO.getUploadFile();
	      if (files != null) {
	         for (MultipartFile file : files) {
	            String filename = file.getOriginalFilename();
	            if (file != null && file.getSize() > 0) {
	               File upFile = FileRenamePolicy.rename(new 
	                     File("D:\\Dev\\git\\COD\\src\\main\\webapp\\resources\\upload", filename));
	               filename = upFile.getName();
	               file.transferTo(upFile);
	            }
	            seatVO.setSeatThumbImg(filename);
	         }
	      }
		seatService.updateSeat(seatVO);
		// 서비스 호출
		return "redirect:adminSeat";
	}

	// 삭제처리
	@RequestMapping("deleteSeat")
	public String deleteSeat(SeatVO seatVO, Model model) {

		seatService.deleteSeat(seatVO);
		// 서비스 호출
		return "redirect:adminSeat";
	}
}
