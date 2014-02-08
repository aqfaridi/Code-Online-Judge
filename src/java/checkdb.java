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
import java.sql.*;
import connection.Config;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;

/**
 *
 * @author faridi
 */
public class checkdb extends HttpServlet {
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
     if(username == null)
               {
                    response.sendRedirect("login.jsp");
                }
    else{        
        try {
            String problemcode = (String)request.getParameter("q");
            String contestcode = (String)request.getParameter("c");
            String codefilename = (String)request.getParameter("code");
  
   /* =========================== user not registered : redirect to index page ====================*/
   
            Config c = new Config();
            Connection con = c.getcon();
            Statement stmt7 = con.createStatement();
            Statement stmt = con.createStatement();
            Statement stmt2 = con.createStatement();
            Statement stmt3 = con.createStatement();
            Statement stmt4 = con.createStatement();
            Statement stmt5 = con.createStatement();
            Statement stmt6 = con.createStatement();
            Statement stmt8 = con.createStatement();
              

       
   
        
                String qry = "Select * from ContestInfo where contestcode='"+contestcode+"'";
                ResultSet rs2 = stmt2.executeQuery(qry);
                long contest_st = 0,contest_et=0;
                java.util.Date d1 = new java.util.Date();
                long current = d1.getTime();
                
             
                
                int nop = 0;
                if(rs2.next())
                {
                    nop = Integer.parseInt(rs2.getString("nop"));
                     Timestamp date = rs2.getTimestamp("starttime");
                     Timestamp enddate = rs2.getTimestamp("endtime"); 
                     contest_et = enddate.getTime();
                     contest_st = date.getTime();
                }
                
                //if contest ended then redirect - no further submission
                if(contest_et < current)
                {
                    con.close();
                    response.sendRedirect("contestshow.jsp?c="+contestcode);
                }
                
                long tc = current - contest_st;

               
            int chk = 0;   
            JSONObject json = new JSONObject();
            String query="Select count(*) as ch , status ,timelimit from " + contestcode+"submissions where username='"+username + "' and codefilename='"+codefilename+"'";
            //out.println(query);
            String problemid = (String)request.getParameter("q");
            int l = contestcode.length();
            String pid = problemid.substring(l);
            //out.println(query);
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
            chk = Integer.parseInt(rs.getString("ch"));
            if(chk == 0)
                {
                    json.put("check", "0");
                    out.print(json);
                    out.flush();
                }
             else
                {
                    String status = rs.getString("status");
                    String exec_time = rs.getString("timelimit");
                    
                    json.put("check", "1");
                    json.put("status",status);
                    json.put("exec_time",exec_time);
                    out.print(json);
                    out.flush();    
                    
                    
                    if(contestcode.equals("PRACTICE") || contestcode.equals("BEGINNER"))
                    {
                        if(status.compareTo("Accepted")==0)
                        {
                            String sq = "Select count(*) as col from "+contestcode+"submissions where problemid='"+problemid+"' and username='"+username+"' and status='Accepted'";
                            //out.println(sq);
                            ResultSet rs6 = stmt6.executeQuery(sq);
                            int chk6 = 0;
                            if(rs6.next())
                                chk6 = Integer.parseInt(rs6.getString("col"));
                            //out.println(chk6);

                            if(chk6 == 1)
                            {    
                                query = "UPDATE "+contestcode+"ranking SET score=score+1 where userid='"+username+"'"; 
                                //out.println(query);
                                stmt2.executeUpdate(query);
                                query = "UPDATE "+contestcode+"ranking SET time="+tc+" where userid='"+username+"'"; 
                                stmt2.executeUpdate(query);
                            }
                        }   
                    
                    }
                    else
                    {
                    

                        if(status.compareTo("Accepted")==0)
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
                        int ch=1;
                        if(rs5.next())
                        {
                            //out.println(rs5.getString("Apenalty"));

                            for(int i=0;i<nop;i++,ch++)
                            {
                                //out.println(ch);
                                total_penalty += Integer.parseInt(rs5.getString("P"+ch+"penalty"));
                                total_score += Double.parseDouble(rs5.getString("P"+ch+"score"));
                                total_time += Long.parseLong(rs5.getString("P"+ch+"time"));
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
                
                }
            }           

    
        }
        catch(Exception e){out.print(e.getMessage());}
        finally {
            out.close();
        }
    
    } // else sendredirect
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
