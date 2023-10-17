<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<!-- header -->
	<%@ include file="../pages/header.jsp" %>
	
	<!-- -->
	<div class="row">
		<%@ include file="../pages/infoSideBar.jsp" %>
		<div class="col-8">
			<form name="mypageInfoDeleteForm" action="mypageInfoDeleteProcess.jsp" method="post" class="row px-5">
				<h2 class="pb-3">탈퇴하기</h2>
				<input type="hidden" name="id" value="${sessionScope.id }">
				<div id="deleteInfoCheck">
					<p>
						사이트를 탈퇴하시겠습니까?<br>
						업로드한 모든 이미지와 댓글이 사라집니다
					</p>
					<input type="button" id="leaveBtn" value="탈퇴하기" class="btn bg-danger-subtle" >
				</div>
				<div  id="deleteInfo" style="display:none" class="text-center">
					<input type="password" name="pass" id="pass" placeholder="비밀번호를 입력하세요" class="form-control mb-3">
					<input type="submit" id="myInfoDeleteBtn" value="탈퇴하기" class="btn bg-danger-subtle">
				</div>
			</form>
		</div>
	</div>
	<script src="../bootstrap/bootstrap.bundle.min.js"></script>
	<script>
		$("#leaveBtn").on("click", function(){
			$("#deleteInfoCheck").css("display", "none");
			$("#deleteInfo").css("display", "block");
			
		});
	
		$("#myInfoDeleteBtn").on("click", function() {
			if($("#pass").val().length <= 0) {
				alert("비밀번호를 입력하세요");
				$("#pass").focus();
				return false;
			}
		});
	</script>
</div>
</body>
</html>