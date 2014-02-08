<%-- 
    Document   : profilechange
    Created on : Jul 6, 2014, 9:53:17 PM
    Author     : Pankaj Chaudhary
--%>


<%@page import="org.hibernate.Query"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="pojo.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.io.*"%> 
<%
     
     String username = (String)session.getAttribute("username");
     
     String fullname = request.getParameter("fullname");
     String institute = request.getParameter("institute");
     String day = request.getParameter("day");
     String month = request.getParameter("month");
     String year = request.getParameter("year");
     String phoneno = request.getParameter("phoneno");
     String city = request.getParameter("city");
     String country = request.getParameter("country");
     String address = request.getParameter("address");
     String website = request.getParameter("website");
     String aboutme = request.getParameter("aboutme");
     String dlang = request.getParameter("dlang");
     String dateofbirth = day+"/"+month+"/"+year; 
     //out.println(username+" "+fullname+" "+phoneno+" "+city+" "+country+" "+address+" "+website+" "+aboutme+" "+day+" "+month+ " "+year);
     String qry = "FROM User U WHERE U.username='"+username+"'";
     SessionFactory factory = new ConnectionProvider().getSessionFactory();   //make datbase connection
     Session newsession=factory.openSession();
     Transaction t = newsession.beginTransaction();    //fire all query start here
         try { 
        Query q = newsession.createQuery(qry);
         List<User> users = q.list();     //execute query statment
          
          if(q.list().size() == 1)
          {
               User u= (User)users.get(0); 
               //table attribute 
               u.setFullname(fullname);
               u.setInstitute(institute);
               u.setDateofbirth(dateofbirth);
               u.setPhoneno(phoneno);
               u.setAboutme(aboutme);
                u.setDlang(dlang);
               u.setAddress(address);
               u.setCity(city);
               u.setCountry(country);
               u.setWebsite(website);
                newsession.saveOrUpdate(u);  //action perform save and update
        t.commit();
             response.sendRedirect("profile.jsp?uid="+username);
      
       
                
          }
          else
           {
              response.sendRedirect("profile.jsp?uid="+username);
          }
         }
         catch(Exception ex){}
         finally
         {
          factory.close();
        newsession.close();
        }
%>