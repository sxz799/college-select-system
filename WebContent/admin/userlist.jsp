<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.User"%>
<%@ page import="dao.UserDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台管理</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
		<% String adminuser=(String)session.getAttribute("adminuser");
		if(adminuser==null){
			%>请先登录,3s后进入登录页面
			<% response.setHeader("refresh","3,URL=login.jsp");
		}%>
			<table class="table table-stripud" id="store">
				<thead>
					<tr>
						<th>序号</th>
						<th>用户名</th>
						<th>用户密码</th>
						<th>操作 </th>
						<th> </th>
					</tr>
				</thead>
				<!-- 循环部分开始 -->
				<%
				UserDAO ud = new UserDAO();
				ArrayList<User> list = ud.getAllUser();
				if (list != null && list.size() > 0) {
					for (int i = 0; i < list.size(); i++) {
						int k=i+1;
						User u = list.get(i);
				%>
				<tbody>
					<tr>
						<td><%=k%></td>
						<td><%=u.getName()%></td>
						<td><%=u.getPwd()%></td>
						<td class="btn btn-danger"><a style="color: white;" href="user_do.jsp?action=del&gid=<%=u.getName()%>">删除</a></td>
						<td class="btn btn-primary"><a style="color: white;" href="user_upd.jsp?action=udp&gid=<%=u.getName()%>">修改</a></td>
					</tr>
					<%
						}
						}
					%>
				</tbody>
			</table>
</body>
</html>