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
	<div class="container-sm">
		<!-- header -->
		<%@ include file="../pages/header.jsp" %>
	
		<!-- content -->
		<div class="row">
			<div class="col">
				<div class="row">
					<br><br><br><br><br><br>
				</div>
				<form name="loginForm" id="loginForm" action="" method="post" 
							class="row d-flex">
					<div class="col-8 offset-2 align-self-center">
						<h2>로그인</h2>
						<label>아이디</label>
						<input type="text" name="loginId" id="loginId" class="form-control">
						<label>비밀번호</label>
						<input type="password" name="loginPass" id="loginPass" class="form-control">
					</div>
					<div>
					
					</div>
				</form>
			</div>
		</div>
	
	
	</div>
	<script src="../bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>