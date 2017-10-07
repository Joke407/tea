package com.zhiyou100.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TeaInsert {
	/**
	 * 主键
	 */
	private int id;
	/**
	 * 形状
	 */
	private double shape;
	/**
	 * 色泽
	 */
	private double color;
	/**
	 * 净度
	 */
	private double neatness;
	/**
	 * 汤色
	 */
	private double colorTea;
	/**
	 * 香气
	 */
	private double aroma;
	/**
	 * 滋味
	 */
	private double taste;
	/**
	 * 叶底
	 */
	private double leaves;
	
	/**
	 * 等级
	 */
	
	private String grade;
	
	/**
	 * 数字的等级
	 */
	private int gradeNumber;
	
	/**
	 * 時間
	 */
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Shanghai")
	private Date gmtCreate;

	public TeaInsert() {
		super();
	}


	






	public TeaInsert(int id, double shape, double color, double neatness, double colorTea, double aroma, double taste,
			double leaves, String grade, int gradeNumber, Date gmtCreate) {
		super();
		this.id = id;
		this.shape = shape;
		this.color = color;
		this.neatness = neatness;
		this.colorTea = colorTea;
		this.aroma = aroma;
		this.taste = taste;
		this.leaves = leaves;
		this.grade = grade;
		this.gradeNumber = gradeNumber;
		this.gmtCreate = gmtCreate;
	}














	@Override
	public String toString() {
		return "TeaInsert [id=" + id + ", shape=" + shape + ", color=" + color + ", neatness=" + neatness
				+ ", colorTea=" + colorTea + ", aroma=" + aroma + ", taste=" + taste + ", leaves=" + leaves + ", grade="
				+ grade + ", gradeNumber=" + gradeNumber + ", gmtCreate=" + gmtCreate + "]";
	}









	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getShape() {
		return shape;
	}

	public void setShape(double shape) {
		this.shape = shape;
	}

	public double getColor() {
		return color;
	}

	public void setColor(double color) {
		this.color = color;
	}

	public double getNeatness() {
		return neatness;
	}

	public void setNeatness(double neatness) {
		this.neatness = neatness;
	}


	public double getColorTea() {
		return colorTea;
	}




	public void setColorTea(double colorTea) {
		this.colorTea = colorTea;
	}




	public double getAroma() {
		return aroma;
	}

	public void setAroma(double aroma) {
		this.aroma = aroma;
	}

	public double getTaste() {
		return taste;
	}

	public void setTaste(double taste) {
		this.taste = taste;
	}

	public double getLeaves() {
		return leaves;
	}

	public void setLeaves(double leaves) {
		this.leaves = leaves;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getGradeNumber() {
		return gradeNumber;
	}

	public void setGradeNumber(int gradeNumber) {
		this.gradeNumber = gradeNumber;
	}









	public Date getGmtCreate() {
		return gmtCreate;
	}









	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}














	
	
	
}
