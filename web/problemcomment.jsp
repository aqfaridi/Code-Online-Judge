<%-- 
    Document   : problemcomment
    Created on : Jul 6, 2014, 11:52:24 PM
    Author     : Pankaj Chaudhary
--%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="pojo.Comment"%>
<%@page import="pojo.User"%>
<%@ page errorPage="error.jsp" %>
<%@page import="pojo.Q" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.io.*"%>

<%      

	String commentProblem = (String)request.getParameter("comment");
        String username = (String)session.getAttribute("username");
        String problemcode = (String)request.getParameter("q");
        String contestcode = (String)request.getParameter("c");
        SessionFactory factory = new ConnectionProvider().getSessionFactory();
        Session hiberSession = factory.openSession();
        try{
            Transaction t = hiberSession.beginTransaction();
            java.sql.Timestamp submittime = new Timestamp(new Date().getTime());
            Comment newcomment = new Comment(username, commentProblem, problemcode, contestcode, submittime, 1);
            hiberSession.saveOrUpdate(newcomment);
            t.commit();
            response.sendRedirect("problemshow.jsp?q="+problemcode+"&c="+contestcode);
        }catch(Exception e){}
        finally{
        hiberSession.close();
        factory.close();
        }
%>