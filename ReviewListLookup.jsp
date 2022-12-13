<%@page import="java.sql.*"%>
<%@page import="org.json.simple.*"%>

<%
response.setHeader("Access-Control-Allow-Origin", "*");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
Statement stmt = null;
ResultSet rs = null;
Connection conn = null;

try {
	Class.forName("com.mysql.jdbc.Driver");
    String dbName = "mydb";
    String dbHost = "localhost";
    String dbID = "root";
    String dbPW = "qwer1234";
    String dbPort = "3306";

    conn = DriverManager.getConnection(
            "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?user="+dbID+"&password="+dbPW
    );
    stmt = conn.createStatement();
    rs = stmt.executeQuery("SELECT r.idx, r.room_idx , r.rtitle, r.rdate, m.mname FROM review r, member m WHERE r.member_idx=m.idx");

    JSONArray list = new JSONArray();
    
    while (rs.next()){

    	JSONObject obj = new JSONObject();
		obj.put("idx", rs.getString("idx"));
		obj.put("room_idx", rs.getString("room_idx"));
		obj.put("rtitle", rs.getString("rtitle"));
		obj.put("rdate", rs.getString("rdate"));
		obj.put("mname", rs.getString("mname"));
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
