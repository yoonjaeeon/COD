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
	public List<AdminVO> getAdminList(AdminVO adminVO);
	public void updateCafeState(AdminVO adminVO);
	
	//주문현황
	public void orderSubmit(AdminVO adminVO);
	public List<AdminVO> getOrderView(AdminVO adminVO);
	public Integer getOrderCount(AdminVO adminVO);
	public void updateOrderSubmit(String orderSeq);
	public void deleteOrderSubmit(AdminVO adminVO);

}
