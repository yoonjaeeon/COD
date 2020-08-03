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
}
