package com.service;

import java.util.List;

import com.domain.Instructor;
import com.domain.Subject;

public interface InstructorService {

	
	// 占쎈쐻占쎈윥占쎈ぁ占쎈꽠�⑨퐢爾잌뜝�럩援꿨뜝�럥�꺐占썩뫀踰좑옙留뉛옙�쐻占쎈윞占쎈룺 �뜝�럩�뀇�윜諛잙쳛占쎄뎡�뜝�럥�늾占쎈쇊癰귨옙占쎄뎡
	public int modify(Instructor i);
	
	// 占쎈쐻占쎈윥占쎈ぁ占쎈꽠�⑨퐢爾잌뜝�럩援꿨뜝�럥�꺐占썩뫀踰좑옙留뉛옙�쐻占쎈윞占쎈룺 占쎈쐻占쎈윥塋딅ㅇ�쐻占쎈윥占쎈쭇�뜝�럥�렓占썩벀�걠占쎄뎡占쎈쐻占쎈윥�몭占�
	public int reset(Instructor i);
	
	public int addInst(Instructor i, String[] pc_check);
	
	public int updateInst(Instructor i);
	
	public int delInst(String instructor_id);
	
	public int addPC(String instructor_id, String subject_id);
	public int addPicture(Instructor i);
	public int updatePicture(Instructor i);
	
	public int delPC(String Instructor_id);
	
	public int totalcount();

	public String addInstId();
	public List<Instructor> list(String key, String value);
	public List<Instructor> list2(String key, String value);
	public List<Instructor> list3(String key, String value);
	public List<Instructor> list4(String key, String value);
	public List<Instructor> osInfo(String key, String value);
	public List<Subject> pcInfo(String instructor_id);
	public Instructor profile(String instructor_id);
}
