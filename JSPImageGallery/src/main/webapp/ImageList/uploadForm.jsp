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
		<div class="row">
		<form class="col-8">
			<div class="row">
				<div class="col-1">
					<img src="https://via.placeholder.com/50" alt="샘플이미지" src="imageList.jsp">
				</div>
				<div class="col-9">
					<input type="text" class="form-control">
				</div>
				<div class="col-2">
					<input type="button" value="검색하기" href="" class="btn btn-warning">
				</div>
			</div>
		</form>
		<div class="col-4 text-end">
			<input type="button" value="회원가입" href="" class="btn btn-light">
			<input type="button" value="로그인" href="" class="btn btn-light">
			<a href="uploadForm.jsp" class="btn btn-outline-success">업로드</a>
		</div>
	</div>
	
	<!-- content -->
	<div class="row my-5">
		<form name="uploadForm" id="uploadForm" action="uploadProcess.jsp" method="post" 
					enctype="multipart/form-data" class="col-8 offset-2">
			<input type="hidden" name="imageId" id="imageId" value="admin">
			<table class="table">
				<tbody>
					<tr>
						<th class="col-2 text-center">사진 미리보기</th>
						<td>  </td>			
					</tr>
					<tr>
						<td colspan="2">
							<img src="https://via.placeholder.com/800X400" alt="샘플이미지">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="file" name="imagePath" id="imagePath" class="form-control">
						</td>
					</tr>
					<tr>
						<th class="col-2 text-center">사진 이름</th>
						<td>
							<input type="text" name="imageName" id="imageName" class="form-control">
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
					<input type="button" value="뒤로가기" class="btn btn-light">
					<input type="reset" value="새로쓰기" class="btn btn-light">
					<input type="submit" value="등록하기" class="btn btn-warning">
				</div>
			</div>
		</form>


	</div>
		<script src="../bootstrap/bootstrap.bundle.min.js"></script>
	</div>
</body>
</html>