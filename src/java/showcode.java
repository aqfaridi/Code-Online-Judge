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
import org.json.simple.JSONObject;
import org.apache.commons.io.FileUtils;
import java.io.File;
import connection.Config;
import java.sql.*;
import javax.servlet.http.HttpSession;
/**
 *
 * @author faridi
 */
public class showcode extends HttpServlet {

    HttpSession session = null;
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
        try {
            /* TODO output your page here. You may use following sample code. */           
            String username = (String)session.getAttribute("username");
            String id = (String)request.getParameter("id");
            String codepath = connection.Path.getArgPath("env",id)+id+"."+(String)request.getParameter("e");
            String contestid = (String)request.getParameter("c");
            
            Config c = new Config();
            Connection con = c.getcon();
            Statement st = con.createStatement();
            String qry = "select * from "+contestid+"submissions where codefilename='"+id+"'";
            //System.out.print(qry);
            
            ResultSet rs = st.executeQuery(qry);
  
            if(rs.next())
            {
                if(rs.getString("access").equals("public") || rs.getString("username").equals(username))
                {
                    String content = "";    
                    File file = new File(codepath);
                    content = FileUtils.readFileToString(file);
                                    // do something
                    JSONObject json = new JSONObject();
                    json.put("out",content);
                    json.put("chk", "1");
                    //json.put("rs",qry);
                    out.print(json);
                }
                else
                {
                    JSONObject json = new JSONObject();
                    json.put("chk","0");
                    out.print(json);   
                }
             }

        }
        catch(Exception e){out.print(e.getMessage());}
        finally {
            out.close();
        }
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
