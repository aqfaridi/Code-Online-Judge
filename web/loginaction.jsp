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
     String username=request.getParameter("username");
     String password=request.getParameter("password");
     
     MessageDigest MD5=MessageDigest.getInstance("MD5");
     MD5.update(password.getBytes(),0,password.getBytes().length);
     byte[] hashvalue=MD5.digest();
     password=new BASE64Encoder().encode(hashvalue);
     
     String qry = "FROM User U WHERE U.username='"+username+"' OR U.emailid='"+username+"' ";
     SessionFactory factory = new ConnectionProvider().getSessionFactory();   //make datbase connection
     Session newsession=factory.openSession();
     List<User> users = null;
     try{
         
         Query q = newsession.createQuery(qry);
         users = q.list();     //execute query statment
    }catch(Exception ex){}
    finally
    {
        factory.close();
        newsession.close();

    }
     
     
         /*  ============= login check ================ */
     
                    if(users.size() == 1)
                    {
                        
                        
                       if(password.equals(users.get(0).getPassword()))
                       {
                            boolean flag = users.get(0).isValid();
                            if(flag)
                            {   /*     generationg cookie     */
                                
                                Cookie userdata = new Cookie(username,username+password+""+password.hashCode());
                                userdata.setMaxAge(60*60*24);                            
                                session.setAttribute("username",users.get(0).getUsername());
                                session.setAttribute("dpimage", users.get(0).getDpimage());
                                session.setAttribute("dlang", users.get(0).getDlang());
                                response.sendRedirect("index.jsp");
                            }
                            else
                                response.sendRedirect("login.jsp?Verify=True");

                       }
                       else
                             response.sendRedirect("login.jsp?Retry=True");
                    }
                    else
                        response.sendRedirect("login.jsp?Retry=True");

         
%>