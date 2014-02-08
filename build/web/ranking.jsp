<%-- 
    Document   : ranking.jsp
    Author     : aqfaridi
--%>

<%@page import="connection.Config"%>
<%@page import="java.sql.*"%>
<%@page import="pojo.ContestInfo"%>
<%@page import="pojo.Problems"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="pojo.Ranking"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="dao.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : index1.jsp
    Created on : Jul 20, 2014, 8:59:14 PM
    Author     : Pankaj Chaudhary
--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="images/favicon.ico">

    <title>Code Online Judge</title>


    <!-- Bootstrap core CSS -->
    <link href="js/bootstrap/dist/css/bootstrap.css" rel="stylesheet" />
	<link rel="stylesheet" href="fonts/font-awesome-4/css/font-awesome.min.css">
             <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
        <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->
	    <link rel="stylesheet" type="text/css" href="js/jquery.gritter/css/jquery.gritter.css" />

  <link rel="stylesheet" type="text/css" href="js/jquery.nanoscroller/nanoscroller.css" />
  
	<link rel="stylesheet" type="text/css" href="js/bootstrap.switch/bootstrap-switch.css" />
	<link rel="stylesheet" type="text/css" href="js/jquery.select2/select2.css" />
	<link rel="stylesheet" type="text/css" href="js/bootstrap.slider/css/slider.css" />
	<link rel="stylesheet" type="text/css" href="js/intro.js/introjs.css" />
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <link href="assets/css/bootstrap1.css" rel="stylesheet" />
</head>
<body>

  <!-- Fixed navbar -->
   <%
    String username =(String) session.getAttribute("username");
    String dpimage =(String) session.getAttribute("dpimage");
      String contestcode = (String)request.getParameter("c");
