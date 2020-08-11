package co.cod.app.calculate;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CalculateVO {
	String	dayPay;
	String calculatePay;
	String adminId;
	String orderTime;
	Integer price;
	String startTime;
	String endTime;
	Integer orderState;
	Integer priceAdd;
}
