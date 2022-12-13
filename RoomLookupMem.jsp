<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<%
Statement stmt = null;
ResultSet rs = null;
Connection conn = null;

try {
    String dbName = "mydb";
    String dbHost = "ooo-db-lb-15022430-ad026bc77591.kr.lb.naverncp.com";
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

