package com.zhiyou100.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyou100.model.GradeNumber;
import com.zhiyou100.model.SelectKey;
import com.zhiyou100.model.TeaInsert;
import com.zhiyou100.service.GetGradeService;
import com.zhiyou100.service.InsertTeaService;
import com.zhiyou100.service.impl.GetGradeServiceImpl;
import com.zhiyou100.vo.ResponseVO;

@Controller
public class InsertTeaController {
	
	@Autowired
	private InsertTeaService service;

	private GetGradeService service2 = new GetGradeServiceImpl();
	
	@RequestMapping(path="/insertTea/save", method=RequestMethod.POST)
	public @ResponseBody ResponseVO<double[]> saveInsertTea(@RequestBody TeaInsert teaInsert) {
		
		
		ResponseVO<double[]> vo = new ResponseVO<double[]>();
		double[] similarity = service2.getGrades(teaInsert);  //获得各个等级的相似度
		vo.setData(similarity); // data中的是各个等级的相似度
		vo.setMessage(service2.getGrade(similarity, teaInsert)); // message中的是该茶叶获得的等级
		service.saveTea(teaInsert);
		return vo;
	}
	
	@RequestMapping(path="/insertTea/list", method=RequestMethod.POST)
	public @ResponseBody ResponseVO<List<TeaInsert>> listTeaInsert(@RequestBody SelectKey selectKey) {
		
		ResponseVO<List<TeaInsert>> vo = new ResponseVO<List<TeaInsert>>();
		vo.setData(service.listInsertTea(selectKey));
		
		
		return vo;
	}
	
	@RequestMapping(path="/insertTea/listGrade", method=RequestMethod.GET)
	public @ResponseBody int[] listGradeNumber() {
		
		return service.listGradeNumber();
	}
	
	@RequestMapping(path="/insertTea/getTea", method=RequestMethod.POST)
	public @ResponseBody TeaInsert getTea(@RequestBody HashMap<String, Integer>map) {
		
		return service.getTea(map.get("id"));
	}
	
	@RequestMapping(path="/insertTea/getCount", method=RequestMethod.GET)
	public @ResponseBody int getCount() {
		
		return service.getCount();
	}
}
