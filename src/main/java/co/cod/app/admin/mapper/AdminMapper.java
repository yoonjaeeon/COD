package co.cod.app.admin.mapper;

import java.util.List;
import java.util.Map;

import co.cod.app.admin.AdminVO;


public interface AdminMapper {
	
	
	public AdminVO getAdmin(AdminVO adminVO);
	public List<AdminVO> getAdminList(AdminVO empVO);
	public void insertAdmin(AdminVO adminVO);
	public void updateAdmin(AdminVO adminVO);
	public void deleteAdmin(AdminVO adminVO);	
	public String getName(Integer adminid);
	public List<Map<String, Object>> getAdminMap();
	public List<Map<String, Object>> getDeptAdminCnt();
}

