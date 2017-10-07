package com.zhiyou100.service;

import java.util.List;

import com.zhiyou100.model.GradeNumber;
import com.zhiyou100.model.SelectKey;
import com.zhiyou100.model.TeaInsert;

public interface InsertTeaService {
	
	/**
	 * 添加茶叶得分，同时计算等级
	 * @param teaInsert
	 */
	void saveTea(TeaInsert teaInsert);
	
	/**
	 * 按照一定的规则查询所有的得分历史记录
	 * @param selectKey
	 * @return 排序后的得分
	 */
	List<TeaInsert> listInsertTea(SelectKey selectKey);
	
	
	int[] listGradeNumber();
	
	
	TeaInsert getTea(int id);
	
	int getCount();
}
