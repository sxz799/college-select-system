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
</head>
<body style="margin-left: 600px ;margin-top: 200px;">
			<!-- 添加登录后才可以使用功能的限制 -->
		<% String username=(String)session.getAttribute("loginuser");
		if(username==null){
			 response.sendRedirect("../User/login_failure2.jsp");
		}
		%> 
	<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <form action="choose_college_result.jsp" method="POST" name="sesectForm">
                            <div class="form-group">
                                <label for="grade" style="margin-top: 5px;" >成绩</label> <input type="text"
                                    class="form-control" name="grade" placeholder="请输入成绩"
                                    autofocus="autofocus">
                            </div>
                            <!-- <div class="form-group">
                                <label for="location" style="margin-top: 5px;">目标省份</label> <input type="text"
                                    class="form-control" name="location" placeholder="省份">
                          	  </div> 
                            -->
                            <button type="submit" class="btn btn-primary" style="margin-top: 5px;" onclick="return checkForm()">查询</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>	
	<!-- 判断输入是否为空  onclick="return checkForm()" -->
    <script  src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function checkForm() {
            var grade = sesectForm.grade.value;
            if (grade == "" || grade == null) {
                alert("请输入你的成绩");
                sesectForm.grade.focus();
                return false;
            }
            return true;
        }
    </script>
</body>
</html>