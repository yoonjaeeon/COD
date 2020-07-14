package vofile;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class CommentsVO {
	Integer comment_seq;
	String comment_content;
	String comment_date;
	Integer question_seq;
}
