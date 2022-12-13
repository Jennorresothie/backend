<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
		Statement stmt = null;
        Connection conn = null;
        int result = 0;

        try {
			request.setCharacterEncoding("UTF-8");
            String dbName = "mydb";
            String dbHost = "10.10.30.11";
            String dbID = "root";
            String dbPW = "qwer1234";
            String dbPort = "3306";

		    String title = request.getParameter("Title");
		    String content = request.getParameter("content");
		    String qna_num = request.getParameter("qna_num");

            conn = DriverManager.getConnection(
                    "jdbc:mysql://"+dbHost+":"+dbPort+"/"+dbName+"?user="+dbID+"&password="+dbPW
            );
            stmt = conn.createStatement();

            result = stmt.executeUpdate("UPDATE qna SET qtitle='"+title+"',"+ "qcontent ='"+ content+ "' WHERE idx =" + qna_num );

            System.out.println(result);
            
            stmt.close();
            conn.close();


        } catch (Exception ex) {
            System.out.println(ex);
        }
        
%>
