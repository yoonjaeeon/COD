package co.cod.app.review.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.review.ReviewVO;
import co.cod.app.review.mapper.ReviewMapper;
import co.cod.app.review.service.ReviewService;


@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	ReviewMapper reviewMapper;

	// 단건조회
	@Override
	public ReviewVO getReview(ReviewVO reviewVO) {
		return reviewMapper.getReview(reviewVO);
	}

	// 전체조회
	@Override
	public List<ReviewVO> getReviewList(ReviewVO reviewVO) {
		System.out.println("getReviewList 서비스 호출");
		return reviewMapper.getReviewList(reviewVO);
	}
	
	// 관리자조회
		@Override
		public List<ReviewVO> adminReviewList(ReviewVO reviewVO) {
			return reviewMapper.adminReviewList(reviewVO);
		}
	
	// 페이징 카운트
	@Override
	public int getCount(ReviewVO reviewVO) {
		return reviewMapper.getCount(reviewVO);
	}
 
	// 등록
	@Override
	public void insertReview(ReviewVO reviewVO) {
		reviewMapper.insertReview(reviewVO);
	}

	// 삭제
	@Override
	public void deleteReview(ReviewVO reviewVO) {
		reviewMapper.deleteReview(reviewVO);
	}

	// 수정
	@Override
	public void updateReview(ReviewVO reviewVO) {
		reviewMapper.updateReview(reviewVO);
	}
}
