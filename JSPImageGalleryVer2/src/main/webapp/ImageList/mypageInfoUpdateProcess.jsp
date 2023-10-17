<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imagegallery.dao.ImageDao"%>
<%@page import="imagegallery.vo.Image"%>    
<%
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String phone = phone1 + "-" + phone2 + "-" + phone3;
	String uMail = request.getParameter("uMail");
	String domain = request.getParameter("domain");
	String mail = uMail + "@" + domain;
	
	Image i = new Image();
	i.setName(name);
	i.setId(id);
	i.setPass(pass);
	i.setPhone(phone);
	i.setMail(mail);
	
	ImageDao dao = new ImageDao();
	dao.updateMemberInfo(i);
	
	response.sendRedirect("mypageInfo.jsp");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>