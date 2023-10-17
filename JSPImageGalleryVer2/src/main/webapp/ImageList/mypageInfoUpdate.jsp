<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imagegallery.dao.ImageDao"%>
<%@page import="imagegallery.vo.Image"%>   
<%@page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	Image i = new Image();
	i.setId(id);
	i.setPass(pass);
	
	ImageDao dao = new ImageDao();
	boolean isPass = dao.passCheck(i);
	
	ImageDao dao2 = new ImageDao();
	Image m = dao.memberInfo(i);
	
	String[] phone = m.getPhone().split("-");
	System.out.println(Arrays.toString(phone));
	String phone2 = phone[1];
	String phone3 = phone[2];
	
	String[] mail = m.getMail().split("@");
	String uMail = mail[0];
	String domain = mail[1];
	
%>
<c:set var="isPass" value="<%= isPass %>" />
<c:if test="${not isPass }">
	<script>
 		alert("비밀번호가 일치하지 않습니다.");
		history.back(); 
	</script>
</c:if>
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
			<form name="infoUpdateForm" id="infoUpdateForm">
				<h2>내정보</h2>
				<table>
					<tr class="row">
						<th class="col-3 ps-3">이름</th>
						<td class="col-9">
							<input type="text" name="name" id="name" class="form-control" value="<%= m.getName() %>">
						</td>
					</tr>
					<tr class="row">
						<th class="col-3 ps-3">아이디</th>
						<td class="col-9">
							<input type="text" name="id" id="id" class="form-control" value="<%= m.getId() %>" readonly>
						</td>
					</tr>
					<tr class="row">
						<th class="col-3 ps-3">비밀번호</th>
						<td class="col-9">
							<input type="password" name="pass" id="pass" class="form-control" value="<%= m.getPass() %>">
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
									<input type="text" name="phone2" id="phone2" value="<%= phone2 %>" class="form-control">
								</div>
								<div class="col">
								<input type="text" name="phone3" id="phone3" value="<%= phone3 %>" class="form-control">
								</div>
							</div>
						</td>
					</tr>	
					<tr class="row">
						<th class="col-3 ps-3">이메일</th>
						<td class="col-9">
							<div class="row">
								<div class="col-5">
									<input type="text" name="uMail" id="uMail"  value="<%= uMail %>"class="form-control">
								</div>
								<div class="col-1 text-center">
									<p>@</p>
								</div>
								<div class="col-6">
									<select name="domain" id="domain" value="<%= domain %>" class="form-control text-center">
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
				</table>
				<div class="text-center my-3">
					<input type="button" value="수정" id="infoUpdateBtn" class="btn btn-primary">
					<input type="button" value="취소" id="infoBackBtn" class="btn btn-primary">
				</div>
			</form>
		</div>
	</div>
	<script src="../bootstrap/bootstrap.bundle.min.js"></script>
	<script>
		$("#infoBackBtn").on("click", function() {
			location.href = "mypageInfo.jsp";
		});
		$("#infoUpdateBtn").on("click", function() {
			$("#infoUpdateForm").attr("action", "mypageInfoUpdateProcess.jsp");
			$("#infoUpdateForm").submit();
		});	
	
	</script>

</div>
</body>
</html>