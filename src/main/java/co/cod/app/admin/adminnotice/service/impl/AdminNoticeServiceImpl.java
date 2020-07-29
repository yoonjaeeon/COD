package co.cod.app.admin.adminnotice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.admin.adminnotice.AdminNoticeVO;
import co.cod.app.admin.adminnotice.mapper.AdminNoticeMapper;
import co.cod.app.admin.adminnotice.service.AdminNoticeService;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService{

	@Autowired
	AdminNoticeMapper adminNoticeMapper;

	@Override
	public void insertAdminNotice(AdminNoticeVO adminNoticeVO) {
		adminNoticeMapper.insertAdminNotice(adminNoticeVO);		
	}

	@Override
	public List<AdminNoticeVO> getAdminNoticeList(String adminId) {
		return adminNoticeMapper.getAdminNoticeList(adminId);
	}

	@Override
	public AdminNoticeVO getAdminNotice(AdminNoticeVO adminNoticeVO) {
		return adminNoticeMapper.getAdminNotice(adminNoticeVO);
	}

	@Override
	public int updateAdminNotice(AdminNoticeVO adminNoticeVO) {
		return adminNoticeMapper.updateAdminNotice(adminNoticeVO);
	}

	@Override
	public int deleteAdminNotice(String adminNoticeSeq) {
		return adminNoticeMapper.deleteAdminNotice(adminNoticeSeq);
	}

}
