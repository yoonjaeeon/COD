package co.cod.app;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class SeatVO {
	Integer seatSeq;
	Integer photo_group;
	String seatName;
	Integer seatSize;
	Integer seatReserve;
	String adminId;
	
}
