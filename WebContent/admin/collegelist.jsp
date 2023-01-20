<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.College"%>
<%@ page import="dao.CollegeDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台</title>
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
			<table class="table table-striped" id="store">
				<thead>
					<tr>
						<th>大学ID</th>
						<th>名称</th>
						<th>录取分数线</th>
						<th>省份</th>
						<th>操作</th>
						<th> </th>
					</tr>
				</thead>
				<!-- 循环部分开始 -->
				<%
					CollegeDAO colldao = new CollegeDAO();
					ArrayList<College> list = colldao.getAllCollege();
					if (list != null && list.size() > 0) {
						for (int i = 0; i < list.size(); i++) {
							int k=i+1;
							College collf = list.get(i);
				%>
				<tbody>
					<tr>
						<td><%=k%></td>
						<td><%=collf.getCollege_name()%></td>
						<td><%=collf.getCollege_grade()%></td>
						<td><%=collf.getCollege_location()%></td>
						<td class="btn btn-danger"><a style="color: white;"href="college_do.jsp?action=del&gid=<%=collf.getCollege_id()%>">删除</a></td>
						<td class="btn btn-primary"><a style="color: white;" href="college_upd.jsp?gid=<%=collf.getCollege_id()%>">修改</a></td>
					</tr>
					<%
						}
						}
					%>
				</tbody>
			</table>
</body>
</html>