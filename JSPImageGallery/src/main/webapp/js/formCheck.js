/**
 * 
 */

 $(function() {

	// 이미지 업로드 메소드
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
	 



	 
 });