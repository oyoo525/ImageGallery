<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imagegallery.vo.Image"%>
<%@page import="imagegallery.dao.ImageDao"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%
	String id = request.getParameter("id");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String phone = phone1 + "-" + phone2 + "-" + phone3;

	Image i = new Image();
	i.setId(id);
	i.setPhone(phone);
	
	ImageDao dao = new ImageDao();
	String pass = dao.findPass(i);
	
	System.out.println(id);
	System.out.println(phone);
	System.out.println(pass);
	
	
	if(pass == "") { %>
		<script>
			alert("아이디 혹은 전화번호가 일치하지 않습니다");
			history.back();
		</script>
	<% } else {%>
		<script>
			alert("회원님의 비밀번호는 <%= pass %> 입니다");
			location.href = "loginForm.jsp";
		</script>
	<% }%>    
