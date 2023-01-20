<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String htmlData = request.getParameter("description") != null ? request.getParameter("description") : "";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd 
">
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
		<form name="example" action="college_do.jsp?action=add" method="post">
			<table class="table table-condensed">
				<thead>
					<tr>
						<th>添加大学</th>
						<th>添加后会自动跳转到更新页面进行专业设置</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>学校名称</td>
						<td><input class="form-control" style="width: 400px;"
							type="text" name="cname"></td>
					</tr>
					<tr>
						<td>学校分数</td>
						<td><input class="form-control" style="width: 400px;"
							type="text" name="cgrade"></td>
					</tr>
					<tr>
						<td>学校省份</td>
						<td><input class="form-control" style="width: 400px;"
							type="text" name="clocation"></td>
					</tr>
					<tr>
						<td>学校描述</td>
						<td><input class="form-control" style="width: 400px;"
							type="text" name="cdesc"></td>
					</tr>
					<tr>
						<td></td>
						<td><input class="btn btn-success" type="submit" onclick="return checkForm()" value="添加">
							<input class="btn btn-danger" type="reset" value="重置"> <input
							class="btn btn-primary" type="button"
							onclick="javascript:window.location.href='collegelist.jsp';"
							value="返回" /></td>
					</tr>
				</tbody>
			</table>
		</form>
			<!-- 判断输入是否为空  onclick="return checkForm()" -->
    <script  src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function checkForm() {
            var cname = example.cname.value;
            var cgrade = example.cgrade.value;
            var clocation = example.clocation.value;
            var cdesc = example.cdesc.value;
            if (cname == "" || cname == null) {
                alert("请输入学校名称");
                example.cname.focus();
                return false;
            }
            if (cgrade == "" || cgrade == null) {
                alert("请输入分数线");
                example.cgrade.focus();
                return false;
            }
            if (clocation == "" || clocation == null) {
                alert("请输入省份");
                example.clocation.focus();
                return false;
            }
            if (cdesc == "" || cdesc == null) {
                alert("请输入学校描述");
                example.cdesc.focus();
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
