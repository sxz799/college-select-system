<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<script type="text/javascript" src="../static/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../static/css/style.css">
</head>
<body style="margin: 200px auto;">
	<div class="container" style="margin-left: 700px;">
		<div class="row" >
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-primary">
					<div class="panel-body">
						<form action="CheckLogin.jsp" method="POST" name="loginForm">
							<div class="form-group">
								<label for="name" style="margin-top: 5px;" >用户名</label> <input type="text"
									class="form-control" name="name" placeholder="请输入用户名">
							</div>
							<div class="form-group">
								<label for="" style="margin-top: 5px;" >密码</label> <input type="password"
									class="form-control" name="pwd" placeholder="请输入密码">
							</div>
							<button type="submit" class="btn btn-success" style="margin-top: 5px;" 
								onclick="return checkForm()">登录</button>
						<a class="btn btn-primary" style="margin-top: 5px;" href="../index.jsp" style="color: #FFFFFF">返回</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function checkForm() {
		var name = loginForm.name.value;
		var pwd = loginForm.pwd.value;
		//alert(name + pwd);
		if (name == "" || name == null) {
			alert("请输入用户名");
			loginForm.name.focus();
			return false;
		} else if (pwd == "" || pwd == null) {
			alert("请输入密码");
			loginForm.pwd.focus();
			return false;
		}
		return true;
	}
</script>
</html>