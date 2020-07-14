package co.cod.app;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class AdminVO {
	String adminId;
	String pw;
	String pw2;
	Integer cafeState;
	String adminPhone;
	Integer adminState;
}