<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imagegallery.vo.Image"%>
<%@page import="imagegallery.dao.ImageDao"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
	String userId = request.getParameter("id");
	
	Image i = new Image();
	i.setId(userId);
	
	ImageDao dao = new ImageDao();
	boolean checkId = dao.checkId(i);
%>	
<c:set var="checkId" value="<%= checkId %>" />
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
<div class="container-sm">
	<table class="table">
		<tr class="row">
			<td class="col-4 text-center p-3">아이디 : </td>
			<td class="col-8">
				<input type="text" name="id" id="id" value="<%= userId %>" class="form-control">
			</td>
		</tr>
		<tr class="row">
			<c:if test="${checkId }">
				<td class="col-8 text-center p-3">
					중복된 아이디 입니다
				</td>
				<td class="col-4">
					<input type="button" value="닫기" id="closeChild" class="btn btn-secondary">
				</td>
			</c:if>
			<c:if test="${not checkId }">
				<td class="col-8 text-center p-3">
					사용가능한 아이디 입니다
				</td>
				<td class="col-4">
					<input type="button" value="사용하기" id="useId" class="btn btn-success">
				</td>
			</c:if>
		</tr>
	</table>
</div>
<script>
	var id = opener.$("#id").val();
	// $("#id").val(id);
	
	$("#closeChild").on("click", function() {
		window.close();
	});

	$("#useId").on("click", function() {
		$("#id", opener.document).val($("#id").val());
		$("#checkIdValue", opener.document).val(1);
		window.close();
	});
</script>
	

</body>
</html>