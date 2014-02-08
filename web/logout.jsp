<%-- 
    Document   : logout.jsp
    Created on : Jul 5, 2014, 4:17:34 AM
    Author     : Pankaj Chaudhary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        session = request.getSession();
        Cookie[] cookies = null;
        Cookie cookie = null;
        // Get an array of Cookies associated with this domain
        cookies = request.getCookies();
        if( cookies != null ){
        
        for (int i = 0; i < cookies.length; i++){
         cookie = cookies[i];
         cookie.setMaxAge(0);
      }
  }
        session.invalidate();
        response.sendRedirect("index.jsp");
%>