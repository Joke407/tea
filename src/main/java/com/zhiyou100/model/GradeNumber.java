package com.zhiyou100.model;

public class GradeNumber {
	
	private String grade;
	
	private int gradeNum;

	public GradeNumber() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GradeNumber(String grade, int gradeNum) {
		super();
		this.grade = grade;
		this.gradeNum = gradeNum;
	}

	@Override
	public String toString() {
		return "GradeNumberVo [grade=" + grade + ", gradeNum=" + gradeNum + "]";
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getGradeNum() {
		return gradeNum;
	}

	public void setGradeNum(int gradeNum) {
		this.gradeNum = gradeNum;
	}
	
	
}
