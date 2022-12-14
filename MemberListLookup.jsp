<%@page import="java.sql.*"%>
<%@page import="org.json.simple.*"%>

<%
response.addHeader("Access-Control-Allow-Origin", "*");
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Statement stmt = null;
ResultSet rs = null;
Connection conn = null;

JSONObject jsonob = new JSONObject();
JSONArray jsonarr = new JSONArray();

try {
	String dbName = "mydb";
	String dbHost = "ooo-db-lb-15022430-ad026bc77591.kr.lb.naverncp.com";
	String dbID = "root";
	String dbPW = "qwer1234";
	String dbPort = "3306";

	String DB_URL = "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?useUnicode=true&serverTimezone=Asia/Seoul";
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(DB_URL, dbID, dbPW);
	stmt = conn.createStatement();
	String mid = request.getParameter("mid");
	rs = stmt.executeQuery("select id, mname, passwd, phone from member where id='" + mid + "'");
	if (rs.next()) {
		out.println("true");
	} else {
		out.println("false");
	}

	rs.close();
	stmt.close();
	conn.close();

} catch (Exception ex) {
	System.out.println(ex);
}
%>