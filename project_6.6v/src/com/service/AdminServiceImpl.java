package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.domain.Admin;
import com.persistence.AdminDAO;

// ������ �����̳ʿ� ��ü�� ����ϴ� ������̼�
@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Resource(name="adminDAO")
	private AdminDAO adminDAO;
	
	@Override
	public int modify(Admin a) {
		return this.adminDAO.modify(a);
	}

	@Override
	public int addAdmin(Admin a) {
		return this.adminDAO.addAdmin(a);
	}

	@Override
	public List<Admin> list() {
		return this.adminDAO.list();
	}

	@Override
	public int resetPw(Admin a) {
		return this.adminDAO.resetPw(a);
	}

	@Override
	public int updateAdmin(Admin a) {
		return this.adminDAO.updateAdmin(a);
	}

	@Override
	public int lock(Admin a) {
		return this.adminDAO.lock(a);
	}
	
}
