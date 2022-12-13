<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/web/DOQnaUpdate.jsp" method="post">
		제목을 입력하세요
		<input type="text" name="Title">
		<p>
		내용을 입력하세요
		<input type="text" name="content">
		<p>
		글번호를 입력하세요
		<input type="text" name="qna_num">
		<p>		
		<input type="submit" value="전송">
</form>

</body>
</html>