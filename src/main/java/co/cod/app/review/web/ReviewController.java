package co.cod.app.review.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String insertreview( ReviewVO reviewVO, Model model) {
		
		reviewService.insertReview(reviewVO);
		// 서비스 호출
		return "main/home";
	}

	// 단건조회
	@RequestMapping("getReview/{reviewSeq}/{email}") // getreview? reviewseq=aaaa
	public String getReview(
			@PathVariable Integer reviewSeq, 
			@PathVariable String email) {
		System.out.println(reviewSeq);
		System.out.println(email);
		return "main/home";
	}

	// 목록조회
	@RequestMapping("reviewList")
	public String reviewList(Model model, ReviewVO reviewVO) {
		model.addAttribute("reviewList", reviewService.getReviewList(reviewVO));
		return "review/reviewList";
	}

	// review관리
	@RequestMapping("reviewClient")
	public String reviewClient() {
		return "review/reviewClient";
	}

	// ajax : 목록
	@RequestMapping("ajaxReviewList")
	public @ResponseBody List<ReviewVO> ajaxReviewList(ReviewVO reviewVO) {
		return reviewService.getReviewList(reviewVO);
	}
	// 수정폼
	// 수정처리
	// 삭제처리
}
