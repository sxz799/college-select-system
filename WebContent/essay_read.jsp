<%@page import="entity.Essay"%>
<%@page import="dao.EssayDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.College"%>
<%@ page import="dao.CollegeDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>高考志愿填报模拟</title>
<link rel="stylesheet" type="text/css" href="static/css/style.css">
<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
</head>
<body>
		<!-- 添加登录后才可以使用功能的限制 -->
		<% String username=(String)session.getAttribute("loginuser");
		if(username==null){
			 response.sendRedirect("User/login_failure2.jsp");
		}
		%> 
			<table class="table table-striped" id="store">
				<thead>
					<tr>
						<th>文章ID</th>
						<th>文章标题</th>
						
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
						<td><a href="<%=es.getEssay_link()%>" target="_blank"><%=es.getEssay_title()%></a></td>
						<td></td>
					</tr>
					<%
						}
						}
					%>
				</tbody>
			</table>
</body>
</html>