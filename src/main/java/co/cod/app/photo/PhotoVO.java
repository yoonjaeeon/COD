package co.cod.app.photo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PhotoVO {
	Integer photoSeq;
	String  photoName;
	Integer photoGroup;
	Integer photoUse;
}
