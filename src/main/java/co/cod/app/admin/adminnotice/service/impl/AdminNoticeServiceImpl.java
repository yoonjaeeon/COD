package co.cod.app.admin.adminnotice.service.impl;

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
	
	
	
	
}
