package com.domain;

public class Curriculum {

	//?�쇱?��踰덊?��, ?�쇱?��紐�
	private String curriculum_id, curriculum_name;
	//�궘�젣媛��뒫�뿬?���?
	private int deletable;

	public Curriculum() {
		
	}

	public String getCurriculum_id() {
		return curriculum_id;
	}

	public void setCurriculum_id(String curriculum_id) {
		this.curriculum_id = curriculum_id;
	}

	public String getCurriculum_name() {
		return curriculum_name;
	}

	public void setCurriculum_name(String curriculum_name) {
		this.curriculum_name = curriculum_name;
	}

	public int getDeletable() {
		return deletable;
	}

	public void setDeletable(int deletable) {
		this.deletable = deletable;
	}

}
