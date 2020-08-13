package co.cod.app.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.admin.AdminVO;
import co.cod.app.admin.mapper.AdminMapper;
import co.cod.app.admin.service.AdminService;
import vofile.MasterNoticeVO;

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
	@Override
	public void orderSubmit(AdminVO adminVO) {
		adminMapper.orderSubmit(adminVO);
	}
	@Override
	public List<AdminVO> getOrderView(AdminVO adminVO) {
		return adminMapper.getOrderView(adminVO);
	}
	@Override
	public Integer getOrderCount(AdminVO adminVO) {
		return adminMapper.getOrderCount(adminVO);
	}

	@Override
	public void updateOrderSubmit(String orderSeq) {
		adminMapper.updateOrderSubmit(orderSeq);
		
	}
	@Override
	public void deleteOrderSubmit(AdminVO adminVO) {
		adminMapper.deleteOrderSubmit(adminVO);
	}
	@Override
	public int idcheck1(AdminVO adminVO) {
		return adminMapper.idcheck1(adminVO);
	}
	@Override
	public MasterNoticeVO getMasterNotice() {
		return adminMapper.getMasterNotice();
	}
	@Override
	public List<AdminVO> getCompleteOrder(AdminVO adminVO) {
		return adminMapper.getCompleteOrder(adminVO);
	}
	
}
