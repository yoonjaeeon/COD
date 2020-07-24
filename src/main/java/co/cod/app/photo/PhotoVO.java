package co.cod.app.photo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PhotoVO {
	Integer photoSeq;
	String  photoName;
	Integer photoGroup;
	Integer photoUse;
	MultipartFile [] uploadFile;
}
