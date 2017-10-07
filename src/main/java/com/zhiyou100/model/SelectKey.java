package com.zhiyou100.model;

public class SelectKey {
	
	/**
	 * 指定的页数
	 */
	private int page;
	
	/**
	 * 按照等级排序
	 * -1是降序
	 * 1是升序
	 */
	private int gradeKey;
	
	/**
	 * 按照添加时间排序
	 * -1是降序
	 * 1是升序
	 */
	private int createKey;

	public SelectKey() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public SelectKey(int page, int gradeKey, int createKey) {
		super();
		this.page = page;
		this.gradeKey = gradeKey;
		this.createKey = createKey;
	}


	@Override
	public String toString() {
		return "SelectKey [page=" + page + ", gradeKey=" + gradeKey + ", createKey=" + createKey + "]";
	}


	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getGradeKey() {
		return gradeKey;
	}

	public void setGradeKey(int gradeKey) {
		this.gradeKey = gradeKey;
	}

	public int getCreateKey() {
		return createKey;
	}

	public void setCreateKey(int createKey) {
		this.createKey = createKey;
	}



	
	
}
