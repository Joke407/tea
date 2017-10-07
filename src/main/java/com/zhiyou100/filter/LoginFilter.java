package com.zhiyou100.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zhiyou100.vo.ResponseVO;

public class LoginFilter extends HandlerInterceptorAdapter {



	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		
		HttpSession session = request.getSession();
		Object user = session.getAttribute("user");
		if(user == null){
			ResponseVO<String> vo = new ResponseVO<String>(-1000,"你需要登录",null);
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(vo);
			
			response.setContentType("application/json;charset=utf-8");
			response.getWriter().println(json);
			return false;
		}else {
			return true;
		}
		
		
		
	}

}
