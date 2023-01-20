<%@page import="dao.UserDAO"%>
<%@page import="org.apache.tomcat.util.buf.UDecoder"%>
<%@page import="dao.MajorDAO"%>
<%@page import="dao.EssayDAO"%>
<%@page import="entity.Essay"%>
<%@page import="dao.CollegeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台管理</title>
<link
	href="css/bootstrap.min.css" type="text/css" rel="stylesheet">
</head>
<body>
<%
	CollegeDAO cd = new CollegeDAO();
	EssayDAO ed = new EssayDAO();
	MajorDAO md = new MajorDAO();
	UserDAO ud = new UserDAO();
%>
<table class="table table-striped">
  <thead>
    <tr>
      <th>统计信息</th>
    </tr>
  </thead>
  <tbody>
    <tr>
			<td>用户数量</td> <td><%=ud.getUserNum() %></td>
    </tr>
    <tr>     
           <td>收录大学数量</td> <td><%=cd.getCollegeNum() %></td>
    </tr>
    <tr>
           <td>收录专业数量</td> <td><%=md.getMajoreNum() %></td>
     </tr>
     <tr>
           <td>文章数量</td> <td><%=ed.getEssayeNum() %></td>
    </tr>
  </tbody>
</table>
</body>
</html>