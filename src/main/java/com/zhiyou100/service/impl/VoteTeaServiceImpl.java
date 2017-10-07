package com.zhiyou100.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.VoteTeaDao;
import com.zhiyou100.model.TeaVote;
import com.zhiyou100.service.VoteTeaService;

@Service
public class VoteTeaServiceImpl implements VoteTeaService {

	@Autowired
	private VoteTeaDao dao;
	
	
	public List<TeaVote> listVoteTea() {
		
		
		return dao.listVoteTea();
	}

	public List<TeaVote> listFrontVoteTea() {

		return dao.listFrontVoteTea();
	}

	public void addVote(int id) {

		dao.addVote(id);
	}

}
