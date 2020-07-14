package co.cod.app;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class OrderlineVO {
	Integer orderlineSeq;
	Integer orderlineAmount;
	Integer menuSeq;
	Integer orderSeq;
	Integer orderState;
}
