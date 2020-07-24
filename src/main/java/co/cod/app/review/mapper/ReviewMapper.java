package co.cod.app.review.mapper;

import java.util.List;

import co.cod.app.review.ReviewVO;

public interface ReviewMapper {
	// 단건 조회
	public ReviewVO getReview(ReviewVO reviewVO);

	// 페이징 조회
	public int getCount(ReviewVO reviewVO);

	// 목록 조회
	public List<ReviewVO> getReviewList(ReviewVO reviewVO);

	// 등록
	public void insertReview(ReviewVO reviewVO);

	// 수정
	public void updateReview(ReviewVO reviewVO);

	// 삭제
	public void deleteReview(ReviewVO reviewVO);
//	public String getName(Integer Id);
//	public List<Map<String, Object>> getEmpMap();
//	public List<Map<String, Object>> getDeptEmpCnt();

}
