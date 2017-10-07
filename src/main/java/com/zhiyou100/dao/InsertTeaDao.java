package com.zhiyou100.dao;

import java.util.List;

import com.zhiyou100.model.GradeNumber;
import com.zhiyou100.model.SelectKey;
import com.zhiyou100.model.TeaInsert;

public interface InsertTeaDao {
	
	/**
	 * 存储茶叶的得分
	 * @param teaInsert
	 */
	void saveTea(TeaInsert teaInsert);
	
	/**
	 * 按照一定的规则查询所有的得分历史记录
	 * @param selectKey
	 * @return 排序后的得分
	 */
	List<TeaInsert> listInsertTea(SelectKey selectKey);
	
	/**
	 * 查看各个等级的个数
	 * @return
	 */
	int getGradeNumber(String grade);
	
	/**
	 * 根据id找到这个茶叶的分数
	 */
	TeaInsert getTea(int id);
	
	/**
	 * 获得总个数
	 */
	int getCount();
}
