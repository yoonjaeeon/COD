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
	@JsonProperty(value = "id")
	String adminId;
	String pw;
	String pw2;
	Integer cafeState;
	String adminPhone;
	Integer adminState;
	
	
}
