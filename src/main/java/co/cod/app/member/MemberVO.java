package co.cod.app.member;
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
}
