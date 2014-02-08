<%-- 
    Document   : contestsetteraction
    Created on : Jun 7, 2014, 6:21:52 AM
    Author     : kg
--%>

<%@page import="java.sql.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="connection.Config" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="pojo.ContestInfo"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.io.*"%>
<%@page import="connection.Path"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>

<%  
    String path = Path.getArgPath("contests",(String)session.getAttribute("contestcode"));
    
    
    MultipartRequest m = new MultipartRequest(request,path);  
    Part filePart = request.getPart("photo");
    String contestCode = (String)m.getParameter("contestcode");
    String startTime = (String)m.getParameter("starttime");
    String  endTime = (String)m.getParameter("endtime");
    String nop = (String)m.getParameter("nop");
    String contestName = (String)m.getParameter("contestname");
    String poster = (String)m.getFilesystemName("poster");
    
    
    // out.print(poster); out.flush();
    String description = (String)m.getParameter("description");
    BufferedWriter desOut = new BufferedWriter(new FileWriter(path+"description.txt"));
    desOut.write(description); desOut.flush(); desOut.close();
    Timestamp st = Timestamp.valueOf(startTime);
    Timestamp et = Timestamp.valueOf(endTime);
    /* =============check for poster============== */
    
    String qry = "FROM ContestInfo CON WHERE CON.contestCode='"+session.getAttribute("contestcode")+"'";
    SessionFactory factory = new ConnectionProvider().getSessionFactory();
     Session newsession=factory.openSession();
     String oldPoster = null;
    try{
        
    
            Query q = newsession.createQuery(qry);
            List<ContestInfo> l = q.list();

            if(l.size() == 1)
            {
                oldPoster = l.get(0).getPoster();
            }

    }catch(Exception ex){}
    finally
     {
         newsession.close();
     }
    
    
    /* ==============  contest set Info ================== */
    Session hiberSession = factory.openSession();
    try{
        
   
            Transaction t = hiberSession.beginTransaction();
            if(oldPoster != null && poster == null)
                poster = oldPoster;
            
            ContestInfo newsetter = new ContestInfo(contestCode,contestName, st, et, poster,nop, description);
            hiberSession.saveOrUpdate(newsetter);
            t.commit();

    }catch(Exception e) {}
    finally{
        factory.close();
        hiberSession.close();
    }
    
    
    /* ================= create ranking table ================== */
        Config c = new Config();
        Connection con = c.getcon();
        Statement stmt = con.createStatement();
        String query="";
      try{
           if(contestCode.trim().equals("PRACTICE") || contestCode.trim().equals("BEGINNER"))
                query="CREATE TABLE " + contestCode.trim()+"ranking" + "(userid varchar(255),score int default 0,time bigint(20) default 0)";
           else{
            
                query="CREATE TABLE " + contestCode.trim()+"ranking" + "(userid varchar(255) ,rating double default 0 , score double default 0, time bigint(20) default 0, penalty int default 0,PRIMARY KEY(userid)";
                 int ch=1;
                 for(int i=1;i<=Integer.parseInt(nop);i++,ch++)
                 {

                     query+=",P"+ch+"score double default 0";
                     query+=",P"+ch+"time bigint(20) default 0";
                     query+=",P"+ch+"penalty int default 0";
                 }
                 query+=")";
           }
            //out.println(query);
            stmt.executeUpdate(query);
            
   //         response.sendRedirect("previewtutorial.jsp?id="+id);
        }
        catch(Exception e){}
        finally {
            con.close();    
        
        }
        
        response.sendRedirect("problemSet.jsp");
%>