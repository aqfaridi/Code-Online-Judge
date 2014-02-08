  <%-- 
    Document   : deleteaction
    Created on : Aug 26, 2014, 2:22:10 PM
    Author     : Pankaj Chaudhary
--%>
<%@page import="java.sql.*"%>
<%@page import="connection.Config" %>
<%@page import="org.hibernate.Transaction"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="pojo.User"%>
<%@page import="pojo.Comment"%>
<%@page import="pojo.Problems"%>
<%@page import="pojo.ContestInfo"%>
        <%

    String contestcode = request.getParameter("contestcode");

    Config c = new Config();
    Connection con = c.getcon();
    Statement stmt = con.createStatement();


        //out.println("contest "+contest+" problem"+problem+id+cmt);
    if(contestcode!=null)
     {
       try{
            String sql = "update "+contestcode+"submissions set access='public'";
            stmt.executeUpdate(sql);
            response.sendRedirect("makepublic.jsp");
        }
       catch(Exception e){}
       finally{
       con.close();
       }
    }

%>