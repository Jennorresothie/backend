<%@page import="java.sql.*"%>
<%@page import="org.json.simple.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
response.setHeader("Access-Control-Allow-Origin", "http://localhost");
response.addHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
response.addHeader("Access-Control-Allow-Credentials", "true");
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
            
            
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(
                    "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?user="+dbID+"&password="+dbPW
            );
            stmt = conn.createStatement();
            
            
            String midx = (String)session.getAttribute("midx");
            
            rs = stmt.executeQuery("select r.rname, rb.startbook, rb.endbook, r.price from room_book rb, room r where rb.room_idx = r.idx and rb.member_idx=" + midx +" order by rb.startbook asc");
         
			
            
			JSONArray list = new JSONArray();
			
            while (rs.next()){
            	JSONObject obj = new JSONObject();
        		obj.put("room_name", rs.getString(1));
        		obj.put("start", rs.getString(2));
        		obj.put("end", rs.getString(3));
        		obj.put("price", rs.getString(4));
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
