<%@page import="java.sql.*"%>
<%@page import="org.json.simple.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
response.setHeader("Access-Control-Allow-Origin", "*");
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
            
            String midx = (String)session.getAttribute("midx");
            
            String DB_URL = "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?useUnicode=true&serverTimezone=Asia/Seoul";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, dbID, dbPW);
            
           
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select m.mname, r.rname, rb.startbook, rb.endbook, r.price from room_book rb, room r, member m where rb.room_idx = r.idx and rb.member_idx=m.idx and rb.member_idx="+ midx +" order by rb.startbook asc");
			
			JSONArray list = new JSONArray();
			
            while (rs.next()){
            	JSONObject obj = new JSONObject();
            	obj.put("name", rs.getString(1));
        		obj.put("room_name", rs.getString(2));
        		obj.put("start", rs.getString(3));
        		obj.put("end", rs.getString(4));
        		obj.put("price", rs.getString(5));
        		list.add(obj);
            }
            
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception ex) {
            System.out.println(ex);
        }
%>
