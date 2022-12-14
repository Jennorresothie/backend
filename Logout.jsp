<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

   try {
        request.setCharacterEncoding("UTF-8");
        
        String sessionid = request.getParameter("userid");
        session.removeAttribute("sessionid");
        session.invalidate();
        
        response.sendRedirect("http://ooo-web-lb-15022423-da2b8b14cd43.kr.lb.naverncp.com/index.html");
      
   } catch (Exception e) {

      e.printStackTrace();
   }   
%>