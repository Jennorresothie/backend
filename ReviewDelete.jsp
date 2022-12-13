<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 삭제</title>
</head>
<body>

<form action="/Web/ReviewDelete.jsp">
		삭제할 글 번호를 입력하세요 :
		<input type="text" name="idx">
		<input type="submit" value="삭제">
</form>

<%
Statement stmt = null;
Connection conn = null;
int result = 0;

try {
	
	Class.forName("com.mysql.jdbc.Driver");

    String dbName = "mydb";
    String dbHost = "localhost";
    String dbID = "root";
    String dbPW = "qwer1234";
    String dbPort = "3306";

    String review_num = request.getParameter("idx");

    conn = DriverManager.getConnection(
            "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?user="+dbID+"&password="+dbPW
    );
    stmt = conn.createStatement();

    result = stmt.executeUpdate("DELETE FROM review WHERE idx="+review_num);

    System.out.println(result);

    stmt.close();
    conn.close();


} catch (Exception ex) {
    System.out.println(ex);
}
%>
</body>
</html>