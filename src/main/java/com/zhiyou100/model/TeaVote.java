package com.zhiyou100.model;

public class TeaVote {
	
	/**
	 * 主键
	 */
	private int id;
	/**
	 * 名字
	 */
	private String name;
	
	/**
	 * 图像
	 */
	private String image;
	
	/**
	 * 投票数
	 */
	private int vote;

	public TeaVote() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TeaVote(int id, String name, String image, int vote) {
		super();
		this.id = id;
		this.name = name;
		this.image = image;
		this.vote = vote;
	}

	@Override
	public String toString() {
		return "teaVote [id=" + id + ", name=" + name + ", image=" + image + ", vote=" + vote + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getVote() {
		return vote;
	}

	public void setVote(int vote) {
		this.vote = vote;
	}
	
	
	
}
