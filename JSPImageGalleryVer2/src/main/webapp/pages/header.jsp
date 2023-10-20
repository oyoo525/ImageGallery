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
<style>
	@media screen and (max-width: 1024px) {

		#infoBtn {
			width:auto;
			float:both;
		}
		#searchRow {
			max-width:none;
		}
		#searchCol {
			width: 100%;
		}
	}
</style>

</head>
<body>
<!-- Header -->
<div class="container-fluid fixed-top">
	<div class="row" style="background-color: #E3B3C3;">
		<form name="searchBar" id="searchBar" class="col">
			<div class="row align-items-center mx-auto">
				<div id="searchCol" class="col-8">
					<div id="searchRow" class="row align-items-center mx-auto" style="max-width: 1070px">
						<div class="col-auto" style="width: 70px">
							<a href="ImageList.jsp">
								<img src="../img/avatars-8lnQmcAYb76TVJxy-KAxorQ-t500x500.jpg" class="w-100" alt="logo">
							</a>
						</div>
						<div id="searchText" class="col">
							<input type="text" name="keyword" id="keyword" class="form-control w-100" placeholder="search">
						</div>
					</div>
				</div>
				<div id="infoBtn" class="col-4">
					<div id="infoBtn" class="row" style="width: 350px;float: right;">
						<div class="col">
							<!-- 로그인 상태일때 -->
							<c:if test="${sessionScope.login }">
								<div >
									<a href="uploadForm.jsp" class="btn btn-outline-success">업로드</a>
										<c:if test="${sessionScope.loginValue }">
											<a href=" ../ImageList/masterInfo.jsp" class="btn btn-light">Master</a>&nbsp;
										</c:if>
										<c:if test="${!sessionScope.loginValue }" >
											<a href=" ../ImageList/mypageInfo.jsp" class="btn btn-light">@${sessionScope.id }</a>&nbsp;										
										</c:if>
									<a href="../ImageList/logoutProcess.jsp" class="btn btn-light">로그아웃</a>&nbsp;
								</div>

							</c:if>
							<!-- 로그인 상태가 아닐때 -->
							<c:if test="${not sessionScope.login }">
								<div>
									<a href="../ImageList/loginForm.jsp" class="btn btn-outline-success">업로드</a>								
									<a href="../ImageList/joinForm.jsp" class="btn btn-light">회원가입</a>&nbsp;
									<a href="../ImageList/loginForm.jsp" class="btn btn-light">로그인</a>&nbsp;
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</form>
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
	