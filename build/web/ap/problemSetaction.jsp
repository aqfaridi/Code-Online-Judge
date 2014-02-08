<%-- 
    Document   : contastcodeaction
    Created on : Jun 7, 2014, 5:27:57 AM
    Author     : kg
--%>


<%@page import="pojo.Problems"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="pojo.ContestInfo"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.io.*"%>
<%@page import="connection.Path"%>

<%  
    
   
    
    String contestcode = (String)request.getParameter("contestcode");
    String problemcode = (String)request.getParameter("problemcode");
    String path= Path.getArgPath("contests",contestcode,problemcode);
    
    session.setAttribute("contestcode", contestcode);
    session.setAttribute("problemcode", problemcode);
    out.println(path);
    File dir = new File(path);
    if(!dir.exists()){
         dir.mkdir();
    }
        SessionFactory factory = new ConnectionProvider().getSessionFactory();
        Session hiberSession = factory.openSession();
        try{
            Transaction t = hiberSession.beginTransaction();
            Problems setter = new Problems(contestcode, problemcode, "problemname", "timelimit", "problemsetter", "problemtester", 0, "problemdescription",0,0,(float)0);
            Problems check=(Problems)hiberSession.get(Problems.class, problemcode);
            if(check==null){
                hiberSession.saveOrUpdate(setter);
            }
            t.commit();
        }catch(Exception e){out.print(e.getMessage());
        }
        finally{
            hiberSession.close();
            factory.close();
        }
        response.sendRedirect("problemSetInfo.jsp");
%>