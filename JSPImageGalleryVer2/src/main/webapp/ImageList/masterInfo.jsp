<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<!-- header -->
	<%@ include file="../pages/header.jsp" %>
	
	<!-- content -->
	<div class="row">
		<%@ include file="../pages/infoSideBar.jsp" %>
	</div>
	<div class="row my-3">
		관리자 페이지입니다.
	</div>
	<form class="row">
	 	<h2>MEMO</h2>
	 	<input type="text" name="mMemo" id="mMemo" class="form-control">
	</form>
</div>
		
</body>
</html>