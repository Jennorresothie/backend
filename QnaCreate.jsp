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
		    
		    
		    //System.out.println("INSERT INTO qna (qtitle, qcontent, qdate, member_idx) VALUES( "+ title + "," + content + "," + "DATE_FORMAT(now(),'%Y-%m-%d')," + midx + ")");
		    //result = stmt.executeUpdate("INSERT INTO qna (qtitle, qcontent, qdate, member_idx) VALUES('"+ title + "' , '" + content + "' , " + "DATE_FORMAT(now(),'%Y-%m-%d')," + mem_num +")");		
		  
		    //System.out.println(result);
		    
            if (userid.equals(session.getId())) {
            	String name = (String)session.getAttribute("mname");
    		    String midx = (String)session.getAttribute("midx");
				
            	result = stmt.executeUpdate("INSERT INTO qna (qtitle, qcontent, qdate, member_idx) VALUES('"+ title + "' , '" + content + "' , " + "DATE_FORMAT(now(),'%Y-%m-%d')," + midx +")");
                System.out.println(name);
                
                //글 읽기 페이지로 redirect
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
