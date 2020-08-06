package vofile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class CafeVO {
	String adminId;
	String cafeName;
	String cafeAddress;
	String cafeAskContent;
	String cafePhone;
	String cafeTime;
	String cafeCloseday;
	String cafeHashtag;
	String cafeTheme;
	String cafeThumbnail;
	Integer wifi;
	Integer nokid;
	Integer parking;
	Integer animal;
	Integer beam;
	Integer charger;
	Integer lend;
	Integer bigSeat;
	
	//공지사항 들고오는 필드
	String adminNoticeContent;
	String adminNoticeTime;
}
