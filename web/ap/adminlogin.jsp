<%-- 
    Document   : adminlogin
    Created on : Jul 7, 2014, 2:33:00 PM
    Author     : Pankaj Chaudhary
--%>

<%-- 
    Document   : loginaction
    Created on : Jul 5, 2014, 2:46:48 AM
    Author     : Pankaj Chaudhary
--%>

<%@page import="org.hibernate.Query"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="pojo.Admin"%>
<%@page import="sun.misc.BASE64Encoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.security.MessageDigest" %>
<%@page import="dao.ConnectionProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.io.*"%> 
<%
     String username=request.getParameter("username");
     String password=request.getParameter("password");
     out.println("username"+username);
     MessageDigest MD5=MessageDigest.getInstance("MD5");
     MD5.update(password.getBytes(),0,password.getBytes().length);
     byte[] hashvalue=MD5.digest();
     password=new BASE64Encoder().encode(hashvalue);
     String qry = "FROM Admin A WHERE A.username='"+username+"' and A.password='"+password+"' ";
     SessionFactory factory = new ConnectionProvider().getSessionFactory();   //make datbase connection
     Session newsession=factory.openSession();
     Transaction t = newsession.beginTransaction();    //fire all query start here
       Admin  A = null;  
        Query q = newsession.createQuery(qry);
         List<Admin> users = q.list();     //execute query statment
          try { 
          if(q.list().size() == 1)
          {           
             session.setAttribute("adminuser", username);
             session.setAttribute("level", ""+users.get(0).getLevel());
             response.sendRedirect("adminprofile.jsp");
          }
          else
              response.sendRedirect("adminpanel.jsp");

         }catch(Exception ex){}
        finally
        {
            newsession.close();
            factory.close();

        }
         
%>