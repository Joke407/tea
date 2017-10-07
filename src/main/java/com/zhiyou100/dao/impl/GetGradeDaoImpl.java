package com.zhiyou100.dao.impl;

import com.zhiyou100.dao.GetGradeDao;
import com.zhiyou100.model.TeaInsert;

public class GetGradeDaoImpl implements GetGradeDao {

	//获得相似度数组
	public double[] getGrades(TeaInsert teaInsert) {
		// 所有的相似度
		double[] grades = new double[7];
		// 对比的分数
		double[] similarity = new double[7];
		similarity[0] = teaInsert.getShape();
		similarity[1] = teaInsert.getColor();
		similarity[2] = teaInsert.getNeatness();
		similarity[3] = teaInsert.getColorTea();
		similarity[4] = teaInsert.getAroma();
		similarity[5] = teaInsert.getTaste();
		similarity[6] = teaInsert.getLeaves();
		// 标准的分数
		double[][] standard = {{1, 0.9, 0.9, 0.9, 1, 1, 0.9},
				{0.9, 0.8, 0.9, 0.9, 0.9, 0.9, 0.8},
				{0.8, 0.7, 0.9, 0.8, 0.8, 0.7, 0.7},
				{0.6, 0.5, 0.7, 0.6, 0.7, 0.7, 0.6},
				{0.5, 0.4, 0.5, 0.5, 0.6, 0.6, 0.4},
				{0.4, 0.3, 0.5, 0.4, 0.5, 0.5, 0.4},
				{0.3, 0.2, 0.5, 0.2, 0.3, 0.3, 0.2}};
		
		for(int i=0; i<=6; i++){
			double sum1 = 0;
			double sum2 = 0;
			for(int j=0; j<=6; j++){
				
				sum1 += getMin(similarity[j], standard[i][j]);
				sum2 += similarity[j] + standard[i][j];
			}
			grades[i] = sum1*2/sum2;
		}
		
		return grades;
	}

	//获得最大的相似度
	public String getGrade(double[] grades,TeaInsert teaInsert) {
		String grade = "";
		double max = grades[0];
		int flag = 0;
		for (int i = 0; i < grades.length; i++) {
			
			if(max < grades[i]){
				
				max = grades[i];
				flag = i;
			}
		}
		
		switch (flag) {
		case 0:
			grade = "特一级";
			break;
		case 1:
			grade = "特二级";
			break;
		case 2:
			grade = "特三级";
			break;
		case 3:
			grade = "一级";
			break;
		case 4:
			grade = "二级";
			break;
		case 5:
			grade = "三级";
			break;
		case 6:
			grade = "四级";
			break;
		}
		
		teaInsert.setGrade(grade);
		teaInsert.setGradeNumber(flag);
		
		return grade;
	}


	
	public double getMin(double a, double b) {
		
		if(a > b){
			
			return b;
		}else {
			
			return a;
		}
	}


}
