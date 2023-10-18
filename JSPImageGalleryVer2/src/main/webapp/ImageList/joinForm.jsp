<%@page import="imagegallery.vo.Image"%>
<%@page import="imagegallery.dao.ImageDao"%>
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

	<!-- content -->
<div class="container-sm">
	<div class="row my-5">
		<div class="col">
			<div class="row d-flex">
				<form name="joinForm" id="joinForm" method="post" action="joinProcess.jsp"
							class="col-8 offset-2 align-self-center mx-auto" style="width:500px">
					<div class="row">
						<div class="col">
							<div class="row">
								<div class="col-6 ps-5">
									<h2 class="pt-5 fw-b">JOIN US</h2>
									<p>
										우리와 함께해요<br>
										다양한 사진을 공유해요
									</p>
								</div>
								<div class="col-4 text-center">
									<img src="../img/다운로드 (1).png">
								</div>
							</div>						
						</div>
					</div>
					<div class="row">
						<table class="table">
							<tbody class="col">
								<tr class="row my-6"></tr>
								<tr class="row">
									<th class="col-3 ps-3">이름</th>
									<td class="col-9">
										<input type="text" name="name" id="name" class="form-control">
									</td>
								</tr>
								<tr class="row">
									<th class="col-3 ps-3">아이디</th>
									<td class="col-9">
										<div class="row">
											<div class="col-8">
												<input type="text" name="id" id="id" class="form-control" placeholder="12자 이내 문자">
											</div>
											<div class="col-4 text-center">
												<input type="button" id="checkIdBtn" value="중복확인" class="btn btn-success">
												<input type="hidden" id="checkIdValue" value="0">
											</div>
										</div>
									</td>
								</tr>
								<tr class="row">
									<th class="col-3 ps-3">비밀번호</th>
									<td class="col-9">
										<input type="password" name="pass" id="pass" class="form-control">
									</td>
								</tr>
								<tr class="row">
									<th class="col-3 ps-3">핸드폰</th>
									<td class="col-9">
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
									</td>
								</tr>	
								<tr class="row">
									<th class="col-3 ps-3">이메일</th>
									<td class="col-9">
										<div class="row">
											<div class="col-5">
												<input type="text" name="uMail" id="uMail" class="form-control">
											</div>
											<div class="col-1 text-center">
												<p>@</p>
											</div>
											<div class="col-6">
												<select name="domain" id="domain" class="form-control text-center">
													<option>naver.com</option>
													<option>gmail.com</option>
													<option>hanmail.net</option>
													<option>nate.com</option>
													<option>직접입력</option>
												</select>
											</div>
										</div>
									</td>
								</tr>	
							</tbody>
						</table>	
					</div>
					<div class="row">
						<div class="col text-center">
							<input type="button" value="취소하기" class="btn btn-light" onclick="history.back()">
							<input type="reset" value="새로쓰기" class="btn btn-light">
							<input type="button" id="joinSubmitBtn" value="가입하기" class="btn bg-danger-subtle">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
		// 아이디 중복확인
		$("#checkIdBtn").on("click", function() {
			if($("#id").val() <= 0) {
				alert("아이디를 입력해주세요");
				<c:set var="checkId" value="" scope="session" />
				$("#id").focus();
				return false;
			}
			var id = $("#id").val();
			var child = window.open('joinCheckIdProcess.jsp?id='+id, '_blanck', 'width=420,height=300,left=200,top=200');

		});
	
		
		// 회원가입완료
		$("#joinSubmitBtn").on("click", function() {
			if($("#name").val().length <=0) {
				alert("이름을 입력해주세요");
				$("#name").focus();
				return false;
			} 
			if($("#id").val().length <=0) {
				alert("아이디를 입력해주세요");
				$("#id").focus();
				return false;
			} 
			if($("#pass").val().length <=0) {
				alert("비밀번호를 입력해주세요");
				$("#pass").focus();
				return false;
			} 
			if($("#phone2").val().length <=0) {
				alert("전화번호를 입력해주세요");
				$("#phone2").focus();
				return false;
			} 	
			if($("#phone3").val().length <=0) {
				alert("전화번호를 입력해주세요");
				$("#phone3").focus();
				return false;
			} 						
			if($("#uMail").val().length <=0) {
				alert("이메일을 입력해주세요");
				$("#mail").focus();
				return false;
			} 
			if(isNaN($("#phone2").val())) {
				alert("전화번호는 숫자를 입력해주세요");
				$("#phone2").focus();
				return false;
			} 
			if(isNaN($("#phone3").val())) {
				alert("전화번호는 숫자를 입력해주세요");
				$("#phone3").focus();
				return false;
			} 
			if($("#checkIdValue").val() == 0) {
				alert("아이디를 중복체크 해주세요");
				return false;
			}
			if($("#checkIdValue").val() == 1) {
				$("#joinForm").attr("action", "joinProcess.jsp").attr("method", "post");
				$("#joinForm").submit();
			}		
		});
		

		
	</script>	
	
	<script src="../bootstrap/bootstrap.bundle.min.js"></script>
</div>
</body>
</html>