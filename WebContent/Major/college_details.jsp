<%@page import="dao.RelationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.College"%>
<%@ page import="entity.Major"%>
<%@ page import="dao.CollegeDAO"%>
<%@ page import="dao.MajorDAO"%>
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
</head>
<body>
	<div class="table-responsive">
		<p>
			<strong>学校基础信息</strong>
		</p>
		<table class="table">
			<thead>
				<tr>
					<td style="width: 240px">名称</td>
					<td style="width: 150px">录取分数线</td>
					<td style="width: 80px">省份</td>
					<td style="width: 180px">学校介绍</td>
				</tr>
			</thead>
			<%
				CollegeDAO colldao = new CollegeDAO();
				College collfullinf = colldao.getFullInfById(Integer.parseInt(request.getParameter("college_id")));
				if (collfullinf != null) {
			%>
			<tbody>
				<tr>
					<td><%=collfullinf.getCollege_name()%></td>
					<td><%=collfullinf.getCollege_grade()%></td>
					<td><%=collfullinf.getCollege_location()%></td>
					<td><%=collfullinf.getCollege_desc()%></td>
				</tr>
				<%}%>
			</tbody>
		</table>
	</div>
	<div class="table-responsive">
		<p>
			<strong>学校专业信息</strong>
		</p>
		<table class="table text-nowrap">
			<thead>
				<tr>
					<td>专业名称</td>
					<td>专业分数线</td>
				</tr>
			</thead>
			<%
				RelationDAO md = new RelationDAO();
				ArrayList<Major> list = md.getAllMajorByCollegeName(collfullinf.getCollege_name());
				if (list != null && list.size() > 0) {
					for (int i = 0; i < list.size(); i++) {
						Major ml = list.get(i);
			%>
			<tbody>
				<tr>
					<td><%=ml.getMajor_name()%></td>
					<td><%=ml.getMajor_line()%></td>
				</tr>
				<%
					}
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>