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
				<form name="uploadForm" id="uploadForm" action="uploadProcess.jsp" method="post" 
						enctype="multipart/form-data" class="col-8 offset-2">
					<input type="hidden" name="imageId" id="imageId" value="${sessionScope.id }">
					<h2 class="fw-bold">사진 업로드</h2>
	
					<table class="table">
						<tbody>
							<tr>
								<th colspan="2" class="text-start">사진 미리보기</th>
							</tr>
							<tr>
								<td colspan="2">
									<div class="text-center">
										<img id="previewImage" style="max-width:800px; max-height:400px">
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="file" name="imagePath" id="imagePath" accept="image/*" class="form-control">
								</td>
							</tr>
							<tr>
								<th class="col-2 text-center">사진 이름</th>
								<td>
									<input type="text" name="imageName" id="imageName" class="form-control">
								</td>
							</tr>
							<tr>
								<th class="col-2 text-center">캐릭터</th>
								<td>
									<select name="character" id="character">
										<option value="">캐릭터를 선택해주세요</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="col-2 text-center">사진 설명</th>
								<td>  </td>
							</tr>
							<tr>
								<td colspan="2">
									<textarea name="imageContent" id="imageContent" rows="10" class="form-control"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="row text-center">
						<div class="col">
							<input type="button" value="뒤로가기" name="backBtn" id="backBtn" class="btn btn-light"
											onclick="history.back()">
							<input type="reset" value="새로쓰기" class="btn btn-light">
							<input type="submit" value="등록하기" class="btn btn-warning">
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