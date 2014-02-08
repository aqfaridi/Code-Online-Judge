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
        SessionFactory factory = new ConnectionProvider().getSessionFactory();
         //make datbase connection
        Session newsession=factory.openSession();
        Transaction t = newsession.beginTransaction();    //fire all query start here
        String id = request.getParameter("id");
        String cmt = request.getParameter("cmt");
        String contest = request.getParameter("contest");
        String problem = request.getParameter("problem");
        Config c = new Config();
    Connection con = c.getcon();
    Statement stmt = con.createStatement();
        //out.println("contest "+contest+" problem"+problem+id+cmt);
     if(id!=null)
     {
       try{
        String hql = "DELETE FROM User U WHERE U.username = '"+id+"'";
        Query query = newsession.createQuery(hql);
        query.executeUpdate();
        t.commit();
        response.sendRedirect("users.jsp");
        }
       catch(Exception e){}
    }
    else if(contest!=null)
     {
       try{
        String sql = "DELETE FROM ContestInfo  WHERE contestcode = '"+contest+"'";
        String sql1 = "drop table "+contest+"ranking" ;
        String sql2=  "drop table "+contest+"submissions";
        stmt.executeUpdate(sql);
        stmt.executeUpdate(sql1);
        stmt.executeUpdate(sql2);
        response.sendRedirect("contestdelete.jsp");
        }
       catch(Exception e){}
       finally{
       con.close();
       }
    }
    else if(problem!=null)
     {
       try{
        String hql = "DELETE FROM Problems P WHERE P.problemcode = '"+problem+"'";
        out.println(hql);
        out.println("hi");
        Query query = newsession.createQuery(hql);
        query.executeUpdate();
        out.println("hello");
        t.commit();
        out.println("bye");
        response.sendRedirect("contestdelete.jsp");
        }
       catch(Exception e){}
    }
       else if(cmt!=null)
     {
       try{
        String hql = "DELETE FROM Comment C WHERE C.id = '"+cmt+"'";
        Query query = newsession.createQuery(hql);
        out.print("hello");
        query.executeUpdate();
        t.commit();
        out.println("bye");
        response.sendRedirect("comment.jsp");
        }
       catch(Exception e){}
     
       finally{
        newsession.close();
        factory.close();
         }
     }
%>