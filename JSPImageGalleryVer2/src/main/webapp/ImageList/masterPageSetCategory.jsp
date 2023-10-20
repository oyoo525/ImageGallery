<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imagegallery.dao.ImageDao"%>
<%@page import="imagegallery.vo.Image"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*" %>
<%
	ImageDao dao = new ImageDao();
	ArrayList<Image> mList = dao.memberList();
%>    
<c:set var="mList" value="<%= mList %>" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="../js/jquery-3.3.1.min.js"></script>
</head>
<body>
<div class="container">
	<!-- header -->
	<%@ include file="../pages/header.jsp" %>
	
	<!-- -->
	<div class="row">
		<%@ include file="../pages/infoSideBar.jsp" %>
		<div>
			<form name="category" class="row">
				<div class="col">
					<input type="text" id="newOption">
					<input type="button" name="add" id="add" value="추가">
				</div>
			</form>	
	
		</div>
	</div>
</div>

<script src="../bootstrap/bootstrap.bundle.min.js"></script>
<script>
	$("#add").on("click", function() {
		
		$("#category").attr("action", "categoryAddProcess.jsp");
		$("#category").submit();
	});
	
</script>

</body>
</html>