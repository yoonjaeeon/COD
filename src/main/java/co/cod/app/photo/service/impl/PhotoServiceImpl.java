package co.cod.app.photo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.photo.PhotoVO;
import co.cod.app.photo.mapper.PhotoMapper;
import co.cod.app.photo.service.PhotoService;
@Service
public class PhotoServiceImpl implements PhotoService{
	
	@Autowired
	PhotoMapper photoMapper;
	
	@Override
	public PhotoVO getPhoto(PhotoVO photoVO) {
		return photoMapper.getPhoto(photoVO);
	}

	@Override
	public List<PhotoVO> getPhotoList(PhotoVO photoVO) {
		return photoMapper.getPhotoList(photoVO);
	}

	@Override
	public void insertPhoto(PhotoVO photoVO) {
		photoMapper.insertPhoto(photoVO);
		
	}

	@Override
	public void updatePhoto(PhotoVO photoVO) {
		photoMapper.updatePhoto(photoVO);
		
	}

	@Override
	public void deletePhoto(PhotoVO photoVO) {
		photoMapper.deletePhoto(photoVO);
		
	}

	@Override
	public PhotoVO getPhotoMax() {
		return photoMapper.getPhotoMax();
	}


}
