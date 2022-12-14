<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Statement stmt = null;
	int result = 0;
	Connection conn = null;
	
	try {
		request.setCharacterEncoding("UTF-8");
	    String dbName = "mydb";
	    String dbHost = "10.10.30.11";
	    String dbID = "root";
	    String dbPW = "qwer1234";
	    String dbPort = "3306";
	
	    String title = request.getParameter("title");
	    String content = request.getParameter("content");
	    String userid = request.getParameter("uid");
	    
	    		    
	    System.out.println(session.getId());
	
	
	    Class.forName("com.mysql.jdbc.Driver");		
	    conn = DriverManager.getConnection(
	            "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?user="+dbID+"&password="+dbPW);
	    stmt = conn.createStatement();
	
	
	    if (userid.equals(session.getId())) {
	    	String name = (String)session.getAttribute("mname");
		    String midx = (String)session.getAttribute("midx");

		    result = stmt.executeUpdate("INSERT INTO review (rtitle, rcontent, rdate, room_idx, member_idx) VALUES('"+ title + "','" + content + "', DATE_FORMAT(now(),'%Y-%m-%d'), 1, " + midx +")" );
	        
	        //글 읽기 페이지로 redirect
	        response.sendRedirect("http://ooo-web-lb-15022423-da2b8b14cd43.kr.lb.naverncp.com/review.html");
	        
	     } else {
	    	 response.sendRedirect("http://ooo-web-lb-15022423-da2b8b14cd43.kr.lb.naverncp.com/login.html");
	     }		    
	
	
	    stmt.close();
	    conn.close();
	
	} catch (Exception ex) {
	    System.out.println(ex);
	}
	
	
%>
	
