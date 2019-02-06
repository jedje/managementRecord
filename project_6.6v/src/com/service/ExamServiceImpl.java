package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.domain.Exam;
import com.persistence.ExamDAO;

@Service("examService")
public class ExamServiceImpl implements ExamService {

	@Resource(name="examDAO")
	private ExamDAO examDAO;
	
	@Override
	public List<Exam> aCheckPoint(Exam e) {
		return this.examDAO.aCheckPoint(e);
	}

	@Override
	public List<Exam> aCheckGrade(Exam e) {
		return this.examDAO.aCheckGrade(e);
	}

	@Override
	public List<Exam> aCheckStGrade(Exam e) {
		return this.examDAO.aCheckStGrade(e);
	}
	@Override
	public List<Exam> iCheckPoint(Exam e) {
		return this.examDAO.iCheckPoint(e);
	}
	@Override
	public int addPoint(Exam e) {
		return this.examDAO.addPoint(e);
	}
	@Override
	public int delPoint(String ex_id) {
		return this.examDAO.delPoint(ex_id);
	}
	@Override
	public int addGrade(Exam e) {
		return this.examDAO.addGrade(e);
	}
	@Override
	public int delGrade(Exam e) {
		return this.examDAO.delGrade(e);
	}

	@Override
	public int quesName(Exam e) {
		return this.examDAO.quesName(e);
	}


}
