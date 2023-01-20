<%@page import="dao.EssayDAO"%>
<%@page import="entity.Essay"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	EssayDAO dao = new EssayDAO();
	Essay e=new Essay();
	request.setCharacterEncoding("utf-8");
	String action = request.getParameter("action");
	if ("del".equals(action)) //是删除吗？
	{
		int gid = Integer.parseInt(request.getParameter("gid"));
		dao.delEssay(gid);//
	} 
 	else if ("upd".equals(action)) {
		String etitle=request.getParameter("etitle");
		String elink=request.getParameter("elink");
		int gid = Integer.parseInt(request.getParameter("gid"));
		e.setEssay_title(etitle);
		e.setEssay_link(elink);
		e.setEssay_id(gid);
		dao.updateEssay(e);
	}  
	else if ("add".equals(action)){
		String etitle=request.getParameter("etitle");
		String elink=request.getParameter("elink");
		e.setEssay_title(etitle);
		e.setEssay_link(elink);
		dao.addEssay(e);
	}
	response.sendRedirect("essaylist.jsp");
%>
