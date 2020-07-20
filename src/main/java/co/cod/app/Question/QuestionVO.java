package co.cod.app.Question;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class QuestionVO {
	Integer question_seq;
	String question_title;
	String question_content;
	String question_info;
	String question_phone;
	String question_date;
	String question_pw;
}
