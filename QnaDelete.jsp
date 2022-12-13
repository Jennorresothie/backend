<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

		Statement stmt = null;
		Connection conn = null;
		int result = 0;
		
		try {
		
		    String dbName = "mydb";
		    String dbHost = "localhost";
		    String dbID = "root";
		    String dbPW = "qwer1234";
		    String dbPort = "3306";
		
		    String qna_num = request.getParameter("idx");
		    String userid = request.getParameter("uid");
		
		    Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection(
		            "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?user="+dbID+"&password="+dbPW
		    );
		    stmt = conn.createStatement();
		
		    //result = stmt.executeUpdate("DELETE FROM qna WHERE idx="+qna_num);		
		    //System.out.println(result);
		    
			if (userid.equals(session.getId())) {
            	String name = (String)session.getAttribute("mname");
    		    String midx = (String)session.getAttribute("midx");
				
            	result = stmt.executeUpdate("DELETE FROM qna WHERE idx=" + qna_num);
                
                //글 목록 페이지로 redirect
                //response.sendRedirect("http://localhost/userindex/user2/login.html");
                
             } else {
            	 response.sendRedirect("http://localhost/userindex/user2/login.html");
             }		
		
		    stmt.close();
		    conn.close();
		
		
		} catch (Exception ex) {
		    System.out.println(ex);
		}

%>