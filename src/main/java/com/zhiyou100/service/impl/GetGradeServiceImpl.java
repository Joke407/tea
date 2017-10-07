package com.zhiyou100.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.GetGradeDao;
import com.zhiyou100.dao.impl.GetGradeDaoImpl;
import com.zhiyou100.model.TeaInsert;
import com.zhiyou100.service.GetGradeService;

@Service
public class GetGradeServiceImpl implements GetGradeService {

	private GetGradeDao dao = new GetGradeDaoImpl();
	
	public double[] getGrades(TeaInsert teaInsert) {
		
		
		return dao.getGrades(teaInsert);
	}

	public String getGrade(double[] similarity, TeaInsert teaInsert) {

		return dao.getGrade(similarity, teaInsert);
	}

}
