package co.cod.app.cafe;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class CafeVO {
	String email;
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
   String menuName;
   Integer wifi;
   Integer nokid;
   Integer parking;
   Integer animal;
   Integer beam;
   Integer charger;
   Integer lend;
   Integer bigSeat;
   Integer photoGroup;
   Integer bookmarkSeq;
   String bookmarks;
   double stars; //별점
   MultipartFile upload;
   String profile;
   double cafeX;
   double cafeY;
   Integer openClose;
   String cafe_submit;
}