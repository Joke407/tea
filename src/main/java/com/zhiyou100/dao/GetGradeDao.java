package com.zhiyou100.dao;

import com.zhiyou100.model.TeaInsert;

public interface GetGradeDao {

	/**
	 * 计算茶叶的相似度
	 * @param teaInsert
	 * @return 返回茶叶的等级
	 */
	double[] getGrades(TeaInsert teaInsert);
	
	/**
	 * 根据相似度获得等级
	 * @param similarity
	 * @return
	 */
	String getGrade(double[] similarity, TeaInsert teaInsert);
}
