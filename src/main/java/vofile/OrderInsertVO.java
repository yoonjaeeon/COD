package vofile;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class OrderInsertVO extends OrdersVO{
List<OrderlineVO> orderlineList;
}
