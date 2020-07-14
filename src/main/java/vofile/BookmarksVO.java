package vofile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class BookmarksVO {
	Integer bookmarkSeq;
	String email;
	String adminId;
}
