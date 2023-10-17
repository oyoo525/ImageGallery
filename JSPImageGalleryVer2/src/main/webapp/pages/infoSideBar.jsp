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
	<div class="col-3">
		<div class="row">
			<input type="button" id="myInfo" value="내 정보" class="btn btn-lg btn-outline-danger p-4">
			<input type="button" id="myImage" value="내 이미지" class="btn btn-lg btn-outline-danger p-4">
			<input type="button" id="deleteAccout" value="회원탈퇴" class="btn btn-lg btn-outline-danger p-4">
		</div>
	</div>
	<script src="../bootstrap/bootstrap.bundle.min.js"></script>
	<script>
		$("#myInfo").on("click", function() {
			location.href = "mypageInfo.jsp";
		});
		
		$("#deleteAccout").on("click", function() {
			location.href = "mypageInfoDelete.jsp";
		});
		$("#myImage").on("click", function() {
			location.href= "mypageImageList.jsp";
		});
	
	</script>


</body>
</html>