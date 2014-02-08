<%-- 
    Document   : contastcodeaction
    Created on : Jun 7, 2014, 5:27:57 AM
    Author     : kg
--%>
<%@ page errorPage="error.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="javax.xml.soap.Text"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="pojo.ContestInfo"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.io.*"%>
<%@page import="connection.Config" %>
<%@page import="connection.Path" %>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%  
    //MultipartRequest mm = new MultipartRequest(request ,"c:\\Users\\kg\\Documents");  

    //String path = "C:\\Users\\Pankaj Chaudhary\\Desktop\\onlinejudgemain\\web\\contests\\";

    //String path="/home/letmestart/Desktop/onlinejudge/web/contests/";
    String contestcode = (String)request.getParameter("contestcode");
    String path = Path.getArgPath("contests",contestcode);
    //path+=contestcode;
    
    session.setAttribute("contestcode", contestcode);
    File dir = new File(path);
    if(!dir.exists()){
    
        dir.mkdir();
    }
    
    /*   =============== contest set : submissions ==================*/
    Config c = new Config();
    Connection con = c.getcon();
    Statement stmt = con.createStatement();
        try{
        
            
            String query="CREATE TABLE " + contestcode+"submissions" + "(codefilename varchar(255), username varchar(255), langdB varchar(255), ext varchar(255), path varchar(255), status varchar(255), timelimit double, access varchar(255), submittime datetime, rid int, pid int, contestid varchar(255),memory int, problemid varchar(255)  ,PRIMARY KEY(codefilename))";
           
            stmt.executeUpdate(query);
            
   //         response.sendRedirect("previewtutorial.jsp?id="+id);
        }
        catch(Exception e){}
       finally {
        con.close();    
        
        }
        
    
        SessionFactory factory = new ConnectionProvider().getSessionFactory();
        Session hiberSession = factory.openSession();
        Transaction t = hiberSession.beginTransaction(); 
        ContestInfo check=null;
        
        Timestamp st = Timestamp.valueOf("2014-12-30 12:00:01");
        Timestamp et = Timestamp.valueOf("2014-12-30 12:00:01");
        
        ContestInfo setter = new ContestInfo(contestcode,"contestname", st, et, "poster","5","description");
        try
        {
            check=(ContestInfo)hiberSession.get(setter.getClass(), contestcode);

            if(check==null){
            hiberSession.saveOrUpdate(setter);
            t.commit();
            
            }
        }
        catch(Exception ex){}
        finally{
              hiberSession.close();
              factory.close();
        
        }       
        response.sendRedirect("contestSetInfo.jsp");
%>