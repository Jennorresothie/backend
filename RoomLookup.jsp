<%@page import="java.sql.*"%>
<%@page import="org.json.simple.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setHeader("Access-Control-Allow-Origin", "*");
%>
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
	int idx = 1;

	conn = DriverManager.getConnection(
	"jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName + "?user=" + dbID + "&password=" + dbPW);
	stmt = conn.createStatement();
	rs = stmt.executeQuery("select * from room");

	

	JSONArray list = new JSONArray();

	while (rs.next()) {
		JSONObject obj = new JSONObject();
		obj.put("idx", rs.getString("idx"));
		obj.put("rname", rs.getString("rname"));
		obj.put("Explanation", rs.getString("Explanation"));
		obj.put("price", rs.getString("price"));
		list.add(obj);
	}
	
	out.println(list.toJSONString());

	rs.close();
	stmt.close();
	conn.close();

} catch (Exception ex) {
	System.out.println(ex);
}
%>

