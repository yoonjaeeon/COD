package co.cod.app.photo.service;

import java.util.List;

import co.cod.app.photo.PhotoVO;

public interface PhotoService {
	public PhotoVO getPhoto(PhotoVO photoVO);
	public List<PhotoVO> getPhotoList(PhotoVO photoVO);
	public void insertPhoto(PhotoVO photoVO);
	public void updatePhoto(PhotoVO photoVO);
	public void deletePhoto(PhotoVO photoVO);
	public PhotoVO getPhotoMax();
}
