package co.cod.app.advertisement;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AdvertisementVO {
	Integer advertiseSeq;
	Integer advertiseMoney;
	String advertiseFile;
	String advertiser;
	String advertiserPhone;
	String site;
	String contractPeriod;
	
	MultipartFile upload;
}
