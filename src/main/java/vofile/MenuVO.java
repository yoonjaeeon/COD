package vofile;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class MenuVO {
	Integer menuSeq;
	String menuSort;
	Integer price;
	Integer signiture;
	Integer popularMenu;
	Integer menuState;
	Integer priceAdd;
	Integer newMenu;
	String menuName;
	String adminId;
}
