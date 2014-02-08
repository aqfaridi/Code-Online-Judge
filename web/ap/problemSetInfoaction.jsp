<%-- 
    Document   : problesetteraction
    Created on : Jun 5, 2014, 11:34:12 PM
    Author     : Pankaj Chaudhary
--%>
<%@page errorPage="error.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="pojo.Problems"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.io.*"%>
<%@page import="connection.Path"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>  
<%  
    //MultipartRequest mm = new MultipartRequest(request ,"c:\\Users\\kg\\Documents");  
    
    String path=Path.getArgPath("contests",(String)session.getAttribute("contestcode"),(String)session.getAttribute("problemcode"));
        
    
    File dir = new File(path);
    if(!dir.exists()){
    
        dir.mkdir();
    }
    
    MultipartRequest m = new MultipartRequest(request,path,3000000);  
        String contestcode=m.getParameter("contestcode");
        String problemcode=m.getParameter("problemcode");
        String problemname=m.getParameter("problemname");
        String timelimit=m.getParameter("timelimit");
        String problemsetter=m.getParameter("problemsetter");
        String problemtester=m.getParameter("problemtester");
        Integer testfiles= Integer.parseInt(m.getParameter("testfiles"));
        String problemdescription=m.getParameter("problemdescription");
        String difficulty=m.getParameter("difficulty");
        float diff = Float.parseFloat(difficulty);
        BufferedWriter desWrite = new BufferedWriter(new FileWriter(new File(path+"description.txt")));
        desWrite.write(problemdescription); desWrite.flush();
        desWrite.flush();
        desWrite.close();
        String inputfile="",outputfile="";
        
         File file=null;
         File file2=null;
       for(int i=1;i<=testfiles;i++)
       {
            inputfile = (String)m.getFilesystemName("input"+i);
             //rename file process
             file = new File(path+"/"+inputfile);
            // File (or directory) with new name
          
            file2 = new File(path+"/"+"input"+i+".txt");
            // Rename file (or directory)
            boolean success = file.renameTo(file2);
       }
        
         File outfile=null;
         File outfile2=null; 
       for(int i=1;i<=testfiles;i++)
       {
            outputfile = (String)m.getFilesystemName("output"+i);
            
            //rename file process
             outfile = new File(path+"/"+outputfile);
            // File (or directory) with new name
          
           outfile2 = new File(path+"/"+"output"+i+".txt");
            // Rename file (or directory)
          boolean success1 = outfile.renameTo(outfile2);
       }
     try{
         /*
         File file=null; 
         File file2=null;  
       for(int i=1;i<=testfiles;i++)
       {
            //rename file process
             file = new File(path+"/"+inputfile+i);
            // File (or directory) with new name
          
            file2 = new File(path+"/"+"input"+i+".txt");
            // Rename file (or directory)
            boolean success = file.renameTo(file2);
       }
         File outfile=null;
         File outfile2=null; 
       for(int i=1;i<=testfiles;i++)
       {
            //rename file process
             outfile = new File(path+"/"+outputfile);
            // File (or directory) with new name
          
           outfile2 = new File(path+"/"+"out"+i+".txt");
            // Rename file (or directory)
          boolean success1 = outfile.renameTo(outfile2);
       }   
        */
        }
        catch(Exception e){
            out.print(e.getMessage());
            out.flush();
        }
     
        problemdescription=problemcode+"DesFile";
        SessionFactory factory = new ConnectionProvider().getSessionFactory();
        Session hiberSession = factory.openSession();
        
    try
    {
        Transaction t = hiberSession.beginTransaction();
        Problems setter = new Problems(contestcode, problemcode, problemname, timelimit, problemsetter, problemtester,testfiles , problemdescription,0,0,diff);
        hiberSession.saveOrUpdate(setter);
        out.print("successfully uploaded\n");  
        t.commit();
        response.sendRedirect("problemSet.jsp");
    }
    catch(Exception e){}
    finally{
        hiberSession.close();
        factory.close();
    }
    
%>
