<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.College"%>
<%@ page import="entity.Major"%>
<%@ page import="dao.MajorDAO"%>
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
                        <form action="choose_major_result.jsp" method="POST" name="sesectForm">
                            <div class="form-group">
                                <label for="grade" style="margin-top: 5px;" >专业名称</label> 
                                <select id="bs1Select" class="selectpicker show-tick form-control" name="majorname" data-live-search="true">
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
							</select>
                            </div>                       
                            <button type="submit" class="btn btn-primary" style="margin-top: 5px;">查询</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>	
	
    <script  src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>
</html>