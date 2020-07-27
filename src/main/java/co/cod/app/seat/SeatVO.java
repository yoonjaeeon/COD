package co.cod.app.seat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class SeatVO {
	Integer seatSeq;
	String seatName;
	Integer seatSize;
	Integer seatReserve;
	String adminId;
	String seatImg; // 썸네일
	MultipartFile upload; //한장
	String start;
	String end;
	String p;
	
}
