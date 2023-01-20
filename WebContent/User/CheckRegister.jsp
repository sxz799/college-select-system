<%@page import="org.apache.tomcat.util.buf.UDecoder"%>
<%@page import="dao.UserDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name"); 
	String pwd =  request.getParameter("pwd"); 
	UserDAO ud=new UserDAO();
	boolean isSuccessReg = ud.UserReg(name, pwd);
	if(isSuccessReg)
	{	
		%>
		<script>
		if (confirm("注册成功")) {}
		location.replace("login.jsp");
		</script>
		<%
	}
	else
	{
		%>
		<script>
		if (confirm("注册失败，请更换用户名后重新注册！")) {}
		location.replace("register.jsp");
		</script>
		<%
	}
%>