package co.cod.app.review.web;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import co.cod.app.FileRenamePolicy;
import co.cod.app.Paging;
import co.cod.app.review.ReviewVO;
import co.cod.app.review.service.ReviewService;


@Controller // @Component 빈등록 , 디스패쳐서블릿이 인식할수 있는 컨트롤러로 변환
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
	// 등록폼
	@RequestMapping("insertFormReview")
	public String insertFormreview(ReviewVO vo) {
		return "review/insertReview";
	}

	// 등록처리
	@RequestMapping("insertReview")
	public String insertreview(ReviewVO reviewVO) throws Exception{
//		    MultipartFile cafeThumbnail = reviewVO.getUpload();
//		      if(cafeThumbnail != null) {
//		         String filename = cafeThumbnail.getOriginalFilename();
//		         if (cafeThumbnail != null && cafeThumbnail.getSize() > 0) {
//		            File upFile = FileRenamePolicy.rename(new 
//		                  File("D:\\Dev\\git\\COD\\src\\main\\webapp\\resources\\upload", filename));
//		            filename = upFile.getName();
//		            cafeThumbnail.transferTo(upFile);
//		         }
//		         reviewVO.setGdsThumbImg(filename);		      
//		      }
		      MultipartFile[] files = reviewVO.getUploadFile();
		      if (files != null) {
		         for (MultipartFile file : files) {
		            String filename = file.getOriginalFilename();
		            if (file != null && file.getSize() > 0) {
		               File upFile = FileRenamePolicy.rename(new 
		                     File("D:\\Dev\\git\\COD\\src\\main\\webapp\\resources\\upload", filename));
		               filename = upFile.getName();
		               file.transferTo(upFile);
		            }
		            reviewVO.setGdsThumbImg(filename);
		         }
		      }
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
	public String reviewList(Model model, ReviewVO reviewVO) {
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
		paging.setTotalRecord(reviewService.getCount(reviewVO)); // 전체 레코드 건수 조회
		model.addAttribute("paging", paging);

		reviewVO.setStart(Integer.toString(paging.getFirst())); //start
		reviewVO.setEnd(Integer.toString(paging.getLast())); //end
		
		model.addAttribute("reviewList", reviewService.getReviewList(reviewVO));
		return "memberList/memberReviewList";
	}
	
	// 수정폼
	@RequestMapping("updateFormReview")
	public String updateFormreview(ReviewVO reviewVO, Model model) {
		model.addAttribute("review", reviewService.getReview(reviewVO));
		return "review/updateReview";
	}

	// 수정처리
	@RequestMapping("updateReview")
	public String updatereview(ReviewVO reviewVO) throws Exception {
		  MultipartFile[] files = reviewVO.getUploadFile();
	      if (files != null) {
	         for (MultipartFile file : files) {
	            String filename = file.getOriginalFilename();
	            if (file != null && file.getSize() > 0) {
	               File upFile = FileRenamePolicy.rename(new 
	                     File("D:\\Dev\\git\\COD\\src\\main\\webapp\\resources\\upload", filename));
	               filename = upFile.getName();
	               file.transferTo(upFile);
	            }
	            reviewVO.setGdsThumbImg(filename);
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
}
