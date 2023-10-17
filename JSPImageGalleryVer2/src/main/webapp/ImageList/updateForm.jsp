<%@page import="imagegallery.dao.ImageDao"%>
<%@page import="imagegallery.vo.Image"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no = request.getParameter("no");
	
	ImageDao dao = new ImageDao();
	Image i = dao.getImage(Integer.parseInt(no));
	
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
	
	<!-- content -->
	<div class="row my-5">
		<div class="col">
			<div class="row">
				&nbsp;</br>&nbsp;
			</div>
			<div class="row">
				<form name="updateForm" id="updateForm" action="updateProcess.jsp"
						enctype="multipart/form-data" class="col-8 offset-2">
					<h2 class="fw-bold">사진 수정하기</h2>
					<input type="hidden" name="imageNo" id="imageNo" value="<%= i.getNo() %>">
					<input type="hidden" name="imagePath" id="imagePath" value="<%= i.getImagePath() %>">
					<input type="hidden" name="imageId" id="imageId" value="<%= i.getImageId() %>">
					<table class="table">
						<tbody>
							<tr>
								<th colspan="2" class="text-start">사진 미리보기</th>
							</tr>
							<tr>
								<td colspan="2">
									<div class="text-center">
										<img src="<%= i.getImagePath() %>" id="previewImage" style="max-width:800px; max-height:400px">
									</div>
								</td>
							</tr>
							<tr>
								<th class="col-2 text-center">사진 이름</th>
								<td>
									<input type="text" value="<%= i.getImageName() %>" name="imageName" id="imageName" class="form-control">
								</td>
							</tr>
							<tr>
								<th class="col-2 text-center">사진 설명</th>
								<td>  </td>
							</tr>
							<tr>
								<td colspan="2">
									<textarea name="imageContent" id="imageContent" rows="10" class="form-control"><%= i.getImageContent() %></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="row text-center">
						<div class="col">
							<input type="button" value="뒤로가기" name="backBtn" id="backBtn" class="btn btn-light"
											onclick="history.back()">
							<input type="submit" value="등록하기" class="btn bg-danger-subtle">
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