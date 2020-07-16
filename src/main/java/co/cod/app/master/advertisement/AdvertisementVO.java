package co.cod.app.master.advertisement;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class AdvertisementVO {
	Integer advertiseSeq;
	Integer advertiseMoney;
	String advertiseFile;
	String advertiser;
	String advertiserPhone;
	String site;
	String contractPeriod;
}
