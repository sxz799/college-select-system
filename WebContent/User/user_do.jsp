<%@page import="dao.UserDAO"%>
<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	UserDAO dao = new UserDAO();
	User u=new User();
	request.setCharacterEncoding("utf-8");
	String action = request.getParameter("action");
	if ("del".equals(action)) //是删除吗？
	{
		String uname = request.getParameter("gid");
		dao.delUser(uname);//
		session.invalidate();
		response.sendRedirect("../index.jsp");
	} 
 	else if ("upd".equals(action)) {
		String uname=request.getParameter("gid");
		String upwd=request.getParameter("upwd");
		u.setName(uname);
		u.setPwd(upwd);
		dao.updateUser(u);
		response.sendRedirect("../index.jsp");
	}  
%>
