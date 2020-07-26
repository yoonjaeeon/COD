package co.cod.app.admin.service;

import java.util.List;
import java.util.Map;

import co.cod.app.admin.AdminVO;
import co.cod.app.member.MemberVO;

public interface AdminService {

	public AdminVO getAdmin(AdminVO adminVO);
	//public List<AdminVO> getAdminList(AdminVO adminVO);
	public List<AdminVO> getAdminListCafe1(AdminVO adminVO);
	public List<AdminVO> getAdminListCafe2(AdminVO adminVO);	
	public void insertAdmin(AdminVO adminVO);
	public void updateAdmin(AdminVO adminVO);
	public void deleteAdmin(AdminVO adminVO);
	public List<Map<String, Object>> getAdminMap();
	public AdminVO adminLogin(AdminVO adminVO);	
	public  List<AdminVO>cafeStateList(AdminVO adminVO);
	public void updateCafeState(AdminVO adminVO);
	public void updateAdminListCafe1(AdminVO adminVO);
	public void updateAdminListCafe2(AdminVO adminVO);

}
