/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import connection.*;
/**
 *
 * @author ICT
 */
public class delete extends HttpServlet {

    HttpSession session;
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
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
        String username =  request.getParameter("user");
        String who = request.getParameter("who");
        out.println(username);
       
        
        String query="";
    
    try
        {
            Config c = new Config();
            Connection con = c.getcon();
            Statement st = con.createStatement();
            if(who.equals("student"))
            {
                query = "delete from student where studentid='"+username+"'";
                st.executeUpdate(query);
                con.close();
                response.sendRedirect("aqfaridiprofile.jsp?studentSuccess=True&student=True");
            }
            else if(who.equals("faculty"))
            {
                query = "delete from faculty where facultyid='"+username+"'";
                st.executeUpdate(query);
                con.close();
                response.sendRedirect("aqfaridiprofile.jsp?facultySuccess=True&faculty=True");
            }
            else if(who.equals("subject"))
            {
                query = "drop table "+username;
                st.executeUpdate(query);
                query = "drop table result"+username;
                st.executeUpdate(query);
                query = "delete from subjects where subjectcode='"+username+"'";
                st.executeUpdate(query);
                con.close();
                response.sendRedirect("aqfaridiprofile.jsp?subjectSuccess=True&subject=True");
            }


            con.close();
        }
        catch(Exception e){out.println("Error "+e);}

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession(true);
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
