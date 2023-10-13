<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	boolean loginValue = Boolean.parseBoolean(request.getParameter("loginValue"));
%>
<c:set var="loginValue" value="<%=loginValue %>" session="" />
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
					<c:if test="${not loginValue }">
					 <p>아이디와 비밀번호가 맞지 않습니다.</p>
					</c:if>
					<input type="submit" value="로그인" id="loginBtn" 
								class="form-control my-3 py-2" style="background-color: #E3B3C3">
					<input type="button" value="회원가입">
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


</script>

</body>
</html>