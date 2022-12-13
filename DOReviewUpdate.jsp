<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
Statement stmt = null;
Connection conn = null;
int result = 0;

try {

    String dbName = "mydb";
    String dbHost = "10.10.30.11";
    String dbID = "root";
    String dbPW = "qwer1234";
    String dbPort = "3306";
    
    request.setCharacterEncoding("UTF-8");

    String title = request.getParameter("Title");
    String content = request.getParameter("Content");
    String r_num = request.getParameter("Rnum");
   	
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(
            "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?user="+dbID+"&password="+dbPW
    );
    stmt = conn.createStatement();

    result = stmt.executeUpdate("UPDATE review SET rtitle='"+title+"',"+ "rcontent ='"+ content+ "' where idx ="+ r_num );

    System.out.println(result);

    stmt.close();
    conn.close();


} catch (Exception ex) {
    System.out.println(ex);
}
%>