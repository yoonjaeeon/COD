package co.cod.app.review.service;

import java.util.List;

import co.cod.app.review.ReviewVO;
 
public interface ReviewService {
	public ReviewVO getReview(ReviewVO reviewVO);
	public List<ReviewVO> getReviewList(ReviewVO reviewVO);
	public void insertReview(ReviewVO reviewVO);
	public void deleteReview(ReviewVO reviewVO);
	public void updateReview(ReviewVO reviewVO);

}
