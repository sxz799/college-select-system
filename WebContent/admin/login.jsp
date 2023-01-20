<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<div style="margin: 200px 200px 200px 200px;">
	<div class="container">
		<div class="row" >
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-primary">
					<div class="panel-body">
						<form action="CheckLogin.jsp" method="POST" name="loginForm">
							<div class="form-group">
								<label for="pwd" style="margin-top: 5px;" >请输入管理员密码</label> <input type="password"
									class="form-control" name="pwd" placeholder="请输入管理员密码">
							</div>
							<button type="submit" class="btn btn-success" style="margin-top: 5px;" >登录</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>