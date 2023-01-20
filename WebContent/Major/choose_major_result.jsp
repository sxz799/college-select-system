<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.College"%>
<%@ page import="entity.Relation"%>
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
<%
request.setCharacterEncoding("utf-8");
String mname=request.getParameter("majorname");
%>
	<strong>当前查询专业为:<%=mname %></strong>
	<table class="table table-striped" id="store">
		<thead>
			<tr>
				<th>大学ID</th>
				<th>大学名称</th>
				<th>录取分数线</th>
			</tr>
		</thead>
		<%
			CollegeDAO colldao = new CollegeDAO();
			
			ArrayList<Relation> list = colldao.getCollegeByMajor(mname);
			if (list != null && list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					int k = i + 1;
					Relation rf = list.get(i);
					String cname=rf.getRcollege_name();
					int cid=colldao.getCollegeIdByCollegeNane(cname);
		%>
		<tbody>
			<tr>
				<td><%=k%></td>
				<td><a
					href="../College/college_details.jsp?college_id=<%=cid%>"><%=cname%></a></td>
				<td><%=rf.getRmajor_line()%></td>
			</tr>
			<%
				}
				} else {
			%>
			<p>
				没有符合条件的结果，请重新查询<a href="choose_major.jsp">点击这里返回</a>
			<p>
				<%
					}
				%>
		</tbody>
	</table>
</body>
</html>