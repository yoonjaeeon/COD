package co.cod.app.review;
import lombok.Data;
import lombok.NoArgsConstructor;
 
@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class ReviewVO {
	Integer reviewSeq;
	String email;
	String adminId;
	Integer orderSeq;
	String reviewContent;
	Integer stars;
	String reviewTime;
	String cafeName;
}
