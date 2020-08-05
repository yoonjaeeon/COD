package vofile;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class MasterVO {
	String id;
	String pw;
	
	Integer messageSeq;
	String messageTitle;
	String messageContent;
	Integer sendReceive;
	String adminId;
	Integer read;
	Integer masterRead;
	Date messageDate;
	Integer MessageSeq;
	

	String pass2;
	
	String adminPhone;
	Integer adminState;	
	String cafeName;
	String cafeAddress;
	
	// 마스터 올리스트 
	
	String cafeState;
	String advertiseState;
	
	
}
