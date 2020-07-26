package co.cod.app.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.admin.AdminVO;
import co.cod.app.admin.mapper.AdminMapper;
import co.cod.app.admin.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired AdminMapper adminMapper;
	
	//  단건  
	@Override
	public AdminVO getAdmin(AdminVO adminVO) {
		// TODO Auto-generated method stub
		return adminMapper.getAdmin(adminVO);
	}
	// 전테 조호 
//	@Override
//	public List<AdminVO> getAdminList(AdminVO adminVO) {
//		// TODO Auto-generated method stub
//		return adminMapper.getAdminList(adminVO);
//	}
	
	//등록 
	@Override
	public void insertAdmin(AdminVO adminVO) {
		adminMapper.insertAdmin(adminVO);
		
	}
	//업테이드 
	@Override
	public void updateAdmin(AdminVO adminVO) {
		adminMapper.updateAdmin(adminVO);
		
	}
	// 삭제 
	@Override
	public void deleteAdmin(AdminVO adminVO) {
		adminMapper.deleteAdmin(adminVO);
		
	}
	
	@Override
	public List<Map<String, Object>> getAdminMap() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public AdminVO adminLogin(AdminVO adminVO) {		
		return adminMapper.adminLogin(adminVO);
	}
	
	
	@Override
	public List<AdminVO> cafeStateList(AdminVO adminVO) {
		// TODO Auto-generated method stub
		return adminMapper.cafeStateList(adminVO);
	}
	@Override
	public void updateCafeState(AdminVO adminVO) {
		adminMapper.updateCafeState(adminVO);
	}
	@Override
	public List<AdminVO> getAdminListCafe1(AdminVO adminVO) {
		
		return adminMapper.getAdminListCafe1(adminVO);
	}
	@Override
	public List<AdminVO> getAdminListCafe2(AdminVO adminVO) {
		// TODO Auto-generated method stub
		return adminMapper.getAdminListCafe2(adminVO);
	}

	@Override
	public void updateAdminListCafe1(AdminVO adminVO) {
		adminMapper.updateAdminListCafe1(adminVO);
		
	}

	@Override
	public void updateAdminListCafe2(AdminVO adminVO) {
		adminMapper.updateAdminListCafe2(adminVO);
		
	}

}


