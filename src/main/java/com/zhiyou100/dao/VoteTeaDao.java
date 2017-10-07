package com.zhiyou100.dao;

import java.util.List;

import com.zhiyou100.model.TeaVote;

public interface VoteTeaDao {
	
	/**
	 * 展示所有的茶叶
	 * @return
	 */
	List<TeaVote> listVoteTea();
	
	/**
	 * 获得前八名的茶叶的信息
	 * @return
	 */
	List<TeaVote> listFrontVoteTea();
	
	/**
	 * 增加投票数
	 */
	void addVote(int id);
}
