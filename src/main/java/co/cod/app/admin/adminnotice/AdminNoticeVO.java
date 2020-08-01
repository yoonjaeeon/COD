package co.cod.app.admin.adminnotice;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class AdminNoticeVO {
	Integer adminNoticeSeq;
	String 	adminId;
	String	adminNoticeTitle;
	String 	adminNoticeContent;
	String 	adminNoticeTime;

}