<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<!-- header -->
<%@ include file="../pages/header.jsp" %>
	

<div class="container-sm">
	<!-- content -->
	<form name="loginFormWeb" id="loginFormWeb" action="loginProcess.jsp" method="post" class="row mt-5">
		<div class="col">
			<div class="row d-flex">
				<div class="col-8 offset-2 align-self-center mx-auto" style="width:500px">
					<h2>HELLO FRIEND</h2>
					<img src="../img/-xb3vfpZZ3bbnvPFFgJ0rBSCyyYi0VbXZGZCRvfNCWjXfMT90aafo-2ag-ejWt889rrHV-frxd1PU9yU7g34tA.webp"
								style="width:500px" class="mb-4">
					<input type="text" name="id" id="id" placeholder="아이디" class="form-control my-1">
					<input type="password" name="pass" id="pass" placeholder="비밀번호" class="form-control">
					<div class="row">
						<div class="col">
							<input type="submit" value="로그인" id="loginBtn" 
									class="form-control mt-3 py-2" style="background-color: #E3B3C3">
						</div>	
					</div>
					<div class="row">
						<div class="col">
							<input type="button" value="회원가입" id="loginFormJoinBtn" 
									class="form-control" style="background-color: #E3B3C3; opacity: .5;">
						</div>	
						<div class="col">
							<input type="button" value="비밀번호찾기" id="findPassBtn" 
									class="form-control" style="background-color: #E3B3C3; opacity: .5;">
						</div>	
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<script src="../bootstrap/bootstrap.bundle.min.js"></script>
<script>
	// 아이디 혹은 비밀번호를 입력하지 않았을때
	$("#loginFormWeb").on("submit", function() {
		if($("#id").val().length <= 0) {
			$("#id").focus();
			return false;
		}
		if($("#pass").val().length <= 0) {
			$("#pass").focus();
			return false;
		}
	});
	// 회원가입으로 이동
	$("#loginFormJoinBtn").on("click", function() {
		location.href = "joinForm.jsp";
	});
	// 비밀번호 찾기로 이동
	$("#findPassBtn").on("click", function() {
		location.href = "findPassForm.jsp";
	});


</script>

</body>
</html>