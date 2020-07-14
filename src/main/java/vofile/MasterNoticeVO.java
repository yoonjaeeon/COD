package co.cod.app;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class MasterNoticeVO {
	Integer	master_notice_seq;
	String master_notice_title;
	String master_notice_content;
	String photo_group;
}
