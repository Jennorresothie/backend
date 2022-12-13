<%@page import="java.sql.*"%>
<%@page import="org.json.simple.*"%>

<% 
response.addHeader("Access-Control-Allow-Origin", "http://localhost");
response.addHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
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
            	
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(
                    "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?user="+dbID+"&password="+dbPW
            );
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select id, mname, passwd, phone from member");

                             
			JSONArray list = new JSONArray();
			
            while (rs.next()){
            	JSONObject obj = new JSONObject();
        		obj.put("id", rs.getString("id"));
        		obj.put("mname", rs.getString("mname"));
        		obj.put("passwd", rs.getString("passwd"));
        		obj.put("phone", rs.getString("phone"));
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
