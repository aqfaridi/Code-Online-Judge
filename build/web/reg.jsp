<%-- 
    Document   : reg
    Created on : Jul 20, 2014, 12:26:01 PM
    Author     : root
--%>

<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="connection.Config"%>
<%
        String contestcode = request.getParameter("contestcode");

        String user = (String)session.getAttribute("username");

            out.println(user);
            if(user==null)
            {
                //not logged in
                response.sendRedirect("login.jsp");
            }
            else
            {

                Double rating =  1000.0;
                Connection con=null;
                Statement st=null,st2=null;
                ResultSet rs=null,rs2=null;
                Config c = new Config();
                con = c.getcon();

            int qno=0,cnt=0,cnt2=0;
            try
            {
                st=con.createStatement();
                st2=con.createStatement();
                String qry2 = "select rating from User where username='"+user+"'";
                rs2 = st2.executeQuery(qry2);
                if(rs2.next())
                    rating = Double.parseDouble(rs2.getString("rating"));
                
                String qry = "insert into "+contestcode+"ranking (userid,rating) values('"+user+"',"+rating+")";
                st.executeUpdate(qry);
                response.sendRedirect("index.jsp");
            }

            catch(Exception e)
            {
                System.out.println("Error="+e);
            }
            finally{con.close();}

        }
%>