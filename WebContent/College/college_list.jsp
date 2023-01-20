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
<link rel="stylesheet" type="text/css" href="../static/css/style.css">
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="../static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../static/js/Search.js"></script>
</head>
<body>
	<!-- 添加登录后才可以使用功能的限制 -->
	<%
		String username = (String) session.getAttribute("loginuser");
		if (username == null) {
			response.sendRedirect("../User/login_failure2.jsp");
		}
	%>
	<strong>输入学校关键字进行筛选</strong>
	<div style="width: 300px" class="input-group">
		<input class="form-control" name="key" type="text" id="key"
			onkeydown="onSearch(this)" value="" />
	</div>
	<table class="table table-striped" id="store">
		<thead>
			<tr>
				<th>大学ID</th>
				<th>名称</th>
				<th>录取分数线</th>
				<th>省份</th>
			</tr>
		</thead>
		<!-- 循环部分开始 -->
		<%
			CollegeDAO colldao = new CollegeDAO();
			ArrayList<College> list = colldao.getAllCollege();
			if (list != null && list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					int k = i + 1;
					College collf = list.get(i);
		%>
		<tbody>
			<tr>
				<td><%=k%></td>
				<td><a
					href="college_details.jsp?college_id=<%=collf.getCollege_id()%>"><%=collf.getCollege_name()%></a></td>
				<td><%=collf.getCollege_grade()%></td>
				<td><%=collf.getCollege_location()%></td>
			</tr>
			<%
				}
				}
			%>
		</tbody>
	</table>
</body>
</html>