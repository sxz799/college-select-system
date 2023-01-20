<%@page import="dao.MajorDAO"%>
<%@page import="entity.Major"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MajorDAO dao = new MajorDAO();
	Major m=new Major();
	request.setCharacterEncoding("utf-8");
	String action = request.getParameter("action");
	if ("del".equals(action)) //是删除吗？
	{
		String mname = request.getParameter("gid");
		boolean isOk=dao.delMajor(mname);//
	} 
 	/* else if ("upd".equals(action)) {
		String name=request.getParameter("mname");
		m.setMajor_name(name);
		dao.updateMajor(m);
	}   */
	else if ("add".equals(action)){
		String mname=request.getParameter("mname");
		m.setMajor_name(mname);
		boolean isOk=dao.addMajor(m);
	}
	response.sendRedirect("majorlist.jsp");
%>
