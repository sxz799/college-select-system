<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册</title>
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../static/css/style.css">
</head>
<body style="margin: 200px auto;">
	<div class="container" style="margin-left: 700px;">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <form action="CheckRegister.jsp" method="POST" name="registerForm">
                            <div class="form-group">
                                <label for="name" style="margin-top: 5px;" >用户名</label> <input type="text"
                                    class="form-control" name="name" placeholder="请输入用户名"
                                    autofocus="autofocus">
                            </div>
                            <div class="form-group">
                                <label for="" style="margin-top: 5px;">密码</label> <input type="password"
                                    class="form-control" name="pwd" placeholder="请输入密码">
                            </div>
                            <div class="form-group">
                                <label for="" style="margin-top: 5px;">重复密码</label> <input type="password"
                                    class="form-control" name="repwd" placeholder="请重复密码">
                            </div>
                            <button type="submit" class="btn btn-success" style="margin-top: 5px;"
                                onclick="return checkForm()">注册</button>
                             <button  class="btn btn-primary" style="margin-top: 5px;" ><a href="../index.jsp" style="color: #FFFFFF">返回</a></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- 判断输入是否为空 -->
    <script  src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function checkForm() {
            var name = registerForm.name.value;
            var pwd = registerForm.pwd.value;
            var repwd = registerForm.repwd.value;
            //alert(name + pwd + repwd);
            if (name == "" || name == null) {
                alert("请输入用户名");
                registerForm.name.focus();
                return false;
            } else if (pwd == "" || pwd == null) {
                alert("请输入密码");
                registerForm.pwd.focus();
                return false;
            } else if (repwd == "" || repwd == null) {
                alert("请输入重复密码");
                registerForm.repwd.focus();
                return false;
            }else if(pwd!=repwd){
                alert("两次密码输入不一致，请重新输入!");
                registerForm.repwd.focus();
                return false;
            }
            return true;
        }
    </script>
    </div>
</body>
</html>
