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
		
		    String dbName = "mydb";
		    String dbHost = "localhost";
		    String dbID = "root";
		    String dbPW = "qwer1234";
		    String dbPort = "3306";
		
		    String qna_num = request.getParameter("idx");
		    
		    Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection(
		            "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?user="+dbID+"&password="+dbPW
		    );
		    stmt = conn.createStatement();
		    rs = stmt.executeQuery("SELECT q.idx, q.qtitle, q.qcontent, q.qdate FROM qna q WHERE q.idx="+qna_num );
		
		    JSONArray list = new JSONArray();
		    
		    while (rs.next()){

		    	JSONObject obj = new JSONObject();
				obj.put("idx", rs.getString("idx"));
				obj.put("qtitle", rs.getString("qtitle"));
				obj.put("qcontent", rs.getString("qcontent"));
				obj.put("qdate", rs.getString("qdate"));
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