//    out.print(User);
    if(username != null)
               {%>

        <%@include file="navbar.jsp" %>
        <%@include file="leftpanelonline.jsp" %>
        <%  }
                else
                {%>
                <%@include file="navbar1.jsp"%>
                  <%@include file="leftpaneloffline.jsp" %>
                 <% }
   %>
  	
		<div class="container-fluid" id="pcont">
                    <div class="row-fluid" style="margin-top: 20px;">
                        <div class="col-sm-12">
                  
                            
    <%    
   
       
    
   SessionFactory factory = new ConnectionProvider().getSessionFactory();
   Session s = factory.openSession();
   String st = "FROM Problems S WHERE S.contestcode='"+contestcode+"'";
   Transaction t = s.beginTransaction();
   
   Query q =  s.createQuery(st);
   t.commit();
   List<Problems> setters = q.list();
   Object[] ob=setters.toArray();
   int noq = ob.length;
   int qs = noq;
   
        Config c = new Config();
        Connection con = c.getcon();
        Statement stmt = con.createStatement();
        Statement stmt2 = con.createStatement();
        int totalrows = 0;
    try{
        
            /*   =========== get total number of rows in submissions ============ */
            String sql = "Select count(*) as col from "+contestcode+"ranking";
            ResultSet rs2 = stmt2.executeQuery(sql);
            if(rs2.next())
                totalrows = Integer.parseInt(rs2.getString("col"));
        
        
            int id = Integer.parseInt(request.getParameter("id"));
            int start = id+1;
            int end = start + 19;
            String query="Select * from "+contestcode+"ranking ORDER BY score DESC , time ASC  LIMIT "+id+","+end;
            
            //out.println(query);
            ResultSet rs = stmt.executeQuery(query);
            rs.first();
            //out.print(totalrows);
            if(totalrows!=0)
            {
                int i = start;
                out.print("<table class='table table-bordered' style='font-weight:bold;'>");
  %>
        
		 
                <tr>
                    <td colspan="<%=4+noq%>" style="background-color: #F4F4F4;"><h4><center><%=contestcode %> &nbsp; &nbsp;LEADERBOARD</center></h4></td>
                </tr>
                <tr>
                    <td style = "width:20px;" align="center">Rank</td>
                    <td align="center">Username</td>
                    <td align="center">Score</td>
                    <td align="center">Total Time(HH:MM:SS)</td>
  
  <%
           if( !(contestcode.equals("BEGINNER") || contestcode.equals("PRACTICE")) ){
            for(int k=1 ; k<=noq; k++){
                out.print("<td align='center'>");
                out.print(((Problems)ob[k-1]).getProblemcode());
                out.print("</td>");
            }
                  }
            out.print("</tr>");
   
            //rs.absolute(start);
            do{
                      out.print("<tr>");
                    out.print("<td align='center'>"+i+"</td>");
                    out.print("<td  align='center'><a href='profile.jsp?uid="+rs.getString("userid")+"'>"+rs.getString("userid")+ "</a></td>");
                    long sc =  Long.parseLong(rs.getString("score")); 
                    long diff = Long.parseLong(rs.getString("time"));
                    long hh=0,mm=0,ss=0;
                    diff /= 1000;
                    hh=diff/(60*60);
                    diff=diff-hh*(3600);
                    mm=diff/60;
                    diff=diff-mm*60;
                    ss=diff;
                    String time = hh + ":" + mm + ":"+ss;
                    %>
                    <td align='center'>
                        <%=sc%></td>
                       <td align='center'><%=time%></td>

                   <% 
                   if( !(contestcode.equals("BEGINNER") || contestcode.equals("PRACTICE")) ){
                    int ch = 1;
                    for(int j = 1; j<=noq; j++,ch++){
                        diff = Long.parseLong(rs.getString("P"+ch+"time"));
                        diff /= 1000;
                         hh=diff/(60*60);
                         diff=diff-hh*(3600);
                         mm=diff/60;
                         diff=diff-mm*60;
                         ss=diff;
                         String ptime = hh+":"+mm+":"+ss;
                      %>
                        <td align='center'><p style="color:green;font-weight:bold;"><%=rs.getString("P"+ch+"score")%> </p> <%=ptime%></td>

                         <%

                    }//for
                   }
                    out.print("</tr>");
            
                i++;
            }while(rs.next() && i<=end);
            
            out.print("</table>");
      
       }

        else
            out.println("<center><p style='color:#808080;font-weight:bold;'>No Result Found</p></center>");       
        }
        catch(Exception e){out.print(e.getMessage());}
       finally {
        s.close();
        con.close();    
        factory.close();
        }  
    
      out.println("<center><ul class='pagination'>");
      out.println("<li><a href='#'>&laquo;</a></li>");

      int pages = (int)Math.ceil(totalrows/20.0);
      for(int j=0;j<pages;j++)
          out.println("<li><a href='ranking.jsp?id="+(j*20)+"&c="+contestcode+"'>"+(j+1)+"</a></li>");

      out.print("<li><a href='#'>&raquo;</a></li>");
      out.print("</ul></center>");
  %>                            
                                                        
                        </div>
					
		</div> 
		
	</div>

  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/jquery.gritter/js/jquery.gritter.js"></script>

  <script type="text/javascript" src="js/jquery.nanoscroller/jquery.nanoscroller.js"></script>
	<script type="text/javascript" src="js/behaviour/general.js"></script>
  <script src="js/jquery.ui/jquery-ui.html" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.sparkline/jquery.sparkline.min.html"></script>
	<script type="text/javascript" src="js/jquery.nestable/jquery.nestable.js"></script>
	<script type="text/javascript" src="js/bootstrap.switch/bootstrap-switch.min.js"></script>
  <script src="js/jquery.select2/select2.min.js" type="text/javascript"></script>
  <script src="js/skycons/skycons.js" type="text/javascript"></script>
    <script src="js/intro.js/intro.js" type="text/javascript"></script>
  


  <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript">
      $(document).ready(function(){
        //initialize the javascript
        App.init();
        App.dashBoard();        
        
          introJs().setOption('showBullets', false).start();

      });
    </script>
    <script src="js/behaviour/voice-commands.js"></script>
  <script src="js/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.flot/jquery.flot.js"></script>
<script type="text/javascript" src="js/jquery.flot/jquery.flot.resize.js"></script>
	<script type="text/javascript" src="js/jquery.flot/jquery.flot.labels.js"></script>
  </body>

</html>

