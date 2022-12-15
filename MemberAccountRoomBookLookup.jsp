<%@page import="java.sql.*"%>
<%@page import="org.json.simple.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//response.setHeader("Access-Control-Allow-Origin", "*");
response.addHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
response.addHeader("Access-Control-Allow-Credentials", "true");
%>
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

	String midx = (String) session.getAttribute("midx");

	String DB_URL = "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?useUnicode=true&serverTimezone=Asia/Seoul&characterEncoding=utf8";
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(DB_URL, dbID, dbPW);

	stmt = conn.createStatement();
	rs = stmt.executeQuery(
	"SELECT  m.mname, r.rname, rb.startbook, rb.endbook, format(DATEDIFF(rb.endbook, rb.startbook)*r.price,0) as price FROM room r, room_book rb , member m WHERE r.idx = rb.room_idx AND rb.member_idx = m.idx AND rb.member_idx="
			+ midx + " ORDER BY rb.startbook asc");

	JSONArray list = new JSONArray();

	while (rs.next()) {
		JSONObject obj = new JSONObject();
		obj.put("name", rs.getString(1));
		obj.put("room_name", rs.getString(2));
		obj.put("start", rs.getString(3));
		obj.put("end", rs.getString(4));
		obj.put("price", rs.getString(5));
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
