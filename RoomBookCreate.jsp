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
		    String dbHost = "localhost";
		    String dbID = "root";
		    String dbPW = "qwer1234";
		    String dbPort = "3306";
		
		    String startbook = request.getParameter("startbook");
		    String endbook = request.getParameter("endbook");
		    String userid = session.getId();

		    
		    System.out.println(session.getId());
		    System.out.println(session.getAttribute("userid"));

	
		    Class.forName("com.mysql.jdbc.Driver");		
		    conn = DriverManager.getConnection(
		            "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?user="+dbID+"&password="+dbPW);
		    stmt = conn.createStatement();
		    
		    

		    
            if (userid.equals(session.getId())) {
    		    String midx = (String)session.getAttribute("midx");
                
    		    int ridx = Integer.parseInt(request.getParameter("ridx"));
                System.out.println("INSERT INTO room_book (startbook, endbook, member_idx, room_idx) VALUES('"+ startbook + "' , '" + endbook + "' , " + midx  +" , " + ridx +")");
            	result = stmt.executeUpdate("INSERT INTO room_book (startbook, endbook, member_idx, room_idx) VALUES('"+ startbook + "' , '" + endbook + "' , " + midx +" , " + ridx +")");
                

                response.sendRedirect("http://localhost/userindex/reservation/reservations.html");
                
             } else {
            	 response.sendRedirect("http://localhost/userindex/user2/login.html");
             }		    

		
		    stmt.close();
		    conn.close();
		
		} catch (Exception ex) {
		    System.out.println(ex);
		}


%>
