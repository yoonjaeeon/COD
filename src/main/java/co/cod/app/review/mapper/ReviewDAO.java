package co.cod.app.review.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.cod.app.review.ReviewVO;




@Repository  //Bean등록, connection 설정  //@Component 상속
public class ReviewDAO {
    
   @Autowired 
   private SqlSessionTemplate mybatis; // SqlSessionTemplate : mybatis에서 지원
   
  
   public ReviewVO getReview(ReviewVO reviewVO) {
	   return mybatis.selectOne("co.cod.app.member.review.mapper.ReviewDAO.getReview", reviewVO);
   } 
   public List<ReviewVO> getReviewList(ReviewVO reviewVO){
      return mybatis.selectList("co.cod.app.member.review.mapper.ReviewDAO.getReviewList",reviewVO);
   }
   public void insertReview(ReviewVO reviewVO) {
	   mybatis.insert("co.cod.app.member.review.mapper.ReviewDAO.insertReview", reviewVO);
	   
   }
   public void updateReview(ReviewVO reviewVO) {
	   mybatis.update("co.cod.app.member.review.mapper.ReviewDAO.updateReview", reviewVO);
	   
   }
   public void deleteReview(ReviewVO reviewVO) {
	   mybatis.delete("co.cod.app.member.review.mapper.ReviewDAO.deleteReview", reviewVO);
	   
   }
  
}