<%@page import="dao.CollegeDAO"%>
<%@page import="dao.RelationDAO"%>
<%@page import="entity.College"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	CollegeDAO dao = new CollegeDAO();
	RelationDAO dao2 = new RelationDAO();
	College coll=new College();
	request.setCharacterEncoding("utf-8");
	String action = request.getParameter("action");
	if ("addmajor".equals(action)){
		String cname=request.getParameter("cname");
		String mname=request.getParameter("mname");
		int mline=Integer.parseInt(request.getParameter("mline"));
		boolean isOk=dao2.addMajorToCollege(cname, mname,mline);
		int id=dao.getCollegeIdByCollegeNane(cname);
		response.sendRedirect("college_upd.jsp?gid="+id);
	}
	else if ("updmajor".equals(action)){
		String cname=request.getParameter("cname");
		String mname=request.getParameter("mname");
		int mline=Integer.parseInt(request.getParameter("mline"));
		boolean isOk=dao2.updMajorforCollege(cname, mname,mline);
		int id=dao.getCollegeIdByCollegeNane(cname);
		response.sendRedirect("college_upd.jsp?gid="+id);
	}
	else if ("delmajor".equals(action)){
		String cname=request.getParameter("cname");
		String mname=request.getParameter("mname");
		boolean isOk=dao2.delMajorForCollege(cname, mname);
		int id=dao.getCollegeIdByCollegeNane(cname);
		response.sendRedirect("college_upd.jsp?gid="+id);
	}
%>