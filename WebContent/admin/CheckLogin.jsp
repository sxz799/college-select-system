<%@page import="org.omg.PortableInterceptor.SYSTEM_EXCEPTION"%>
<%@page import="dao.UserDAO"%>
<%@page import="entity.User"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String pwd=request.getParameter("pwd");
if ("admin".equals(pwd)) {
	session.setAttribute("adminuser", "admin"); //设置session
	response.sendRedirect("index.jsp");
}else{
	response.sendRedirect("login_failure.jsp");
}
%>