<%@page import="dao.RelationDAO"%>
<%@page import="dao.CollegeDAO"%>
<%@page import="entity.College"%>
<%@page import="dao.MajorDAO"%>
<%@page import="entity.Major"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>

    <script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-select.js"></script>  
	<link rel="stylesheet" type="text/css" href="css/bootstrap-select.css">  

    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="js/bootstrap.min.js"></script>
 
  
    <script type="text/javascript"> //实现添加专业的搜索框
        $(window).on('load', function () {
            $('.selectpicker').selectpicker({
                'selectedText': 'cat',
                dropupAuto: false
            });      
        });
    </script>

</head>
<body>
	<%
		String adminuser = (String) session.getAttribute("adminuser");
		if (adminuser == null) {
	%>请先登录,3s后进入登录页面
	<%
		response.setHeader("refresh", "3,URL=login.jsp");
		}
	%>
	<%
		College coll = new College();
		CollegeDAO cDao = new CollegeDAO();
		int id = Integer.parseInt(request.getParameter("gid"));
		coll.setCollege_id(cDao.getFullInfById(id).getCollege_id());
		coll.setCollege_grade(cDao.getFullInfById(id).getCollege_grade());
		coll.setCollege_name(cDao.getFullInfById(id).getCollege_name());
		coll.setCollege_desc(cDao.getFullInfById(id).getCollege_desc());
		coll.setCollege_location(cDao.getFullInfById(id).getCollege_location());
	%>
	<p>
		<strong>大学基本信息更新 </strong>
	</p>
	<form name="example"
		action="college_do.jsp?action=upd&gid=<%=coll.getCollege_id()%>"
		method="post">
		<table class="table table-condensed">
			<tr>
				<td>学校名称</td>
				<td><input class="form-control" style="width: 400px;"
					type="text" name="cname" value="<%=coll.getCollege_name()%>"></td>
			</tr>
			<tr>
				<td>学校分数</td>
				<td><input class="form-control" style="width: 400px;"
					type="text" name="cgrade" value="<%=coll.getCollege_grade()%>"></td>
			</tr>
			<tr>
				<td>学校省份</td>
				<td><input class="form-control" style="width: 400px;"
					type="text" name="clocation"
					value="<%=coll.getCollege_location()%>"></td>
			</tr>
			<tr>
				<td>学校描述</td>
				<td><input class="form-control" style="width: 400px;"
					type="text" name="cdesc" value="<%=coll.getCollege_desc()%>"></td>
			</tr>
			<tr>
				<td>执行操作</td>
				<td><input class="btn btn-success" type="submit" value="修改">
					<input class="btn btn-danger" type="reset" value="重置"> <input
					class="btn btn-primary" type="button"
					onclick="javascript:window.location.href='collegelist.jsp';"
					value="返回" /></td>
			</tr>
		</table>
	</form>
	<p>
		<strong>专业信息更新 </strong>
	</p>
	<div class="table-responsive">
		<table class="table text-nowrap">
			<thead>
				<tr>
					<td style="width: 500px;">专业名称</td>
					<td style="width: 100px;">专业分数线</td>
					<td>操作</td>
				</tr>
			</thead>
		</table>
	</div>
	<%
		RelationDAO md = new RelationDAO();
		ArrayList<Major> list = md.getAllMajorByCollegeName(coll.getCollege_name());
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Major ml = list.get(i);
	%>
	<!-- 	功能 删除专业 -->
	<form name="example1"
		action="relation_do.jsp?action=delmajor&cname=<%=coll.getCollege_name()%>&mname=<%=ml.getMajor_name()%>"
		method="post">
		<div class="table-responsive">
			<table class="table text-nowrap">
				<tr>
					<td style="width: 500px;"><%=ml.getMajor_name()%></td>
					<td style="width: 100px;"><%=ml.getMajor_line()%></td>
					<td><input class="btn btn-danger" type="submit" value="删除"></td>
				</tr>
				<%
					}
					}
				%>
			</table>
		</div>
	</form>
	<!-- 	功能 修改专业分数线 -->
	<p>
		<strong>修改专业分数线 </strong>
	</p>
	<form name="example1"
		action="relation_do.jsp?action=updmajor&cname=<%=coll.getCollege_name()%>"
		method="post">
		<div class="table-responsive">
			<table class="table text-nowrap">
				<tr>
					<td style="width: 490px;"><select class="form-control"
						name="mname">
							<%
								RelationDAO rd1 = new RelationDAO();
								ArrayList<Major> list3 = rd1.getAllMajorByCollegeName(coll.getCollege_name());
								if (list3 != null && list3.size() > 0) {
									for (int i = 0; i < list3.size(); i++) {
										Major m = list3.get(i);
							%>
							<option><%=m.getMajor_name()%></option>
							<%
								}
								}
							%>
					</select></td>
					<td style="width: 110px;"><input class="form-control"
						type="text" name="mline" value="0"></td>
					<td><input class="btn btn-success" type="submit" value="修改">
					</td>
				</tr>
			</table>
		</div>
	</form>
	<!-- 	功能 添加专业 -->
	<p>
		<strong>添加专业 </strong>
	</p>
	<form name="example1"
		action="relation_do.jsp?action=addmajor&cname=<%=coll.getCollege_name()%>"
		method="post">
		<div class="table-responsive">
			<table class="table text-nowrap">
				<tr>
					<td style="width: 490px;height: 380px">
					  <select id="bs1Select" class="selectpicker show-tick form-control" name="mname" data-live-search="true">
							<!-- <select class="form-control" name="mname"> -->
							<%
								MajorDAO md2 = new MajorDAO();
								ArrayList<Major> list2 = md2.getAllMajor();
								if (list2 != null && list2.size() > 0) {
									for (int i = 0; i < list2.size(); i++) {
										Major m = list2.get(i);
							%>
							<option><%=m.getMajor_name()%></option>
							<%
								}
								}
							%>
					</select></td>
					<td style="width: 110px;"><input class="form-control"
						type="text" name="mline" value="0"></td>
					<td><input class="btn btn-success" type="submit" value="添加">
					</td>
				</tr>
			</table>
		</div>
	</form>


</body>
</html>