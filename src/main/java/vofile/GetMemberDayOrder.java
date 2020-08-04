package vofile;


import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class GetMemberDayOrder {
	String orderTime;
	String cafeName;
	String price;
	String email;
	String menuName;
	Integer orderlineAmount;
	Integer orderState;
	Integer priceAdd;
	Integer orderSeq;
	
	//bookmark 가져오는데 필요한 필드
	Integer bookmarknum;
	
	//review 필요한 필드
	String reviewTime;
}
