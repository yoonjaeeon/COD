package co.cod.app.admin;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class AdminVO {
	
	String adminId;
	String pw;
	String pass2;
	Integer cafeState;
	String adminPhone;
	Integer adminState;	
	String cafeName;
	String cafeAddress;
	
	//조인을 위한 필드
	String cafePhone;
}
