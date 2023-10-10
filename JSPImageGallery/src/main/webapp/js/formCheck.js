/**
 * 
 */

 $(function() {

	// 이미지 업로드 --> 등록하기
	$("#uploadForm").on("submit", function() {
		
		if($("#imagePath").val().length <= 0) {
			alert("파일을 선택해주세요.");
			$("#imagePath").focus();
			return false;
		}
		if($("#imageName").val().length <= 0) {
			alert("사진의 이름을 알려주세요.");
			$("#imageName").focus();
			return false;
		}
		if($("#imageContent").val().length <= 0) {
			alert("사진을 설명해주세요.");
			$("#imageContent").focus();
			return false;
		}
	});
	
	
	// 이미지 미리보기
	$("#imagePath").on("change", function(event) {
		var file = event.target.files[0];
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#previewImage").attr("src", e.target.result);
		}
		reader.readAsDataURL(file);
	});
	
 
	// 회원가입 --> 가입완료
	$("#joinForm").on("submit", function() {
		
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
		if($("#phon2").val().length <=0) {
			alert("전화번호를 입력해주세요");
			$("#name").focus();
			return false;
		} 	
		if($("#phon3").val().length <=0) {
			alert("전화번호를 입력해주세요");
			$("#name").focus();
			return false;
		} 						
		if($("#mail").val().length <=0) {
			alert("이메일을 입력해주세요");
			$("#mail").focus();
			return false;
		} 
		if($("idUncheck").val().equal("unCheckId")) {
			alert("아이디 중복체크 해주세요")
			return false;
		}

	});

	// 로그인 모달 --> 로그인
	$("#loginForm").on("submit", function () {
		if($("#loginId").val().length <=0) {
			$("#loginId").focus();
			return false;
		}
		if($("#loginPass").val().length <=0) {
			$("#loginPass").focus();
			return false;
		}		
	});

	
	// 메인화면 검색창 이벤트
	$("hSearch").on("keydown", function(e) {
		if(e.keyCod == 13) {
			alert("엔터키");
		} else {
			alert(e);
		}
				
		
	});
	
	
	 
 });