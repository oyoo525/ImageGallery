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
    
<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    	<form name="loginForm" id="loginForm" action="loginProcess.jsp">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5 fw-bold" id="loginModalLabel">로그인</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        아이디 <input type="text" name="loginId" id="loginId" class="form-control">
	        비밀번호<input type="password" name="loginPass" id="loginPass" class="form-control">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="submit" class="btn btn-primary">로그인</button>
	      </div>
      </form>
    </div>
  </div>
</div>    
    
<!-- Header -->
<div class="container-xl fixed-top">
	<div class="row">
		<form name="searchBar" id="searchBar" action="searchProcess.jsp" class="col">
			<div class="row align-items-center mx-auto">
				<div class="col-8">
					<div class="row align-items-center mx-auto">
						<div class="col-1">
							<a href="ImageList.jsp">
								<img src="https://via.placeholder.com/50" alt="샘플이미지">
							</a>
						</div>
						<div class="col-9">
							<input type="text" name="searchKeyword" id="searchKeyword" required class="form-control">
						</div>
						<div class="col-2">
							<input type="submit" value="검색하기" class="btn btn-warning">
						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="row">
						<div class="col-3"></div>
						<div class="col-9">
							<a href="../ImageList/joinForm.jsp" class="btn btn-light">회원가입</a>
							<button type="button"  data-bs-toggle="modal" data-bs-target="#loginModal" 
											class="btn btn-light">로그인</button>
							<a href="uploadForm.jsp" class="btn btn-outline-success">업로드</a>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

	<script src="../bootstrap/bootstrap.bundle.min.js"></script>

</body>
</html>
	