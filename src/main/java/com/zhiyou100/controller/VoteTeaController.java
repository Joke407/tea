package com.zhiyou100.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyou100.model.TeaVote;
import com.zhiyou100.service.VoteTeaService;
import com.zhiyou100.vo.ResponseVO;

@Controller
public class VoteTeaController {

	@Autowired
	private VoteTeaService service;
	
	@RequestMapping(path="/voteTea/list", method=RequestMethod.GET)
	public @ResponseBody List<TeaVote> listTeaVote() {
		
		return service.listVoteTea();
	}
	
	@RequestMapping(path="/voteTea/listFront", method=RequestMethod.GET)
	public @ResponseBody Object[] listFrontTeaVote() {
		List<TeaVote> list = service.listFrontVoteTea();
		int votes[] = new int[8];
		String names[] = new String[8];
		for(int i=0; i<8; i++){
			votes[i] = list.get(i).getVote();
			names[i] = list.get(i).getName();
		}
		Object data[] = new Object[2];
		data[0] = votes;
		data[1] = names;
		return data;
	}
	
	@RequestMapping(path="/voteTea/addVote",method=RequestMethod.POST)
	public @ResponseBody ResponseVO<String> addVote(@RequestBody HashMap<String, Integer>map) {
		
		service.addVote(map.get("id"));
		return new ResponseVO<String>(1,"增加成功",null);
	}
	
	
	@RequestMapping(path="voteTea/checkPhone",method=RequestMethod.POST)
	public @ResponseBody ResponseVO<String> checkPhone(HttpServletRequest request) {
		
		
		
		HttpSession session = request.getSession();
		session.setAttribute("user", "user");
		
		return new ResponseVO<String>(1,"登录成功", null);
	}
}
