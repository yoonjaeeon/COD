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
	Integer wifi;
	Integer nokid;
	Integer parking;
	Integer animal;
	Integer beam;
	Integer charger;
	Integer lend;
	Integer bigSeat;
}
