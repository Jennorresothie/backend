<%@page import="java.sql.*"%>
<%@page import="org.json.simple.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
			
            String DB_URL = "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?useUnicode=true&serverTimezone=Asia/Seoul";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, dbID, dbPW);
            
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM qna");

            JSONArray list = new JSONArray();
            
            while (rs.next()){

            	JSONObject obj = new JSONObject();
        		obj.put("idx", rs.getString("idx"));
        		obj.put("qtitle", rs.getString("qtitle"));
        		obj.put("qdate", rs.getString("qdate"));
        		obj.put("content", rs.getString("qcontent"));
        		obj.put("midx", rs.getString("member_idx"));
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
