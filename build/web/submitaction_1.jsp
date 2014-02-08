<%-- 
    Document   : submitaction
    Created on : June 7, 2014, 6:21:52 AM
    Author     : kg
--%>


<%@page import="pojo.Ranking"%>
<%@page import="pojo.Submissions"%>
<%@page import="java.util.Date"%>
<%@page import="pojo.Problems"%>
<%@page import="pojo.Q"%>
<%@page import="pojo.Id"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="pojo.ContestInfo"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.io.*"%>
<%@page import="connection.Config" %>
<%@page import="connection.Path" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .ull {
                list-style-type: none;
                margin: 0;
                padding: 0;
            }
            .aa
            {
                color:#663300;
            }
    </style>
    </head>
    <body>
       <%
    String username =(String) session.getAttribute("username");
//    out.print(User);
    if(username != null)
               { %>

        <%@include file="header1.jsp" %>
        <%  }
                else
                {
                    response.sendRedirect("login.jsp");
                }

   String contestcode = (String)request.getParameter("c");
   String path = Path.getPath()+"contests/"+contestcode;
   String codepath = Path.getPath()+"users/"+username;
  
   
   
   
   
   
Config c = new Config();
Connection con = c.getcon();
Statement stmt7 = con.createStatement();

    try{
                    String sq = "Select count(*) as col from "+contestcode+"ranking where userid='"+username+"'";
                    out.println(sq);
                    ResultSet rs7 = stmt7.executeQuery(sq);
                    if(rs7.next())
                    {
                        int check = Integer.parseInt(rs7.getString("col"));
                        if(check == 0)
                        {                           
                          response.sendRedirect("index.jsp?register=True");
                        }
                    }  
    }catch(Exception e){}
    
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
     Part filePart2 = null;
   String filename2 = null,ext = null,file1=null,language=null;

    try{
    MultipartRequest m = new MultipartRequest(request,codepath);  
 
  
     filePart2 = request.getPart("test2");
     filename2 = (String)m.getFilesystemName("test2");
 
    file1 = (String)m.getParameter("test1");

    language = (String)m.getParameter("language");
   
    HashMap<String , String > map = new HashMap<String , String>();
    map.put("AWK", "awk");
    map.put("Bash", "sh");
    map.put("C++", "cpp");
    map.put("C", "c");
    map.put("C#", "cs");
    map.put("Java", "java");
    map.put("Haskell", "hs");
    map.put("Perl", "pl");
    map.put("Pike", "pike");
    map.put("Python2.7", "py");
    map.put("Python3", "py");
    map.put("PHP", "php");
    map.put("Pascal", "pas");
    map.put("Ruby", "rb");
    ext = (String)map.get(language);
  
         }catch(Exception e){out.print("hi");out.flush(); } 
   
   
   BufferedReader br = null;
   BufferedWriter bout = null;
  
   
   SessionFactory factory = new ConnectionProvider().getSessionFactory();
   Session s = factory.openSession();
   String id = "",st="";
   Query q = null;
   Object[] ob = null;
   Transaction t=null;
 try{  

   st = "FROM Id id";
   q =  s.createQuery(st);
   List<Id> users = q.list();
   ob=users.toArray();
   int preid = ((Id)ob[0]).getId();
   id=""+(preid+1);
   t  = s.beginTransaction();
   s.delete((Id)ob[0]);
   s.saveOrUpdate(new Id(preid+1));
   t.commit();
       }catch(Exception e){ }

   
   //out.print(filename2);out.flush();
   String path2 = codepath + "/"+filename2;
   //String qq = ;
   //out.print("==="+qq);out.flush();
   String temp = path+"/"+(String)request.getParameter("q");
   //path+=("/"+"Main"+id+"."+ext);
   String codefilename = "Main"+id;

    File file = new File(path2);
      // File (or directory) with new name
        File file2 = new File(codepath+"/"+codefilename+"."+ext);
        
    // Rename file (or directory)
    boolean success = file.renameTo(file2);
  // out.print(file1);out.flush();
   //out.print(file1.length());out.flush();
   
  
    //creating new folder for each sumission in env dir.
   
   String envPath = Path.getPath()+"env/";
   envPath+=codefilename;
   File dir = new File(envPath);
    if(!dir.exists()){
    
        dir.mkdir();
    }
  
    String path3 = codepath+"/"+codefilename+"."+ext;
  path = envPath+("/"+"Main"+id+"."+ext);
   
   
  try{ 
   
  
        if(file1.length()!=0){
              out.print("this running");
              bout =  new BufferedWriter(new FileWriter(path),10000);   
              bout.write(file1);
              bout.close();

              bout =  new BufferedWriter(new FileWriter(path3),10000);   
              bout.write(file1);
              bout.close();

        }else{
            br = new BufferedReader(new FileReader(path3));
            bout =  new BufferedWriter(new FileWriter(path),10000);
            String line = "";
            while ((line = br.readLine()) != null) {
             bout.write(line + "\n"); bout.flush();
             }
            bout.flush();
            bout.close();
            br.close();
        }
   
  }
  catch(Exception e){}
  // out.print((String)m.getParameter("language"));out.flush();
  Problems now=null;
  Date d=null;
  try{ 
   st = "FROM Problems S WHERE S.problemcode='"+(String)request.getParameter("q")+"'";
   q =  s.createQuery(st);
   List<Problems> ques = q.list();
   ob=ques.toArray();
   now = (Problems)ob[0];
   d = new Date();
  //out.print(now.toString());out.flush();
   
   }catch(Exception e){out.print("msg1="+e.getMessage());}
   
   try{
  Timestamp tmp = new Timestamp(d.getTime());
  

  out.println(language);
   Q queue = new Q(codefilename, (String)session.getAttribute("username"), language, ext, temp , "unjudge",Double.parseDouble(now.getTimelimit()) ,"null", tmp, 0, 0,(String)request.getParameter("c") , 0 ,(String)request.getParameter("q"));
   //do the judge work ;
    t=s.beginTransaction();
    s.saveOrUpdate(queue);
    t.commit();
    }catch(Exception ex){out.print("msg2="+ex.getMessage());} 
    finally
    {
        s.close();
       factory.close();       
    }
    

            // Show exit code of process
  //         out.println("Procefdsfdsfdsss exited with code = ");

            Statement stmt = con.createStatement();
            Statement stmt2 = con.createStatement();
            Statement stmt3 = con.createStatement();
            Statement stmt4 = con.createStatement();
            Statement stmt5 = con.createStatement();
            Statement stmt6 = con.createStatement();
    try{
        
                String qry = "Select * from ContestInfo where contestcode='"+contestcode+"'";
                ResultSet rs2 = stmt2.executeQuery(qry);
                long contest_st = 0,contest_et=0;
                java.util.Date d1 = new java.util.Date();
                long current = d1.getTime();
                
             
                
                int nop = 0;
                if(rs2.next())
                {
                    nop = Integer.parseInt(rs2.getString("nop"));
                     java.util.Date date = rs2.getDate("starttime");
                     java.util.Date enddate = rs2.getDate("endtime"); 
                     contest_et = enddate.getTime();
                     contest_st = date.getTime();
                }
                
                //if contest ended then redirect - no further submission
                if(contest_et < current)
                {
                    con.close();
                    response.sendRedirect("contestshow.jsp?id="+contestcode);
                }
                long tc = current - contest_st;
       
                
       //judge the solution         
       out.print("judge process starts "); out.flush();
 
        String[] cmd = {
            "/bin/bash",
            "-c",
            "cd "+Path.getPath()+" ; python judge.py"   };
        Process p = Runtime.getRuntime().exec(cmd);
        p.waitFor();
        
            
            String query="Select * from " + contestcode+"submissions where username='"+username + "' and codefilename='"+codefilename+"'";
            out.println(query);
            String problemid = (String)request.getParameter("q");
            String pid = ""+problemid.charAt(problemid.length()-1);
            //out.println(query);
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                out.println(rs.getString("status"));
                
                
                if(rs.getString("status").compareTo("Accepted")==0)
                {
                    String sq = "Select * from "+contestcode+"ranking where userid='"+username+"'";
                    out.println(sq);
                    ResultSet rs6 = stmt6.executeQuery(sq);
                    if(rs6.next())
                    {
                        out.println("hhhdsffsdkbhn");
                        if(rs6.getString(pid+"score").compareTo("0") == 0)
                        {
                            query = "UPDATE "+contestcode+"ranking SET "+pid+"score=100.0, "+pid+"time="+tc+" where userid='"+username+"'"; 
                            out.println(query);
                            stmt2.executeUpdate(query);
                        }
                    }
                }
                else{
                    String sql = "Select * from "+contestcode+"ranking where userid='"+username+"'";
                    out.println(sql);
                    ResultSet rs3 = stmt2.executeQuery(sql);
                    if(rs3.next())
                    {
                        out.println("hhhdsffsdkbhn");
                        if(rs3.getString(pid+"score").compareTo("0") == 0)
                        {
                            int penalty = Integer.parseInt(rs3.getString(pid+"penalty"));
                            penalty += 1;
                            query = "UPDATE "+contestcode+"ranking SET "+pid+"penalty="+penalty+" where userid='"+username+"'";
                             out.println(query);
                            stmt3.executeUpdate(query);
                        }
                    }
                        
                }
                
                String sql = "Select * from "+contestcode+"ranking where userid='"+username+"'";
                ResultSet rs5 = stmt5.executeQuery(sql);
                out.println("hi"+nop);
                int total_penalty = 0;
                Double total_score=0.0;
                long total_time = 0;
                char ch='A';
                if(rs5.next())
                {
                    out.println(rs5.getString("Apenalty"));

                    for(int i=0;i<nop;i++,ch++)
                    {
                        out.println(ch);
                        total_penalty += Integer.parseInt(rs5.getString(ch+"penalty"));
                        total_score += Double.parseDouble(rs5.getString(ch+"score"));
                        total_time += Long.parseLong(rs5.getString(ch+"time"));
                        out.println(total_penalty+" "+total_score+" "+total_time);
                    }
                    out.println("hello");
                    total_time += total_penalty * 20000*60;
                    //Timestamp nt = new Timestamp(total_time);
                    query = "UPDATE "+contestcode+"ranking SET penalty="+total_penalty+", score="+total_score+", time="+total_time+" where userid='"+username+"'";
                    out.println(query);
                    stmt4.executeUpdate(query);
                    out.flush();
                }
            }
        }
        catch(Exception e){}
       finally {
        con.close();    
        
        }
   
 /*
    try{
        // Updating The User Ranking Hare : 
        java.util.Date d1 = new java.util.Date();
        long current = d1.getTime();
         Ranking r = new Ranking();

         Ranking test=(Ranking)s.get(r.getClass(),(String)session.getAttribute("username"));
         if(test!=null)r=test;
         r.setUserid((String)session.getAttribute("username"));

         String qst = (String)request.getParameter("q");

         char qcode  = 'z';


         //out.print(r.toString()+"qst==="+qst);out.flush();

         if(qst.length()>0)qcode = qst.charAt(qst.length()-1);
         if(((String)request.getParameter("c")).equals("BeginersCorner")){
           qcode = 'z';
        }
         
    if(test==null){
       
       
       if(my.getStatus().equals("Accepted")){
       
       if(qcode!='z'&&qcode=='A'){r.setApanalty(0);r.setAscore(1.0);r.setAtime(current);}else if(qcode!='z'&&qcode=='B'){r.setBpanalty(0);r.setBscore(1.0);r.setBtime(current);}else if(qcode!='z'&&qcode=='C'){r.setCpanalty(0);r.setCscore(1.0);r.setCtime(current);}else if(qcode!='z'&&qcode=='D'){r.setDpanalty(0);r.setDscore(1.0);r.setDtime(current);}else if(qcode!='z'&&qcode=='E'){r.setEpanalty(0);r.setEscore(1.0);r.setEtime(current);}else if(qcode!='z'&&qcode=='F'){r.setFpanalty(0);r.setFscore(1.0);r.setFtime(current);}else if(qcode!='z'&&qcode=='G'){r.setGpanalty(0);r.setGscore(1.0);r.setGtime(current);}else if(qcode!='z'&&qcode=='H'){r.setHpanalty(0);r.setHscore(1.0);r.setHtime(current);}else if(qcode!='z'&&qcode=='I'){r.setIpanalty(0);r.setIscore(1.0);r.setItime(current);}else if(qcode!='z'&&qcode=='J'){r.setJpanalty(0);r.setJscore(1.0);r.setJtime(current);}
       r.setScore(1.0);r.setTime(current);r.setPanalty(0);
       }else{
       
        if(qcode!='z'&&qcode=='A'){r.setApanalty(1);r.setAscore(0.0);r.setAtime(0);}else if(qcode!='z'&&qcode=='B'){r.setBpanalty(1);r.setBscore(0.0);r.setBtime(0);}else if(qcode!='z'&&qcode=='C'){r.setCpanalty(1);r.setCscore(0.0);r.setCtime(0);}else if(qcode!='z'&&qcode=='D'){r.setDpanalty(1);r.setDscore(0.0);r.setDtime(0);}else if(qcode!='z'&&qcode=='E'){r.setEpanalty(1);r.setEscore(0.0);r.setEtime(0);}else if(qcode!='z'&&qcode=='F'){r.setFpanalty(1);r.setFscore(0.0);r.setFtime(0);}else if(qcode!='z'&&qcode=='G'){r.setGpanalty(1);r.setGscore(0.0);r.setGtime(0);}else if(qcode!='z'&&qcode=='H'){r.setHpanalty(1);r.setHscore(0.0);r.setHtime(0);}else if(qcode!='z'&&qcode=='I'){r.setIpanalty(1);r.setIscore(0.0);r.setItime(0);}else if(qcode!='z'&&qcode=='J'){r.setJpanalty(1);r.setJscore(1.0);r.setJtime(0);}
        //r.setPanalty(1);
             
       }
       
   }else{
   
        
       if(my.getStatus().equals("Accepted")){
       
       if(qcode!='z'&&qcode=='A'){if(r.getAscore()==0)r.setScore(r.getScore()+1); r.setAscore(1);if(r.getAtime()==0){r.setAtime(current);r.setPanalty(r.getPanalty()+r.getApanalty());r.setTime(r.getTime()+r.getAtime());}}else if(qcode!='z'&&qcode=='B'){if(r.getBscore()==0)r.setScore(r.getScore()+1); r.setBscore(1);if(r.getBtime()==0){r.setBtime(current);r.setPanalty(r.getPanalty()+r.getBpanalty());r.setTime(r.getTime()+r.getBtime());}}else if(qcode!='z'&&qcode=='C'){if(r.getCscore()==0)r.setScore(r.getScore()+1); r.setCscore(1);if(r.getCtime()==0){r.setCtime(current);r.setPanalty(r.getPanalty()+r.getCpanalty());r.setTime(r.getTime()+r.getCtime());}}else if(qcode!='z'&&qcode=='D'){if(r.getDscore()==0)r.setScore(r.getScore()+1); r.setDscore(1);if(r.getDtime()==0){r.setDtime(current);r.setPanalty(r.getPanalty()+r.getDpanalty());r.setTime(r.getTime()+r.getDtime());}}else if(qcode!='z'&&qcode=='E'){if(r.getEscore()==0)r.setScore(r.getScore()+1); r.setEscore(1);if(r.getEtime()==0){r.setEtime(current);r.setPanalty(r.getPanalty()+r.getEpanalty());r.setTime(r.getTime()+r.getEtime());}}else if(qcode!='z'&&qcode=='F'){if(r.getFscore()==0)r.setScore(r.getScore()+1); r.setFscore(1);if(r.getFtime()==0){r.setFtime(current);r.setPanalty(r.getPanalty()+r.getFpanalty());r.setTime(r.getTime()+r.getFtime());}}else if(qcode!='z'&&qcode=='G'){if(r.getGscore()==0)r.setScore(r.getScore()+1); r.setGscore(1);if(r.getGtime()==0){r.setGtime(current);r.setPanalty(r.getPanalty()+r.getGpanalty());r.setTime(r.getTime()+r.getGtime());}}else if(qcode!='z'&&qcode=='H'){if(r.getHscore()==0)r.setScore(r.getScore()+1); r.setHscore(1);if(r.getHtime()==0){r.setHtime(current);r.setPanalty(r.getPanalty()+r.getHpanalty());r.setTime(r.getTime()+r.getHtime());}}else if(qcode!='z'&&qcode=='I'){if(r.getIscore()==0)r.setScore(r.getScore()+1); r.setIscore(1);if(r.getItime()==0){r.setItime(current);r.setPanalty(r.getPanalty()+r.getIpanalty());r.setTime(r.getTime()+r.getItime());}}else if(qcode!='z'&&qcode=='J'){if(r.getJscore()==0)r.setScore(r.getScore()+1); r.setJscore(1);if(r.getJtime()==0){r.setJtime(current);r.setPanalty(r.getPanalty()+r.getJpanalty());r.setTime(r.getTime()+r.getJtime());}}
       
       }else{
       
        
          if(qcode!='z'&&qcode=='A'&&r.getAscore()==0){r.setPanalty(r.getPanalty()+1);r.setApanalty(r.getApanalty()+1); }else if(qcode!='z'&&qcode=='B'&&r.getBscore()==0){r.setPanalty(r.getPanalty()+1);r.setBpanalty(r.getBpanalty()+1); }else if(qcode!='z'&&qcode=='C'&&r.getCscore()==0){r.setPanalty(r.getPanalty()+1);r.setCpanalty(r.getCpanalty()+1); }else if(qcode!='z'&&qcode=='D'&&r.getDscore()==0){r.setPanalty(r.getPanalty()+1);r.setDpanalty(r.getDpanalty()+1); }else if(qcode!='z'&&qcode=='E'&&r.getEscore()==0){r.setPanalty(r.getPanalty()+1);r.setEpanalty(r.getEpanalty()+1); }else if(qcode!='z'&&qcode=='F'&&r.getFscore()==0){r.setPanalty(r.getPanalty()+1);r.setFpanalty(r.getFpanalty()+1); }else if(qcode!='z'&&qcode=='G'&&r.getGscore()==0){r.setPanalty(r.getPanalty()+1);r.setGpanalty(r.getGpanalty()+1); }else if(qcode!='z'&&qcode=='H'&&r.getHscore()==0){r.setPanalty(r.getPanalty()+1);r.setHpanalty(r.getHpanalty()+1); }else if(qcode!='z'&&qcode=='I'&&r.getIscore()==0){r.setPanalty(r.getPanalty()+1);r.setIpanalty(r.getIpanalty()+1); }else if(qcode!='z'&&qcode=='J'&&r.getJscore()==0){r.setPanalty(r.getPanalty()+1);r.setJpanalty(r.getJpanalty()+1); }
        
             }
   
       } 
   if(qcode<='J'&&qcode>='A'){
   t.begin();
   s.saveOrUpdate(r);
   t.commit();
   }
   }catch(Exception e){out.print(e.getLocalizedMessage());}
   out.print("Result2="+my.getStatus());
    out.flush();
 
   
   s.close();
   factory.close();
   
   */
   
   
   
   
   
 
   
   
   %>
   
 <a href = "mysubmission.jsp?q=<%out.print(""+(String)request.getParameter("q")+"&c="+(String)request.getParameter("c")); out.flush(); %>">My Submissions</a>
    </body>
</html>