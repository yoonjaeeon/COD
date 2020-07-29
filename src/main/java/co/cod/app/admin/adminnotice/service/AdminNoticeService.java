package co.cod.app.admin.adminnotice.service;

import java.util.List;

import co.cod.app.admin.adminnotice.AdminNoticeVO;

public interface AdminNoticeService {
	public List<AdminNoticeVO> getAdminNoticeList(String adminId);
	public AdminNoticeVO getAdminNotice(AdminNoticeVO adminNoticeVO);
	public void insertAdminNotice(AdminNoticeVO adminNoticeVO);
	public int updateAdminNotice(AdminNoticeVO adminNoticeVO);
	public int deleteAdminNotice(String adminNoticeSeq);
}
