
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
response.setHeader("Access-Control-Allow-Origin", "*");
%>

<%
	Connection conn = null;
	ResultSet rs = null;
	
	String uid = request.getParameter("memEmail");
	String upw = request.getParameter("memPw");

	try {
        request.setCharacterEncoding("UTF-8");
        String dbName = "mydb";
        String dbHost = "ooo-db-lb-15022430-ad026bc77591.kr.lb.naverncp.com";
        String dbID = "root";
        String dbPW = "qwer1234";
        String dbPort = "3306";
        
        Class.forName("com.mysql.jdbc.Driver");
        
        String DB_URL = "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?useUnicode=true&serverTimezone=Asia/Seoul";
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL, dbID, dbPW);
        Statement stmt = conn.createStatement();

		String sql = "SELECT id, idx, mname, passwd FROM member WHERE id = '"+ uid +"'" ;

		rs = stmt.executeQuery(sql);
		
		if (rs.next()){
			if (rs.getString("passwd").equals(upw)) {
				out.println(rs.getString("mname")+"님의 로그인 성공");
				session.setAttribute("midx", rs.getString("idx"));
				session.setMaxInactiveInterval(-1);
								
				response.sendRedirect("http://www.ec2.n-e.kr?sid="+session.getId());

			} else {
		        out.println("패스워드 틀렸다");
			}
	    } else {
	    	out.println("아이디 틀렸다");
	    }
		
		rs.close();
		conn.close();
		
		
	} catch (Exception e) {

		e.printStackTrace();
	}	
%>