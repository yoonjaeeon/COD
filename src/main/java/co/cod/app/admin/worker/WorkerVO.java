package co.cod.app.admin.worker;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class WorkerVO {
	Integer workerSeq;
	Integer workerGrade;
	String workerName;
	String workerBirth;
	Integer pay;
	String adminId;

}
