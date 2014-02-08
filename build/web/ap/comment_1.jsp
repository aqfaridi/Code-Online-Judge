<%-- 
    Document   : comment
    Created on : Jul 24, 2014, 11:12:04 AM
    Author     : Pankaj Chaudhary
--%>

<%@page import="pojo.Comment"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.nio.file.FileSystems"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.hibernate.Query"%>
<%@page import="javax.xml.soap.Text"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.io.*"%>
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
    <link rel="shortcut icon" href="images/favicon.png">

    <title>Code Online Judge</title>


    <!-- Bootstrap core CSS -->
    <link href="../js/bootstrap/dist/css/bootstrap.css" rel="stylesheet" />
	<link rel="stylesheet" href="../fonts/font-awesome-4/css/font-awesome.min.css">
             <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
        <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="../font-awesome/css/font-awesome.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->
	    <link rel="stylesheet" type="text/css" href="../js/jquery.gritter/css/jquery.gritter.css" />

  <link rel="stylesheet" type="text/css" href="../js/jquery.nanoscroller/nanoscroller.css" />
  
	<link rel="stylesheet" type="text/css" href="../js/bootstrap.switch/bootstrap-switch.css" />
	<link rel="stylesheet" type="text/css" href="../js/jquery.select2/select2.css" />
	<link rel="stylesheet" type="text/css" href="../js/bootstrap.slider/css/slider.css" />
	<link rel="stylesheet" type="text/css" href="../js/intro.js/introjs.css" />
  <!-- Custom styles for this template -->
  <link href="../css/style.css" rel="stylesheet" />
  <link href="../assets/css/bootstrap1.css" rel="stylesheet" />
</head>
<body>

  <!-- Fixed navbar -->
   <%
    String uname =(String) session.getAttribute("adminuser");
    String dpimage =(String) session.getAttribute("dpimage");
//    out.print(User);


          // String uname = (String)session.getAttribute("adminuser");
    if(uname != null)
               {%>

        <%@include file="navbar.jsp" %>
        <%@include file="leftpanel.jsp" %>
        <%  }
                else
                {
                response.sendRedirect("adminpanel.jsp");
                  }
   %>
  	
<div class="container-fluid" id="pcont">

    <div class="row" style="margin-top: 20px;">
        <div class="col-sm-1">
            &nbsp;
        </div>
      <div class="col-sm-10 col-md-10">
          <center>Show All comments !! </center>
         <%! public SessionFactory factory = null;%>
                  <% 
                       factory = new ConnectionProvider().getSessionFactory();
                       Session s = factory.openSession();
                       session.setAttribute("factory", factory);
                       String st = "FROM Comment";
                       try
                       {
                           Query q =  s.createQuery(st);
                           List<Comment> comments = q.list();
                           Object[] ob=comments.toArray();
            
                  %>  
               <table id="sortTableExample" class='table'>
           <thead style="background-color: #F4F4F4; height: 40px; border: 2px; border-color: F4F4F4;">
            <tr>
          
                <th class="header">#</th>
                <th class="sheader">UserName</th>
                <th class="red header">status</th>
                <th class="blue header">Contest Code</th>
                <th class="green header">Problem Code</th>
                <th class="green header headerSortUp">Comment</th>
                <th class="green header"> Delete</th>
           </tr>
            </thead>
           <tbody>
            <% 
         for(int i=1; i<= ob.length ;i++)
         {  
            Comment tmp = (Comment)ob[i-1];
            out.print("<tr><td><center>"+tmp.getId()+"</center></td><td><center><a href='../profile.jsp?uid="+tmp.getUsername()+"' target= _blank>"+tmp.getUsername()+"</a></center></td><td><center>"+tmp.getValid()+" </center></td><td><center>"+tmp.getContestcode()+"</center> </td><td><center>"+tmp.getProblemcode()+" </center></td><td><center>"+tmp.getCommentProblem()+"</center></td><td><center><button class='btn btn-danger'>"+ tmp.getId() +"</button></center></td></tr>");
            
        }
     }
        catch(Exception e){}
      finally{
      s.clear();
      s.close();
      factory.close();
           }
            %>
           </tbody>
        </table>
          
          
        </div>				
      </div>
    </div>
</div>

  <script type="text/javascript" src="../js/jquery.js"></script>
  <script type="text/javascript" src="../js/jquery.gritter/js/jquery.gritter.js"></script>

  <script type="text/javascript" src="../js/jquery.nanoscroller/jquery.nanoscroller.js"></script>
	<script type="text/javascript" src="../js/behaviour/general.js"></script>
  <script src="../js/jquery.ui/jquery-ui.html" type="text/javascript"></script>
	<script type="text/javascript" src="../js/jquery.sparkline/jquery.sparkline.min.html"></script>
	<script type="text/javascript" src="../js/jquery.nestable/jquery.nestable.js"></script>
	<script type="text/javascript" src="../js/bootstrap.switch/bootstrap-switch.min.js"></script>
  <script src="../js/jquery.select2/select2.min.js" type="text/javascript"></script>
  <script src="../js/skycons/skycons.js" type="text/javascript"></script>
    <script src="../js/intro.js/intro.js" type="text/javascript"></script>
  


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
    <script src="../js/behaviour/voice-commands.js"></script>
  <script src="../js/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/jquery.flot/jquery.flot.js"></script>
<script type="text/javascript" src="../js/jquery.flot/jquery.flot.resize.js"></script>
	<script type="text/javascript" src="../js/jquery.flot/jquery.flot.labels.js"></script>
  </body>

<!-- Mirrored from foxypixel.net/cleanzone/ by HTTrack Website Copier/3.x [XR&CO'2013], Sat, 12 Jul 2014 11:03:16 GMT -->
</html>
