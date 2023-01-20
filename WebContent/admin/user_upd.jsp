<%@page import="dao.UserDAO"%>
<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("description") != null ? request.getParameter("description") : "";
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body >
		<% String adminuser=(String)session.getAttribute("adminuser");
		if(adminuser==null){
			%>请先登录,3s后进入登录页面
			<% response.setHeader("refresh","3,URL=login.jsp");
		}%>
	<%
		User u=new User();
		UserDAO uDao = new UserDAO();
		String name=request.getParameter("gid");
		u.setName(uDao.geteUserByName(name).getName());
		u.setPwd(uDao.geteUserByName(name).getPwd());
	%>
		<form name="example" action="user_do.jsp?action=upd&gid=<%=u.getName() %>" method="post">
			<table class="table table-condensud"> 
				<thead>
					<tr>
						<th>更新用户信息</th>
					</tr>
				</thead>
				<tbody>
				<tr>
					<td>用户名</td>
					<td><input class="form-control" style="width:400px;" type="text" name="uname" value="<%=u.getName() %>" ></td>
				</tr>
				<tr>
					<td>用户密码</td>
					<td><input class="form-control" style="width:400px;" type="text" name="upwd" value="<%=u.getPwd()%>" ></td>
				</tr>
				<tr>
					<td></td>
					<td>
					<input class="btn btn-success"	 type="submit" 		value="修改">
					<input class="btn btn-danger" 	 type="reset" 		value="重置">
					<input class="btn btn-primary"	 type="button"		onclick="javascript:window.location.href='userlist.jsp';" value="返回" />
					</td>
				</tr>
		</tbody>
			</table>
		</form>
</body>
</html>
