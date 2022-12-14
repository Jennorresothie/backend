<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setHeader("Access-Control-Allow-Origin", "*");
%>
<%
Statement stmt = null;
int result = 0;
Connection conn = null;

try {
	request.setCharacterEncoding("UTF-8");
    String dbName = "mydb";
    String dbHost = "10.10.30.11";
    String dbID = "root";
    String dbPW = "qwer1234";
    String dbPort = "3306";
	
    String DB_URL = "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?useUnicode=true&serverTimezone=Asia/Seoul";
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(DB_URL, dbID, dbPW);
	stmt = conn.createStatement();
	
	String uid = request.getParameter("memEmail");
	String upw = request.getParameter("passwd");
	String uname = request.getParameter("mname");
	String uph = request.getParameter("phone");
	

	result = stmt.executeUpdate("INSERT INTO member (id, passwd, mname, phone) VALUES('" + uid + "' , '" + upw + "' , '"+ uname +"' , '"+ uph +"')");

	response.sendRedirect("http://ec2.n-e.kr");
	conn.close();
} catch (Exception e) {

	e.printStackTrace();
}
%>

