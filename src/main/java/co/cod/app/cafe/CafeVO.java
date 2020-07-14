package co.cod.app.cafe;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class CafeVO {
	String adminId;
	String pw;
	String pw2;
	Integer cafeState;
	String adminPhone;
	Integer adminState;
}
