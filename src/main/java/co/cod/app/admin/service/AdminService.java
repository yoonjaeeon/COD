package co.cod.app.admin.service;

import java.util.List;

import co.cod.app.admin.AdminVO;

public interface AdminService {

	public AdminVO getAdmin(AdminVO adminVO);
	public void insertAdmin(AdminVO adminVO);
	public void updateAdmin(AdminVO adminVO);
	public void deleteAdmin(AdminVO adminVO);
	public AdminVO adminLogin(AdminVO adminVO);	
	
	//adminList
	public List<AdminVO> getAdminList(Integer cafeState);
	public void updateCafeState(AdminVO adminVO);

}
