package vofile;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class WorkerVO {
	Integer workerSeq;
	Integer workerGrade;
	String workerName;
	String workerBirthday;
	Integer pay;
	String adminId;
}
