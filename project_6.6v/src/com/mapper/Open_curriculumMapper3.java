package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.domain.Open_curriculum;

public class Open_curriculumMapper3 implements RowMapper<Open_curriculum> {
	/*
	private String oc_id, curriculum_name, room_name, status, ocstatus;
	private Date oc_start_date, oc_end_date, aband_date;
	private int studentCnt, subjectCnt, deletable, room_capacity;

*/
	
	@Override
	public Open_curriculum mapRow(ResultSet rs, int count) throws SQLException {
		Open_curriculum oc = new Open_curriculum();
		oc.setOc_id(rs.getString("oc_id"));
		oc.setCurriculum_name(rs.getString("curriculum_name"));
		oc.setRoom_name(rs.getString("room_name"));
		oc.setOc_start_date(rs.getDate("oc_start_date"));
		oc.setOc_end_date(rs.getDate("oc_end_date"));
		oc.setStatus(rs.getString("status"));
		oc.setStudentCnt(rs.getInt("studentCnt"));
		return oc;
	}

	
	

}
