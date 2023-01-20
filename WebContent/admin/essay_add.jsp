<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String htmlData = request.getParameter("description") != null ? request.getParameter("description") : "";
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<%
		String adminuser = (String) session.getAttribute("adminuser");
		if (adminuser == null) {
	%>请先登录,3s后进入登录页面
	<%
		response.setHeader("refresh", "3,URL=login.jsp");
		}
	%>
		<form name="addForm" action="essay_do.jsp?action=add" method="post">
			<table class="table table-condensed">
				<thead>
					<tr>
						<th>添加文章</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>文章标题</td>
						<td><input class="form-control" style="width: 400px;"
							type="text" name="etitle"></td>
					</tr>
					<tr>
						<td>文章链接</td>
						<td><input class="form-control" style="width: 400px;"
							type="text" name="elink"></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<button class="btn btn-success" type="submit"
								onclick="return checkForm()">添加</button> <input
							class="btn btn-danger" type="reset" value="重置"> <input
							class="btn btn-primary" type="button"
							onclick="javascript:window.location.href='essaylist.jsp';"
							value="返回" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	<script type="text/javascript">
		function checkForm() {
			var title = addForm.etitle.value;
			var link = addForm.elink.value;
			if (title == "" || title == null) {
				alert("请输入标题");
				addForm.title.focus();
				return false;
			} else if (link == "" || link == null) {
				alert("请输入链接");
				addForm.link.focus();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>
