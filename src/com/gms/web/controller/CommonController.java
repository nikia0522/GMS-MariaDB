package com.gms.web.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gms.web.constants.Action;
import com.gms.web.domain.MemberBean;
import com.gms.web.util.DispatcherServlet;
import com.gms.web.service.MemberService;
import com.gms.web.service.MemberServiceImpl;
import com.gms.web.util.Separator;

@WebServlet({"/home.do","/common.do"})
public class CommonController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		MemberBean member=new MemberBean();
		System.out.println("CommonController 진입");
		Separator.init(request);
		switch (Separator.cmd.getAction()) {
		case Action.MOVE:
			DispatcherServlet.send(request, response);
			break;
		case Action.LOGIN:
			MemberService service=MemberServiceImpl.getInstance();
			System.out.println("###"+request.getParameter("login_id"));
			MemberBean mem=new MemberBean();
			mem.setId(request.getParameter("login_id"));
			mem.setPassword(request.getParameter("pass"));
			Map<String,Object> map=service.login(mem);
			System.out.println("넘어갈 페이지:" +map.get("page"));
			if(map.get("page").equals("main")){
				session.setAttribute("user",map.get("user"));
			}
			Separator.cmd.setPage(String.valueOf(map.get("page")));
			Separator.cmd.process();
			DispatcherServlet.send(request, response);
			break;
		case Action.LOGOUT:
			session.invalidate();
			DispatcherServlet.send(request, response);
			break;
		
		case Action.JOIN:
			session.invalidate();
			DispatcherServlet.send(request, response);
		default:
			break;
		}
	}

}