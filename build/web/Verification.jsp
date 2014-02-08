<%-- 
    Document   : index1.jsp
    Created on : Jul 20, 2014, 8:59:14 PM
    Author     : Pankaj Chaudhary
--%>

<%@page import="org.hibernate.Query"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="pojo.User"%>
<%@page import="sun.misc.BASE64Encoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.security.MessageDigest" %>
<%@page import="dao.ConnectionProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.io.*"%> 

<%
  String auth =  request.getParameter("authcode");
  String email =  request.getParameter("email");   
 
  
  
    String qry = "FROM User U WHERE U.email='"+email+"'AND U.authcode='"+auth+"' ";
     SessionFactory factory = new ConnectionProvider().getSessionFactory();   //make datbase connection
     Session newsession=factory.openSession();
     Transaction t = newsession.beginTransaction();    //fire all query start here
         
        Query q = newsession.createQuery(qry);
         List<User> users = q.list();     //execute query statment
          try { 
                    if(q.list().size() == 1)
                    {
                         User u= (User)users.get(0); 
                         //table attribute 
                          u.setValid(true);
                          newsession.saveOrUpdate(u);  //action perform save and update
                          t.commit();
                          response.sendRedirect("login.jsp");
                    }
                    else
                    {
                        response.sendRedirect("index.jsp");
                    }
         }catch(Exception ex){}
          finally
          {
                  factory.close();
                  newsession.close();
          }
       
    
%>

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
//    out.print(User);
    if(username != null)
               {%>

        <%@include file="navbar.jsp" %>
        <%@include file="leftpanel.jsp" %>
        <%  }
                else
                {%>
                <%@include file="navbar1.jsp"%>
                  <%@include file="leftpanel1.jsp" %>
                 <% }
   %>
  	
		<div class="container-fluid" id="pcont">
                    <div class="row-fluid">
                        <div class="col-sm-9">
                    
		      <div class="row dash-cols">
			
                    <center style="color:green;">
        <h1>You are successfully verified. </h1>
            <h3>Now Login and update your profile and enjoy the services..</h3>
            <br/>
            <h4 style="color:blue;"><a href="index.jsp"><i class="icon-home"></i> Home </a></h4>
                    </center>
                      </div>
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

<!-- Mirrored from foxypixel.net/cleanzone/ by HTTrack Website Copier/3.x [XR&CO'2013], Sat, 12 Jul 2014 11:03:16 GMT -->
</html>
