package com.zhiyou100.service;

import java.util.List;

import com.zhiyou100.model.TeaVote;

public interface VoteTeaService {
	
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
	 * 投票
	 */
	void addVote(int id);
}
