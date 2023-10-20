<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="imagegallery.dao.ImageDao"%>
<%@page import="imagegallery.vo.Image"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*" %>
<%
	ImageDao dao = new ImageDao();
	ArrayList<Image> mList = dao.memberList();
%>    
<c:set var="mList" value="<%= mList %>" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../bootstrap/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<!-- header -->
	<%@ include file="../pages/header.jsp" %>
	
	<!-- -->
	<div class="row">
		<%@ include file="../pages/infoSideBar.jsp" %>
		<div>
			<div class="row">
				<div class="col">
					<table class="table">
						<thead>
							<tr>
								<td>NO</td>
								<td>이름</td>
								<td>아이디</td>
								<td>전화번호</td>
								<td>이메일</td>
								<td>이미지 수</td>
								<td>댓글 수</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="m" items="${mList }" varStatus="status">
								<tr>
									<td>${status.index + 1}</td>
									<td>${m.name }</td>
									<td>${m.id }</td>
									<td>${m.phone }</td>
									<td>${m.mail }</td>
									<td>${m.no }</td>
									<td>${m.commentNo }</td>
								</tr>			
							
							</c:forEach>
						</tbody>
					
					</table>
				</div>
			</div>	
	
		</div>
	</div>
</div>

<script src="../bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>