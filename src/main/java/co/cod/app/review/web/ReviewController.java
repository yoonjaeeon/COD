package co.cod.app.review.web;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import co.cod.app.FileRenamePolicy;
import co.cod.app.Paging;
import co.cod.app.cafe.CafeVO;
import co.cod.app.photo.PhotoVO;
import co.cod.app.photo.service.PhotoService;
import co.cod.app.review.ReviewVO;
import co.cod.app.review.service.ReviewService;

@Controller // @Component 빈등록 , 디스패쳐서블릿이 인식할수 있는 컨트롤러로 변환
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	@Autowired
	PhotoService photoService;

	// 등록폼
	@RequestMapping("insertFormReview")
	public String insertFormreview(ReviewVO vo) {
		return "review/insertReview";
	}

	// 등록처리
	@RequestMapping("insertReview")
	public String insertreview(ReviewVO reviewVO, PhotoVO photoVO, HttpSession session) throws IOException {
		MultipartFile reviewThumbnail = reviewVO.getUpload();
		if (reviewThumbnail != null) {
			String filename = reviewThumbnail.getOriginalFilename();
			if (reviewThumbnail != null && reviewThumbnail.getSize() > 0) {
				File upFile = FileRenamePolicy
						.rename(new File("C:\\Dev\\git\\COD\\src\\main\\webapp\\resources\\upload", filename));
				filename = upFile.getName();
				reviewThumbnail.transferTo(upFile);
			}
			reviewVO.setGdsThumbImg(filename);
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
			reviewVO.setPhotoGroup(photoMaxVO.getPhotoGroup());
		}
		reviewVO.setEmail((String)session.getAttribute("loginEmail"));
		reviewService.insertReview(reviewVO);
		// 서비스 호출
		return "redirect:memberReviewList";
	}

	// 단건조회
	@RequestMapping("getReview/{reviewSeq}/{email}") // getreview? reviewseq=aaaa
	public String getReview(@PathVariable Integer reviewSeq, @PathVariable String email) {
		System.out.println(reviewSeq);
		System.out.println(email);
		return "main/home";
	}

	// 목록조회
	@RequestMapping("memberReviewList")
	public String reviewList(Model model, ReviewVO reviewVO, HttpSession session) {
		// 페이징 처리
		// (현재 페이지 파라미터 받기)
		int p = 1;
		if (reviewVO.getP() != null && !reviewVO.getP().isEmpty()) {
			p = Integer.parseInt(reviewVO.getP());
		}
		// (페이징 객체를 생성)
		Paging paging = new Paging();   
		paging.setPageUnit(5); // 한 페이지에 출력할 레코드 건수
		paging.setPageSize(3); // 한 페이지에 출력할 페이지 번호 수
		paging.setPage(p); // 현재 페이지
		reviewVO.setEmail((String)session.getAttribute("loginEmail"));
		paging.setTotalRecord(reviewService.getCount(reviewVO)); // 전체 레코드 건수 조회
		model.addAttribute("paging", paging);

		reviewVO.setStart(Integer.toString(paging.getFirst())); // start
		reviewVO.setEnd(Integer.toString(paging.getLast())); // end
	
		
		model.addAttribute("reviewList", reviewService.adminReviewList(reviewVO));
		return "memberList/memberReviewList";
	}

	// 관리자 리뷰 리스트
	@RequestMapping("adminReviewList")
	public String adminReviewList(Model model, ReviewVO reviewVO, HttpSession session) {
		// 페이징 처리 
		// (현재 페이지 파라미터 받기)
		int p = 1;
		if (reviewVO.getP() != null && !reviewVO.getP().isEmpty()) {
			p = Integer.parseInt(reviewVO.getP());
		}
		// (페이징 객체를 생성)
		Paging paging = new Paging();   
		paging.setPageUnit(5); // 한 페이지에 출력할 레코드 건수
		paging.setPageSize(3); // 한 페이지에 출력할 페이지 번호 수
		paging.setPage(p); // 현재 페이지
		reviewVO.setAdminId((String)session.getAttribute("adminId"));
		paging.setTotalRecord(reviewService.getCount(reviewVO)); // 전체 레코드 건수 조회
		model.addAttribute("paging", paging);

		reviewVO.setStart(Integer.toString(paging.getFirst())); // start
		reviewVO.setEnd(Integer.toString(paging.getLast())); // end

		model.addAttribute("adminReviewList", reviewService.adminReviewList(reviewVO));
		model.addAttribute("getReviewAvg", reviewService.getReviewAvg(reviewVO.getAdminId()));
		return "ad/adminCommunity/adminReviewList";
	}
	

	// 카페상세 리뷰 리스트
	@RequestMapping("cafeReviewList")
	public String cafeReviewList(Model model, ReviewVO reviewVO) {
		model.addAttribute("cafeReviewList", reviewService.getReviewList(reviewVO));
		return "e/review/cafeReviewList";
	}

	// 수정폼
	@RequestMapping("updateFormReview")
	public String updateFormreview(ReviewVO reviewVO, Model model, PhotoVO photoVO) {
		reviewVO = reviewService.getReview(reviewVO);
		model.addAttribute("review", reviewVO);
		if (reviewVO.getPhotoGroup() != null) {
			photoVO.setPhotoGroup(reviewVO.getPhotoGroup());
			model.addAttribute("fileList", photoService.getPhotoList(photoVO));
		}
		return "review/updateReview";
	}

	// 수정처리
	@RequestMapping("updateReview")
	public String updatereview(ReviewVO reviewVO, PhotoVO photoVO) throws Exception {
		MultipartFile reviewThumbnail = reviewVO.getUpload();
		if (reviewThumbnail != null) {
			String filename = reviewThumbnail.getOriginalFilename();
			if (reviewThumbnail != null && reviewThumbnail.getSize() > 0) {
				File upFile = new File("C:\\Dev\\git\\COD\\src\\main\\webapp\\resources\\upload", filename);
				/*
				 * FileRenamePolicy.rename(new
				 * File("D:\\Dev\\git\\COD\\src\\main\\webapp\\resources\\upload", filename));
				 */
				filename = upFile.getName();
				reviewThumbnail.transferTo(upFile);
			}
			reviewVO.setGdsThumbImg(filename);
		}
		MultipartFile[] files = photoVO.getUploadFile();
		if (files != null) {
			PhotoVO photoMaxVO = photoService.getPhotoMax();
			for (MultipartFile file : files) {
				String filename = file.getOriginalFilename();
				if (file != null && file.getSize() > 0) {
					File upFile = new File("C:\\Dev\\git\\COD\\src\\main\\webapp\\resources\\upload", filename);
					// FileRenamePolicy.rename(new
					// File("D:\\Dev\\git\\COD\\src\\main\\webapp\\resources\\upload", filename));
					filename = upFile.getName();
					file.transferTo(upFile);
					photoVO.setPhotoName(filename);
					photoVO.setPhotoUse(1);
					photoVO.setPhotoGroup(photoMaxVO.getPhotoGroup());
					photoService.insertPhoto(photoVO);
					reviewVO.setPhotoGroup(photoMaxVO.getPhotoGroup());
				}
			}
		}
		reviewService.updateReview(reviewVO);
		// 서비스 호출
		return "redirect:memberReviewList";
	}

	// 삭제처리
	@RequestMapping("deleteReview")
	public String deletereview(ReviewVO reviewVO, Model model) {

		reviewService.deleteReview(reviewVO);
		// 서비스 호출
		return "redirect:memberReviewList";
	}
	
	// 관리자 리뷰 삭제 처리
		@RequestMapping("adminDeleteReview")
		public String adminDeletereview(ReviewVO reviewVO, Model model) {

			reviewService.adminDeleteReview(reviewVO);
			// 서비스 호출
			return "redirect:adminReviewList";
		}
}
