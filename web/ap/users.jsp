<%-- 
    Document   : users
    Created on : Jul 24, 2014, 11:48:53 AM
    Author     : Pankaj Chaudhary
--%>


<%@page import="pojo.User"%>
<%@page import="java.sql.Timestamp"%>

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

    <div class="row">
      <div class="col-sm-12 col-md-12">
             
         <%! public SessionFactory factory = null;%>
                  <% 
                       factory = new ConnectionProvider().getSessionFactory();
                       Session s = factory.openSession();
                       session.setAttribute("factory", factory);
                       String st = "FROM User";
                       try{
                           

                        Query q =  s.createQuery(st);
                        List<User> users = q.list();
                        Object[] ob=users.toArray();
                

                       //s.clear();
                       //s.close();

                  %>  
               <table id="sortTableExample" class='table'>
           <thead style="background-color: #F4F4F4; height: 40px; border: 2px; border-color: F4F4F4;">
            <tr>
                <th class="header">#</th>
                <th class="sheader">User id</th>
                <th class="red header">User Name</th>
                <th class="blue header">Phone No.</th>
                <th class="green header">Email</th>
                <th class="green header headerSortUp">Institute Name</th>
                <th class="red header headerSortUp">Delete</th>
                </tr>
            </thead>
           <tbody>
            <% 
         for(int i=1; i<= ob.length ;i++)
         {  
            User tmp = (User)ob[i-1];
            out.print("<tr><td>"+i+"</td><td><a href='../profile.jsp?uid="+tmp.getUsername()+"' target= _blank>"+tmp.getUsername()+"</a></td><td>"+tmp.getFullname()+" </td><td>"+tmp.getPhoneno()+" </td><td>"+tmp.getEmailid()+" </td><td>"+tmp.getInstitute()+"</td><td><a class='btn btn-danger' href = 'deleteaction.jsp?id="+tmp.getUsername()+"'>delete</a></td></tr>");
            
        }
     }
        catch(Exception e){}
        finally
          {
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

