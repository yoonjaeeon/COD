package vofile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class BookmarksVO {
	Integer bookmarkSeq;
	String email;
	String adminId;
	String cafeThumbnail; //cafe 테이블에서 썸네일 조인해오기 위해
	String cafeName;
	String cafeHashtag;
	String stars;
	String bookmarks;
}
