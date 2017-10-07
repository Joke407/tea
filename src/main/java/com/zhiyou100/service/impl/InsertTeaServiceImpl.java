package com.zhiyou100.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.GetGradeDao;
import com.zhiyou100.dao.InsertTeaDao;
import com.zhiyou100.dao.impl.GetGradeDaoImpl;
import com.zhiyou100.model.GradeNumber;
import com.zhiyou100.model.SelectKey;
import com.zhiyou100.model.TeaInsert;
import com.zhiyou100.service.InsertTeaService;

@Service
public class InsertTeaServiceImpl implements InsertTeaService {

	@Autowired
	private InsertTeaDao dao;
	
	private GetGradeDao dao2 = new GetGradeDaoImpl();
	
	public void saveTea(TeaInsert teaInsert) {
		
		double[] similarity = dao2.getGrades(teaInsert);
		dao2.getGrade(similarity, teaInsert);
		dao.saveTea(teaInsert);
	}

	public List<TeaInsert> listInsertTea(SelectKey selectKey) {
		
		
		return dao.listInsertTea(selectKey);
	}

	public int[] listGradeNumber() {
		int count[] = new int[7];
		
		count[0] = dao.getGradeNumber("特一级");
		count[1] = dao.getGradeNumber("特二级");
		count[2] = dao.getGradeNumber("特三级");
		count[3] = dao.getGradeNumber("一级");
		count[4] = dao.getGradeNumber("二级");
		count[5] = dao.getGradeNumber("三级");
		count[6] = dao.getGradeNumber("四级");
		
		return count;
	}

	public TeaInsert getTea(int id) {

		return dao.getTea(id);
	}

	public int getCount() {

		return dao.getCount();
	}

}
