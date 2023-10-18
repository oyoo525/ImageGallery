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
	<form name="findPassForm" id="findPassForm" action="findPassProcess.jsp" method="post" class="row mt-5">
		<div class="col">
			<div class="row d-flex">
				<div class="col-8 offset-2 align-self-center mx-auto" style="width:500px">
					<h2 class="mb-5">비밀번호 찾기</h2>
					<div>
						<input type="text" name="id" id="id" placeholder="아이디" class="form-control my-1">
					</div>

					<div class="row">
						<div class="col">
							<select name="phone1" id="phone1" class="form-control text-center">
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>019</option>
							</select>
						</div>
						<div class="col">
							<input type="text" name="phone2" id="phone2" maxlength="4" class="form-control">
						</div>
						<div class="col">
						<input type="text" name="phone3" id="phone3" maxlength="4" class="form-control">
						</div>
					</div>
					<div class="row">
						<div class="col">
							<input type="submit" value="비밀번호 찾기" id="findPassBtn" 
									class="form-control mt-3 py-2" style="background-color: #E3B3C3">
						</div>	
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<script src="../bootstrap/bootstrap.bundle.min.js"></script>

</body>
</html>