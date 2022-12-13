<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 수정</title>
</head>
<body>

<form action="/Web/DOReviewUpdate.jsp" method="post">
		제목을 입력하세요
		<input type="text" name="Title">
		<p>
		내용을 입력하세요
		<input type="text" name="Content">
		<p>
		글 번호를 입력하세요
		<input type="text" name="Rnum">
		<p>
		<input type="submit" value="수정">
</form>

</body>
</html>