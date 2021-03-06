package co.cod.app.inventory;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //Bean생성자를 만들어줌
public class InventoryVO {
	String inventoryName;
	Integer inventoryAmount;
	Integer inventorySeq;
	Integer volume;
	Integer orderSeq;
	Integer nowVolume;
	Integer inventoryPrice;
	String adminId;
}
