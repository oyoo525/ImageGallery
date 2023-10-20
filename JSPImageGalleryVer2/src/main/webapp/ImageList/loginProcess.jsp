<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="imagegallery.dao.ImageDao"%>
<%@page import="imagegallery.vo.Image"%>    
<%
	request.setCharacterEncoding("UTF-8");
	// DB에 정보 있는지 체크
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	Image i = new Image();
	i.setId(id);
	i.setPass(pass);
	
	ImageDao dao = new ImageDao();
	boolean login = dao.login(id, pass);
	boolean loginValue = id.equals("admin");
%>
<c:set var="login" value="<%= login %>" scope="session" />
<c:set var="loginValue" value="<%= loginValue %>"  scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/formCheck.js"></script>
</head>
<body>
<!-- 아이디 비밀번호가 일치할 때 -->
<c:if test="${login }">
	<c:set var="id" value="<%= id %>" scope="session" />
	<c:if test="<%= loginValue %>">
		<c:set var="loginValue" value="true" scope="session" />
	</c:if>
	
	<c:redirect url="ImageList.jsp" />
</c:if>

<!-- 아이디 비밀번호가 일치하지 않을 때-->
<c:if test="${not login }">
	<script>
		history.back();
		alert("아이디와 비밀번호가 맞지 않습니다.");
	</script>
</c:if>


</body>
</html>
