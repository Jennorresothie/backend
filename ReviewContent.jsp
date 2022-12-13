<%@page import="java.sql.*"%>
<%@page import="org.json.simple.*"%>

<%
response.setHeader("Access-Control-Allow-Origin", "*");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

ResultSet rs = null;
Connection conn = null;

try {

    String dbName = "mydb";
    String dbHost = "localhost";
    String dbID = "root";
    String dbPW = "qwer1234";
    String dbPort = "3306";

    String review_num = request.getParameter("idx");
    
    Class.forName("com.mysql.jdbc.Driver");

    conn = DriverManager.getConnection(
            "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?user="+dbID+"&password="+dbPW
    );
    Statement stmt = conn.createStatement();
    rs = stmt.executeQuery("SELECT idx, rtitle, rcontent, rdate FROM review WHERE idx = " + review_num );

    JSONArray list = new JSONArray();
    
    while (rs.next()){

    	JSONObject obj = new JSONObject();
		obj.put("idx", rs.getString("idx"));
		obj.put("rtitle", rs.getString("rtitle"));
		obj.put("rcontent", rs.getString("rcontent"));
		obj.put("rdate", rs.getString("rdate"));

		list.add(obj);
		
    }
    
    out.println(list.toJSONString());

	rs.close();
	stmt.close();
	conn.close();
} catch (Exception ex) {
	ex.printStackTrace();
}
%>
