package com.service;

import java.util.List;

import com.domain.Admin;

public interface AdminService {

	// ������ ��й�ȣ ���� (�������� / �α��ΰ���)
	public int modify(Admin a);

	/**** ������ ������ ���� ****************************************/
	// ������ ���� �߰� (������ ������)
	public int addAdmin(Admin a);

	// ������ ���� ��ȸ (������ ������)
	public List<Admin> list();

	// ������ ��й�ȣ �ʱ�ȭ (������ ������)
	public int resetPw(Admin a);

	// ������ ���� ���� (������ ������)
	public int updateAdmin(Admin a);

	// ������ ���� ���/���� (������ ������)
	public int lock(Admin a);
}
