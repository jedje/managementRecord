package com.service;

import java.util.List;

import com.domain.Notice;

public interface NoticeService {
	
	// ���
    public List<Notice> list() ;
 
    // �Է�
    public int addNotice(Notice n) ;
    
    // ����
    public int updateNotice(Notice n) ;
 
    // ����
    public int delNotice(String notice_id);

}
