<%@page import="imagegallery.vo.Image"%>
<%@page import="imagegallery.dao.ImageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String uId = request.getParameter("id");
	
	Image i = new Image();
	i.setId(uId);
	
	ImageDao dao = new ImageDao();
	boolean checkId = dao.checkId(i);
	String result = "";
	
	if(uId == null) {
		result = "아이디를 입력해주세요";
	} else if(checkId) {
		result = "중복된 아이디 입니다";
	} else if(!checkId) {
		result = "사용가능한 아이디 입니다";
	}
	
	
%>
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

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
				  <%= result %>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>

	<!-- content -->
	<div class="row my-5">
		<div class="col">
			<div class="row">
				&nbsp;<br>&nbsp;
			</div>
			<div class="row">
				<form name="joinForm" id="joinForm" method="post" action="joinProcess.jsp"
							class="col-8 offset-2" >
					<div class="row bg-success p-5">
						<div class="col">
							<h2>당신의 정보를 입력하세요</h2>
							<p>
								사이트를 가입하고 당신의 사진을 공유하세요<br>
								다양한 이미지를 다운로드하세요
							</p>
						</div>
					</div>
					<div class="row">
						<table class="table">
							<tbody class="col">
								<tr class="row my-2"></tr>
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
												<input type="hidden" name="unuseId" id="unuseId">
												<input type="text" name="id" id="id" class="form-control">
											</div>
											<div class="col-4 text-center">
												<input type="button" name="checkId" id="checkId" value="중복확인"
																class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
												<input type="hidden" name="idUncheck" id="idUncheck" value="false">
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
												<input type="password" name="phone2" id="phone2" class="form-control">
											</div>
											<div class="col">
											<input type="password" name="phone3" id="phone3" class="form-control">
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
							<input type="submit" value="가입하기" class="btn btn-warning">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	
		<script src="../bootstrap/bootstrap.bundle.min.js"></script>
	</div>
</body>
</html>