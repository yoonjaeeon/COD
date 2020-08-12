package vofile;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class MasterNoticeVO {
	Integer	masterNoticeSeq;
	String masterNoticeTitle;
	String masterNoticeContent;	
}
