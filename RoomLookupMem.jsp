<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방 조회</title>
</head>
<body>

<form action="/Web/RoomLookupMem.jsp">
		보고 싶은 방을 입력하세요 :
		<input type="text" name="idx">
</form>

<%
Statement stmt = null;
ResultSet rs = null;
Connection conn = null;

try {
    String dbName = "mydb";
    String dbHost = "localhost";
    String dbID = "root";
    String dbPW = "qwer1234";
    String dbPort = "3306";
    
    String idx = request.getParameter("idx");

    conn = DriverManager.getConnection(
            "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?user="+dbID+"&password="+dbPW);
    stmt = conn.createStatement();
    rs = stmt.executeQuery("SELECT * FROM room WHERE idx =" + idx );

    while (rs.next()){
        out.println(
                rs.getString("idx")+' '+
                rs.getString("rname")+' '+
                rs.getString("Explanation")+' '+
                rs.getString("price"));
    }

    rs.close();
    stmt.close();
    conn.close();

} catch (Exception ex) {
    System.out.println(ex);
}
%>
</body>
</html>
