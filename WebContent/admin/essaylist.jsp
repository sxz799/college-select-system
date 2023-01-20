<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.Essay"%>
<%@ page import="dao.EssayDAO"%>
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
						<th>文章ID</th>
						<th>文章标题</th>
						<th>文章链接</th>
						<th>操作</th>
						<th> </th>
					</tr>
				</thead>
				<!-- 循环部分开始 -->
				<%
				EssayDAO ed = new EssayDAO();
				ArrayList<Essay> list = ed.getAllEssay();
				if (list != null && list.size() > 0) {
					for (int i = 0; i < list.size(); i++) {
						int k=i+1;
						Essay es = list.get(i);
				%>
				<tbody>
					<tr>
						<td><%=k%></td>
						<td><%=es.getEssay_title()%></td>
						<td><a href="<%=es.getEssay_link()%>" target="_blank">点击跳转</a></td>
						<td class="btn btn-danger"><a style="color: white;" href="essay_do.jsp?action=del&gid=<%=es.getEssay_id()%>">删除</a></td>
						<td class="btn btn-primary"><a style="color: white;" href="essay_upd.jsp?action=udp&gid=<%=es.getEssay_id()%>">修改</a></td>
					</tr>
					<%
						}
						}
					%>
				</tbody>
			</table>
</body>
</html>