package co.cod.app.orderline;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrderLineVO {
	Integer orderlineSeq;
	Integer orderlineAmount;
	Integer menuSeq;
	Integer orderSeq;
	Integer orderState;
}
