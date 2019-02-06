package com.persistence;

import java.util.List;

import com.domain.Notice;

public interface NoticeDAO {
	
	// ���
    public List<Notice> list() ;
 
    // �Է�
    public int addNotice(Notice n) ;
    
    // ����
    public int updateNotice(Notice n) ;
 
    // ����
    public int delNotice(String notice_id);

}
