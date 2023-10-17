<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div class="container-xl">
	<!-- header -->
	<%@ include file="../pages/header.jsp" %>
	
	<!-- content -->

	<div class="row">
		<div class="col text-center">
			<h1 class="text-center">THANK YOU JOIN US</h1>
			<img src="../img/main_visual_pc_v1.png" style="width:700px"><br>
			<input type="button" value="로그인" onclick="location.href='loginForm.jsp'"
						class="btn bg-danger-subtle my-3" style="width:700px">
		</div>
	</div>
	
	
	</div>
</body>
</html>