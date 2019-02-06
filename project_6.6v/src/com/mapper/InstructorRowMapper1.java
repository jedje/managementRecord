package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.Instructor;

// 媛뺤궗紐⑸줉 (?占쏙옙占�?, ?占쏙옙?占쏙옙?占쏙옙)
public class InstructorRowMapper1 implements RowMapper<Instructor>{
/*	String instructor_id, String instructor_name, String instructor_phone, String room_id,
	String book_name, String os_id, String subject_name, String question, String status, String curriculum_name,
	String possible_course, String instructor_pw, String instructor_new_pw, Date instructor_regdate,
	Date oc_start_date, Date oc_end_date, Date os_start_date, Date os_end_date, Date ex_date, int absence_grade,
	int writtenexam_grade, int practical_grade, int deletable, int instructor_possible,
	String instructor_status*/
	@Override
	public Instructor mapRow(ResultSet rs, int count) throws SQLException {
		Instructor i = new Instructor();
		i.setInstructor_id(rs.getString("instructor_id"));
		i.setInstructor_name(rs.getString("instructor_name"));
		i.setInstructor_phone(rs.getString("instructor_phone"));
		i.setInstructor_email(rs.getString("instructor_email"));
		i.setInstructor_addr(rs.getString("instructor_addr"));
		i.setPossible_course(rs.getString("possible_course"));
		i.setInstructor_regdate(rs.getDate("instructor_regdate"));
		i.setI_file_name(rs.getString("i_file_name"));
		i.setDeletable(rs.getInt("deletable"));
		return i;
	}
	

}
