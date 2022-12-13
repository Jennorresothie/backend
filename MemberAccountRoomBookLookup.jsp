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
            String member_num = request.getParameter("idx");
            
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?characterEncoding=utf8";

            conn = DriverManager.getConnection(
                    "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?user="+dbID+"&password="+dbPW
            );
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from room_book where member_idx ="+member_num );

			System.out.println("select * from room_book where member_idx ="+member_num);
			
			JSONArray list = new JSONArray();
			
            while (rs.next()){
            	JSONObject obj = new JSONObject();
        		obj.put("startbook", rs.getString("startbook"));
        		obj.put("endbook", rs.getString("endbook"));
        		obj.put("member_idx", rs.getString("member_idx"));
        		obj.put("room_idx", rs.getString("room_idx"));
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
