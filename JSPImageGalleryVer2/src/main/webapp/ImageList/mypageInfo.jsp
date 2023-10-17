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
<div class="container">
	<!-- header -->
	<%@ include file="../pages/header.jsp" %>
	
	<!-- -->
	<div class="row">
		<%@ include file="../pages/infoSideBar.jsp" %>
		<div class="col-8">
			<form name="mypageInfoForm" action="mypageInfoUpdate.jsp" method="post" class="row px-5">
				<h2 class="pb-3">내정보</h2>
				<input type="hidden" name="id" value="${sessionScope.id }">
				<input type="password" name="pass" id="pass" placeholder="비밀번호를 입력하세요" class="form-control">
				<input type="submit" id="myInfoBtn" value="수정하기" class="btn bg-danger-subtle">
			</form>
		</div>
	</div>
	<script src="../bootstrap/bootstrap.bundle.min.js"></script>
	<script>
		$("#myInfoBtn").on("click", function() {
			if($("#pass").val().length <= 0) {
				alert("비밀번호를 입력하세요");
				$("#pass").focus();
				return false;
			}
		});
	</script>
</div>
</body>
</html>