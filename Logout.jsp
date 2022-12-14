<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

   try {
        request.setCharacterEncoding("UTF-8");
        
        String sessionid = request.getParameter("userid");
        session.removeAttribute("sessionid");
        session.invalidate();
        
        response.sendRedirect("http://www.ec2.n-e.kr/");
      
   } catch (Exception e) {

      e.printStackTrace();
   }   
%>