package com.persistence;

import java.util.List;

import com.domain.Exam;

public interface ExamDAO {

	// ������ > ������ȸ ######################################
	public List<Exam> aCheckPoint(Exam e);

	// ������ > ������ȸ ######################################
	public List<Exam> aCheckGrade(Exam e);
	
	// 
	public List<Exam> aCheckStGrade(Exam e);
	
	public List<Exam> iCheckPoint(Exam e);
	public int addPoint(Exam e);
	public int delPoint(String ex_id);
	public int addGrade(Exam e);
	public int delGrade(Exam e);

	public int quesName(Exam e);
}
