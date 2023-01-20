<%@page import="entity.User"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户中心</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		User u = new User();
		UserDAO uDao = new UserDAO();
		String name = (String) session.getAttribute("loginuser");
	%>
	<div style="margin:300px;">
							<form name="example" action="user_do.jsp?action=upd&gid=<%=name%>" method="post">

									<table class="table table-condensud" style="width:500px; align:center ;margin-left:400px; vertical-align:middle; ">
									<tbody  >
										<tr >
											<td ><strong>用户名</strong></td>
											<td ><%=name%></td>
										</tr>
										<tr >
											<td ><strong>用户密码</strong></td>
											<td ><input class="form-control" 
												type="password" name="upwd" value=""></td>
										</tr>
									</tbody>
										<tr >
											<td  align="center">
												<input class="btn btn-success" type="submit" value="修改"> 
												<input class="btn btn-primary" type="reset" value="重置">
												<a class="btn btn-danger" href="user_do.jsp?action=del&gid=<%=name%>">注销</a>
												<a class="btn btn-default" href="../index.jsp">返回</a>
												</td>
										</tr>
									</table>
							</form>
		</div>
</body>
</html>