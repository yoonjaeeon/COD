package co.cod.app.member;


import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class MemberVO {
String email;
String pw;
String birthday;
String phone;
String nickname;
Integer mileage;
Date orderTime;
String cafeName;
Integer price;
String menuName;
Integer orderlineAmount;
String photo;

//인기카페리스트 가져오는 필드
String cafeThumbnail;
String cafeHashtag;
double stars;
Integer bookmarks;
String adminId;
Integer bookmarkSeq;

String cafeState;
}
