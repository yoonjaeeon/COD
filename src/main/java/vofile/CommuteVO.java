package vofile;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class CommuteVO {
	Integer commuteSeq;
	Integer workerSeq;
	String startTime;
	String commuteDate;
	String endTime;
	Integer dayPay;
}
