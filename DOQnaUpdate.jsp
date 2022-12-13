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
<%
		Statement stmt = null;
        Connection conn = null;
        int result = 0;

        try {
			request.setCharacterEncoding("UTF-8");
            String dbName = "mydb";
            String dbHost = "localhost";
            String dbID = "root";
            String dbPW = "qwer1234";
            String dbPort = "3306";

		    String title = request.getParameter("Title");
		    String content = request.getParameter("content");
		    String qna_num = request.getParameter("qna_num");

            conn = DriverManager.getConnection(
                    "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?user="+dbID+"&password="+dbPW
            );
            stmt = conn.createStatement();

            result = stmt.executeUpdate("UPDATE qna SET qtitle='"+title+"',"+ "qcontent ='"+ content+ "' WHERE idx =" + qna_num );

            System.out.println(result);
            
            stmt.close();
            conn.close();


        } catch (Exception ex) {
            System.out.println(ex);
        }
        
%>
</body>
</html>