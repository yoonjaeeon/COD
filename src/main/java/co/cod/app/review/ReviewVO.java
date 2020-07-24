package co.cod.app.review;
import org.springframework.web.multipart.MultipartFile;

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
	double stars;
	String reviewTime;
	String cafeName;
	Integer photoGroup; // 원본
	String gdsThumbImg; // 썸네일
	MultipartFile upload; //한장
	MultipartFile [] uploadFile; //여러장
	String start;
	String end;
	String p;
}
