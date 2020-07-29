package co.cod.app.orders;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrdersVO {
	Integer orderSeq;
	String orderTime;
	String email;
	String adminId;
	String cafeName;
	Integer seatSeq;
}
