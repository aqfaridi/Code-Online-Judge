<%-- 
    Document   : logout.jsp
    Created on : Jul 5, 2014, 4:17:34 AM
    Author     : Pankaj Chaudhary
--%>
<%@ page errorPage="error.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session = request.getSession();
    session.invalidate();
    response.sendRedirect("adminpanel.jsp");
%>