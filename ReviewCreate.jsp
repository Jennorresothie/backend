<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ReviewCreate</title>
</head>
<body>

<form action="/Web/ReviewCreate.jsp" method="post">
		제목을 입력하세요
		<input type="text" name="Title">
		<p>
		내용을 입력하세요
		<input type="text" name="content">
		<p>
		방 번호를 입력하세요
		<input type="text" name="Rnum">
		<p>
		회원번호를 입력하세요
		<input type="text" name="Mnum">
		<p>
		<input type="submit" value="전송">
</form>


<%
    Statement stmt = null;
    Connection conn = null;
    int result = 0;

    try {

        String dbName = "mydb";
        String dbHost = "localhost";
        String dbID = "root";
        String dbPW = "qwer1234";
        String dbPort = "3306";
        
        request.setCharacterEncoding("UTF-8");

        String title = request.getParameter("Title");
        String content = request.getParameter("content");
        String room_num = request.getParameter("Rnum");
       	String member_num = request.getParameter("Mnum");
       	
        Class.forName("com.mysql.jdbc.Driver");

        conn = DriverManager.getConnection(
                "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?user="+dbID+"&password="+dbPW
        );
        stmt = conn.createStatement();

        result = stmt.executeUpdate("INSERT INTO review (rtitle, rcontent, rdate, room_idx, member_idx) VALUES('"+ title + "','" + content + "', DATE_FORMAT(now(),'%Y-%m-%d'),"+ room_num +","+member_num+")" );

        System.out.println(result);

        stmt.close();
        conn.close();


    } catch (Exception ex) {
        System.out.println(ex);
    }
%>
</body>
</html>
