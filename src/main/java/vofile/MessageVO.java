package co.cod.app;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class MessageVO {
	Integer messageSeq;
	String messageContent;
	Integer sendReceive;
	String admin_id;
}
