<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

   try {
        request.setCharacterEncoding("UTF-8");
        String dbName = "mydb";
        String dbHost = "localhost";
        String dbID = "root";
        String dbPW = "qwer1234";
        String dbPort = "3306";
        
        String sessionid = request.getParameter("userid");
        session.removeAttribute("sessionid");
        session.invalidate();
        
        System.out.println("1");
        
        response.sendRedirect("http://localhost/userindex/index.html");
      
   } catch (Exception e) {

      e.printStackTrace();
   }   
%>