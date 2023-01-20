<%@page import="dao.UserDAO"%>
<%@page import="entity.User"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String name=request.getParameter("name");
String pwd=request.getParameter("pwd");
UserDAO ud=new UserDAO();
Boolean isLogin=ud.CheckUser(name, pwd);
if (isLogin) {
	session.setAttribute("loginuser", name); //设置session
	response.sendRedirect("../index.jsp");
}else{
	%>
	<script>
	if (confirm("登录失败，请重试！")) {}
	location.replace("login.jsp");
	</script>
	<%
}
%>