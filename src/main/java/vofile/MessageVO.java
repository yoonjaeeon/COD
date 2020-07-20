package vofile;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class MessageVO {
	Integer messageSeq;
	String messageTitle;
	String messageContent;
	Integer sendReceive;
	String adminId;
	Integer read;
}
