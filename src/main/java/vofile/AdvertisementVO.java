package vofile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class AdvertisementVO {
	Integer advertise_seq;
	Integer advertise_money;
	String photo_group;
	String advertiser;
	String advertiser_phone;
	String site;
	String contract_period;
}
