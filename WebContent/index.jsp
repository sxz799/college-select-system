<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>高考志愿填报模拟</title>
<link rel="stylesheet" type="text/css" href="static/css/style.css">
</head>
<body>
<div class="top">
		<div class="t_logo">
		 <div>
			<a href="index.jsp"><img src="static/img/logo.jpg" alt="logo"></a>
		 </div>
		</div>
		<div class="t_menu">
		 <div>		
			<a href="College/choose_college.jsp" target="center_iframe">选学校 </a>
			<a href="Major/choose_major.jsp" target="center_iframe">选专业</a>
			<a href="College/college_list.jsp" target="center_iframe">大学排行榜</a>
			<a href="essay_read.jsp" target="center_iframe">高考文章阅读</a>			
		 </div>
		</div>	
		<div class="t_user">
		 <div>
			<% String username=(String)session.getAttribute("loginuser");
		if(username==null){
			%><a href="User/login.jsp" >登录</a>
			<a href="User/register.jsp" >注册</a>
			<% 
		}else{
				%>
			<a href="User/user_inf.jsp"><%=username %></a>
			<a href="User/logout.jsp" >退出</a>
				<% 
			}
  			  %>
		 </div>
		</div>	
</div>
<div class="center">
 	<iframe src="welcome.jsp"  frameborder="0" name="center_iframe" height="100%" width="100%">  
    </iframe>
</div>
<div id="footer">
 	<p>友情链接: <a href="http://www.gaokao.com/" target="_blank">高考网 </a><a href="https://ke.qq.com/" target="_blank">腾讯课堂 </a><a href="https://www.chsi.com.cn/" target="_blank">学信网 </a><a href="https://github.com/sxz799/College_Select_System" target="_blank">联系我</a></p>
	<p>高考志愿模拟填报系统</p>
</div>
</body>
</html>