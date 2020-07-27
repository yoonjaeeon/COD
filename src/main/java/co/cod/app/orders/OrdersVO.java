package co.cod.app.orders;

import org.springframework.web.multipart.MultipartFile;

import co.cod.app.photo.PhotoVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrdersVO {
	Integer orderSeq;
	String orderTime;
	String email;
	String adminId;
	Integer seatSeq;
}
