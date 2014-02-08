<%-- 
    Document   : dpimage
    Created on : Jul 22, 2014, 10:09:28 AM
    Author     : Pankaj Chaudhary
--%>
<%@page import="java.security.Timestamp"%>
<%@page import="com.sun.rmi.rmid.ExecPermission"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="pojo.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.io.*"%> 
<%@page import="connection.Path"%>
<%@page import="java.util.Date" %>
<%
     String path=connection.Path.getArgPath("uploadimg");
        MultipartRequest m = new MultipartRequest(request,path);  
        Part filePart = request.getPart("photo");
     String username = (String)session.getAttribute("username");
     String dpimage1 = (String)m.getFilesystemName("photo");
     
     // get file extension
     //String ext = FilenameUtils.getExtension(path+dpimage);
   java.util.Date  d = new java.util.Date();
    long mm = d.getTime();   
     String ext = null;
     try
     {
        int i = dpimage1.lastIndexOf('.');
        if (i > 0) {
        ext = dpimage1.substring(i+1);
        }
     }
       catch(Exception e){}
     

     String imagename = username+mm+"."+ext;
     // File (or directory) with old name
            File file = new File(path+"/"+dpimage1);
            // File (or directory) with new name
            File file2 = new File(path+"/"+imagename);
            // Rename file (or directory)
            boolean success = file.renameTo(file2);
   
     String qry = "FROM User U WHERE U.username='"+username+"' ";
     SessionFactory factory = new ConnectionProvider().getSessionFactory();   //make datbase connection
     Session newsession=factory.openSession();
     Transaction t = newsession.beginTransaction();    //fire all query start here
        
  try {      
        Query q = newsession.createQuery(qry);
         List<User> users = q.list();     //execute query statment
        
                 if(dpimage1==null)
                 {
                    response.sendRedirect("profile.jsp?uid="+username);
                  }
                  else if(q.list().size() == 1)
                  {
                       User u= (User)users.get(0); 
                       //table attribute 
                        u.setDpimage(imagename);
                        newsession.saveOrUpdate(u);  //action perform save and update
                        t.commit();
                        session.setAttribute("dpimage", imagename);
                        response.sendRedirect("profile.jsp?uid="+username);
                  }
                  else
                      response.sendRedirect("profile.jsp?uid="+username);
             
         }
          catch(Exception ex){}
         finally
         {
              factory.close();
              newsession.close();
         }
         
%>
