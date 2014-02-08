<%-- 
    Document   : loginaction
    Created on : Jul 5, 2014, 2:46:48 AM
    Author     : Pankaj Chaudhary
--%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="pojo.User"%>
<%@page import="sun.misc.BASE64Encoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.security.MessageDigest" %>
<%@page import="dao.ConnectionProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.io.*"%> 
<%
     String password = request.getParameter("password");
     String newpassword = request.getParameter("passwd");
     String username = (String)session.getAttribute("username");
     
     //out.println(newpassword);
     MessageDigest MD5 = MessageDigest.getInstance("MD5");
     MD5.update(password.getBytes(),0,password.getBytes().length);
     byte[] hashvalue = MD5.digest();
     password = new BASE64Encoder().encode(hashvalue);
     //conpassword encryption
       MD5.update(newpassword.getBytes(),0,newpassword.getBytes().length);
     byte[] hashvaluea = MD5.digest();
     newpassword = new BASE64Encoder().encode(hashvaluea);
     out.println(newpassword);
     
     String qry = "FROM User U WHERE U.username='"+username+"'AND U.password='"+password+"' ";
     SessionFactory factory = new ConnectionProvider().getSessionFactory();   //make datbase connection
     Session newsession=factory.openSession();
     Transaction t = newsession.beginTransaction();    //fire all query start here
         
        Query q = newsession.createQuery(qry);
         List<User> users = q.list();     //execute query statment
          try { 
                    if(q.list().size() == 1)
                    {
                         User u= (User)users.get(0); 
                         //table attribute 
                          u.setPassword(newpassword);
                          newsession.saveOrUpdate(u);  //action perform save and update
                          t.commit();
                          response.sendRedirect("profile.jsp?uid="+username);
                    }
                    else
                    {
                        response.sendRedirect("profile.jsp?failed=True&uid="+username);
                    }
         }catch(Exception ex){}
          finally
          {
                  factory.close();
                  newsession.close();
          }
         
%>