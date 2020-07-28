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
	
	//  단건 조회
	@Override
	public AdminVO getAdmin(AdminVO adminVO) {
		return adminMapper.getAdmin(adminVO);
	}
	// 등록 
	@Override
	public void insertAdmin(AdminVO adminVO) {
		adminMapper.insertAdmin(adminVO);
		
	}
	// 업데이트
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
	public AdminVO adminLogin(AdminVO adminVO) {		
		return adminMapper.adminLogin(adminVO);
	}
	
	
	// adminList

	
	@Override
	public List<AdminVO> getAdminList(AdminVO adminVO) {
		return adminMapper.getAdminList(adminVO);
	}
	// 카페 상태 수정
	@Override
	public void updateCafeState(AdminVO adminVO) {
		adminMapper.updateCafeState(adminVO);
	}

}


