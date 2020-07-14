package co.cod.app.adminnotice;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class AdminNoticeVO {
	Integer adminNoticeSeq;
	String adminNoticeTitle;
	String adminId;
	String adminNoticeContent;
	String adminNoticeTime;
}
