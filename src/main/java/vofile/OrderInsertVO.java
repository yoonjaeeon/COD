package vofile;

import java.util.List;

import co.cod.app.member.MemberVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class OrderInsertVO extends OrdersVO{
Integer mileage;
Integer mileageUse;
List<OrderlineVO> orderlineList;

}
