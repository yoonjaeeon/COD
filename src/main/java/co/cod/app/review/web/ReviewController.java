package co.cod.app.review.web;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import co.cod.app.FileRenamePolicy;
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
		return "memberList/memberReviewList";
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
		model.addAttribute("reviewList", reviewService.getReviewList(reviewVO));
		return "memberList/memberReviewList";
	}
	// review관리
	// ajax : 목록

	// 수정폼
	@RequestMapping("updateFormReview")
	public String updateFormreview(ReviewVO reviewVO, Model model) {
		model.addAttribute("review", reviewService.getReview(reviewVO));
		return "review/updateReview";
	}

	// 수정처리
	@RequestMapping("updateReview")
	public String updatereview(ReviewVO reviewVO, Model model) {

		reviewService.updateReview(reviewVO);
		// 서비스 호출
		return "memberList/memberReviewList";
	}

	// 삭제처리
	@RequestMapping("deleteReview")
	public String deletereview(ReviewVO reviewVO, Model model) {

		reviewService.deleteReview(reviewVO);
		// 서비스 호출
		return "memberList/memberReviewList";
	}
}
