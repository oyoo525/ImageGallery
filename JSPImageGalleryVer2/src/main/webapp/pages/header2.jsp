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
<!-- Header -->
<div class="container-fluid fixed-top">
	<div class="row" style="background-color: #E3B3C3;">
		<form name="searchBar" id="searchBar">
			<div  style="border:1px solid black; height:70px; max-width:960px">
				<div style="width: 70px; float:left">
					<a href="ImageList.jsp">
						<img src="../img/avatars-8lnQmcAYb76TVJxy-KAxorQ-t500x500.jpg" class="w-100" alt="logo">
					</a>
				</div>
				<div style="border:1px solid black; float:left; max-width:800px">
					<input type="text" name="keyword" id="keyword" class="form-control w-100" placeholder="search">
				</div>
				<!--  
				<div class="col-2">
					<input type="button" id="searchBtn" value="검색하기" class="btn btn-warning">
				</div> 
				-->
			</div>
		</form>				
				
		<div class="text-end border border-primary" style="width: 300px; position: absolute; top: 0; right: 0;">
			<div>
				<!-- 로그인 상태일때 -->
				<c:if test="${sessionScope.login }">
					<div class="d-fle">
						<a href="../ImageList/mypageInfo.jsp" class="btn btn-light">@${sessionScope.id }</a>&nbsp;
						<a href="../ImageList/logoutProcess.jsp" class="btn btn-light">로그아웃</a>&nbsp;
						<a href="uploadForm.jsp" class="btn btn-outline-success">업로드</a>
					</div>
				</c:if>
				<!-- 로그인 상태가 아닐때 -->
				<c:if test="${not sessionScope.login }">
					<div class="d-flex">
						<a href="../ImageList/joinForm.jsp" class="btn btn-light">회원가입</a>&nbsp;
						<a href="../ImageList/loginForm.jsp" class="btn btn-light">로그인</a>&nbsp;
						<a href="../ImageList/loginForm.jsp" class="btn btn-outline-success">업로드</a>								
					</div>
				</c:if>
			</div>
		</div>
	</div>
</div>
<div class="row my-5">
	<p></p>
</div>

<script src="../bootstrap/bootstrap.bundle.min.js"></script>
<script>
	$("#searchBtn").on("click", function(){
		var order = $("#order").val();
		var keyword = $("#keyword").text();
		$("#searchBar").attr("ImageList.jsp?order=" + order + "&keyword=" + keyword);
		$("#searchBar").submit();
	});

</script>


</body>
</html>
	