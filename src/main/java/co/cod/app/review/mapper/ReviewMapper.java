package co.cod.app.review.mapper;

import java.util.List;

import co.cod.app.review.ReviewVO;

 
public interface ReviewMapper {

	public ReviewVO getReview(ReviewVO reviewVO);
	public List<ReviewVO> getReviewList(ReviewVO reviewVO);
	public void insertReview(ReviewVO reviewVO);
//	public String getName(Integer Id);
//	public List<Map<String, Object>> getEmpMap();
//	public List<Map<String, Object>> getDeptEmpCnt();

}
