/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.Ranking;
import pojo.Submissions;
import java.util.Date;
import pojo.Problems;
import pojo.Q;
import pojo.Id;
import java.util.List;
import org.hibernate.Query;
import java.util.HashMap;
import java.util.Map;
import java.sql.*;
import com.oreilly.servlet.MultipartRequest;
import dao.ConnectionProvider;
import pojo.ContestInfo;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;
import java.io.*;
import connection.Config;
import connection.Path;
import javax.servlet.http.Part;
import javax.servlet.http.HttpSession;

/**
 *
 * @author faridi
 */
public class submitaction extends HttpServlet {
    HttpSession session=null;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String username =(String) session.getAttribute("username");
        String dpimage =(String) session.getAttribute("dpimage");

        if(username == null)
            response.sendRedirect("login.jsp");
else
{
        
        
        String problemcode = (String)request.getParameter("q");
        String contestcode = (String)request.getParameter("c");
        String contestpath = Path.getArgPath("contests",contestcode);
        String userpath = Path.getArgPath("users",username);

 
   /* =========================== user not registered : redirect to index page ====================*/
   Connection con = null;
   Config c = new Config();
   int check = 0;
   Timestamp sdate=null,edate=null,ts=null;
   try{ 
       
        con  = c.getcon();
        Statement stmt7 = con.createStatement();
        Statement stmt8 = con.createStatement();
   
            String sq = "Select count(*) as col from "+contestcode+"ranking where userid='"+username+"'";
            String sq2 = "Select * from ContestInfo where contestcode='"+contestcode+"'";
            ResultSet rs8 = stmt8.executeQuery(sq2);
            if(rs8.next()){
                sdate = rs8.getTimestamp("starttime");
                edate = rs8.getTimestamp("endtime");
            }
            java.util.Date date= new java.util.Date();
            ts = new Timestamp(date.getTime()); 
            
            //out.println(sq);
            ResultSet rs7 = stmt7.executeQuery(sq);
            if(rs7.next())
                check = Integer.parseInt(rs7.getString("col"));

    }catch(Exception e){}
   
    if(!(ts.compareTo(sdate)>0 && ts.compareTo(edate)<0))
        response.sendRedirect("contestshow.jsp?c=PRACTICE");
    else if(check == 0)
        response.sendRedirect("index.jsp?register=True");
    else
    {       
  /* ========================== get browsefile or editorfile  ==================== */
    
     Part filePart = null;
     String browsefile = null,ext = null,editorfile=null,language=null;
     int l = 0;
    try{
            MultipartRequest m = new MultipartRequest(request,userpath);  
            filePart = request.getPart("test2");
            browsefile = (String)m.getFilesystemName("test2");

            editorfile = (String)m.getParameter("test1");

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
            l = editorfile.length();
      }catch(Exception e){out.print("hi");out.flush(); } 
   

        if(l == 0 && browsefile==null)
        {
                //no file selected 
                response.sendRedirect("submit.jsp?q="+problemcode+"&c="+contestcode);        
        }
else
  {

       BufferedReader br = null;
       BufferedWriter bout = null;



       SessionFactory factory = new ConnectionProvider().getSessionFactory();
       Session s = factory.openSession();
       String id = "",st="";
       Query q = null;
       Object[] ob = null;
       Transaction t=null;
/* ==================== unique name : get from id table ============= */ 
   
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

   /* ================== rename filenames and create folder and copy files in env =========== */ 
   //out.print(browsefile);out.flush();
   String browsefilepath = userpath + browsefile;
   String problempath = Path.getArgPath("contests",contestcode,problemcode);  // for stdin.txt

   String codefilename = "Main"+id;

   //       rename procedure
    File file = new File(browsefilepath);
      // File (or directory) with new name
    File file2 = new File(userpath+codefilename+"."+ext);
    // Rename file (or directory)
    boolean success = file.renameTo(file2);
 
  
    //creating new folder for each sumission in env dir.
   
   String envPath = Path.getArgPath("env",codefilename);
   File dir = new File(envPath);
   if(!dir.exists()){
        dir.mkdir();
    }
  
   
   // copy file to env folder inside mkdir folder
    String userfilepath = userpath+codefilename+"."+ext;
    envPath = envPath + ("Main"+id+"."+ext);
    
  
  try{ 
   
      
        if(editorfile.length()!=0){
              //out.print("this running");
              bout =  new BufferedWriter(new FileWriter(userfilepath),10000);   
              bout.write(editorfile);
              bout.close();

              bout =  new BufferedWriter(new FileWriter(envPath),10000);   
              bout.write(editorfile);
              bout.close();

        }
        else{
            br = new BufferedReader(new FileReader(userfilepath));
            bout =  new BufferedWriter(new FileWriter(envPath),10000);
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
  
  
  
  
  /* ======================= Running judge now  | ranking update  | status update ============ */ 
  
  
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


            //out.println(language);
            Q queue = new Q(codefilename, username, language, ext, problempath , "unjudge",Double.parseDouble(now.getTimelimit()) ,"null", tmp, 0, 0,contestcode , 0 ,problemcode,now.getTestfiles());
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
 try{
         
       //judge the solution         
       //out.print("judge process starts "); out.flush();
       final String[] cmd = {
            "/bin/bash",
            "-c",
            "cd "+Path.getPath()+" ; python judge.py"   };
       Runtime.getRuntime().exec(cmd);
       //p.waitFor();
       
        // inner class to run process without wait  outside main thread
     /*  new Thread(new Runnable() {
            public void run() {
              try
              {
                  Runtime.getRuntime().exec(cmd);
                  //p.waitFor();
              }catch(Exception e){}
        }
      }).start(); 
    
     */
     String problemid = (String)request.getParameter("q");
     response.sendRedirect("status.jsp?q="+problemid+"&c="+contestcode+"&code="+codefilename);
    /* int chk = 0;   
     while(chk == 0)
     {
            Thread.sleep(1);   
            String query="Select count(*) as ch , status from " + contestcode+"submissions where username='"+username + "' and codefilename='"+codefilename+"'";
            //out.println(query);
           
            String pid = ""+problemid.charAt(problemid.length()-1);
            //out.println(query);
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                chk = Integer.parseInt(rs.getString("ch"));
                if(chk == 0)
                 continue;
                
                out.print("<style>#loading{visibility: hidden;</style>");              
                out.println(rs.getString("status"));
                
                if(rs.getString("status").compareTo("Accepted")==0)
                {
                    String sq = "Select * from "+contestcode+"ranking where userid='"+username+"'";
                    //out.println(sq);
                    ResultSet rs6 = stmt6.executeQuery(sq);
                    if(rs6.next())
                    {
                        //out.println("hhhdsffsdkbhn");
                        if(rs6.getString(pid+"score").compareTo("0") == 0)
                        {
                            query = "UPDATE "+contestcode+"ranking SET "+pid+"score=100.0, "+pid+"time="+tc+" where userid='"+username+"'"; 
                            //out.println(query);
                            stmt2.executeUpdate(query);
                        }
                    }
                }
                else{
                    String sql = "Select * from "+contestcode+"ranking where userid='"+username+"'";
                    //out.println(sql);
                    ResultSet rs3 = stmt2.executeQuery(sql);
                    if(rs3.next())
                    {
                        //out.println("hhhdsffsdkbhn");
                        if(rs3.getString(pid+"score").compareTo("0") == 0)
                        {
                            int penalty = Integer.parseInt(rs3.getString(pid+"penalty"));
                            penalty += 1;
                            query = "UPDATE "+contestcode+"ranking SET "+pid+"penalty="+penalty+" where userid='"+username+"'";
                             //out.println(query);
                            stmt3.executeUpdate(query);
                        }
                    }
                        
                }
                
                String sql = "Select * from "+contestcode+"ranking where userid='"+username+"'";
                ResultSet rs5 = stmt5.executeQuery(sql);
                //out.println("hi"+nop);
                int total_penalty = 0;
                Double total_score=0.0;
                long total_time = 0;
                char ch='A';
                if(rs5.next())
                {
                    //out.println(rs5.getString("Apenalty"));

                    for(int i=0;i<nop;i++,ch++)
                    {
                        //out.println(ch);
                        total_penalty += Integer.parseInt(rs5.getString(ch+"penalty"));
                        total_score += Double.parseDouble(rs5.getString(ch+"score"));
                        total_time += Long.parseLong(rs5.getString(ch+"time"));
                        //out.println(total_penalty+" "+total_score+" "+total_time);
                    }
                    //out.println("hello");
                    total_time += total_penalty * 20000*60;
                    //Timestamp nt = new Timestamp(total_time);
                    query = "UPDATE "+contestcode+"ranking SET penalty="+total_penalty+", score="+total_score+", time="+total_time+" where userid='"+username+"'";
                    //out.println(query);
                    stmt4.executeUpdate(query);
                    out.flush();
                }
            }
     }//while
    */ 
     con.close(); 
   //  response.sendRedirect("index.jsp");
   }catch(Exception e){}
    finally {
     out.close();
     }
    
    /*

        out.print("<style>#loading{visibility: hidden;</style>");
    }
      
    */ 
  } } //inner else due to sendRedirect
} //else due to sendRedirect
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession();
        processRequest(request, response);
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
