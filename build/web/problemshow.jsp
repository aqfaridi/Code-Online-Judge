 <%-- 
    Document   : problem
    Created on : Jul 21, 2014, 2:32:01 AM
    Author     : Pankaj Chaudhary
--%>
<%@ page errorPage="error.jsp" %>
<%@page import="pojo.Problems"%>
<%@page import="java.sql.*"%>
<%@page import="pojo.Comment"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.User"%>
<%@page import="org.hibernate.Query"%>
<%@page import="javax.xml.soap.Text"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="pojo.ContestInfo"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.io.*"%>
<%@page import="connection.Path"%>


<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from foxypixel.net/cleanzone/pages-blank.html by HTTrack Website Copier/3.x [XR&CO'2013], Sat, 12 Jul 2014 11:03:47 GMT -->
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
   


      <% String q = (String)request.getParameter("q");
      String c = (String)request.getParameter("c");
      String st = "FROM Problems S WHERE S.problemcode='"+q+"'";
      String st2 = "FROM ContestInfo S WHERE S.contestCode='"+c+"'";
      SessionFactory factory = new ConnectionProvider().getSessionFactory();
      Session s = factory.openSession();
      Session ss = factory.openSession();
List<ContestInfo> users = null;
List<ContestInfo> contest = null;
try{  
   Query qr =  s.createQuery(st);
   Query qr2 = ss.createQuery(st2);
                contest = qr2.list();

   users = qr.list();
}
catch(Exception e){}
finally{
    s.close();
    ss.close();
}
    Object[] ob2=contest.toArray();
    ContestInfo now2 = (ContestInfo)ob2[0];
    
            Timestamp sdate = now2.getStartTime();
            Timestamp edate = now2.getEndTime();
            java.util.Date date= new java.util.Date();
            Timestamp ts = new Timestamp(date.getTime()); 
    
  if(ts.compareTo(sdate)>0){  
   Object[] ob=users.toArray();
   Problems now = (Problems)ob[0];
   
   
   %>
<div class="container-fluid" id="pcont">
             
        <div class="row" style="margin-top: 20px;">
            <div class="col-sm-1">&nbsp;&nbsp;</div>
            <div class="col-sm-8">            

                <span style="font-size: 23px"><% out.print(now.getProblemname()); out.flush(); %>
                </span>
         <a class="btn btn-primary pull-right "  href="submit.jsp<% out.print("?q="+(String)request.getParameter("q")+"&c="+(String)request.getParameter("c")); out.flush(); %>" target="_blank">SUBMIT</a>

    <a class="btn btn-primary pull-right" href="allsubmission.jsp<% out.print("?q="+(String)request.getParameter("q")+"&c="+(String)request.getParameter("c")); out.flush(); %>&id=0" target="_blank" >ALL SUBMISSIONS</a>
<% if(username!=null) { %>
 <a class="btn btn-primary pull-right" href="mysubmission.jsp<% out.print("?q="+(String)request.getParameter("q")+"&c="+(String)request.getParameter("c")); out.flush(); %>&id=0" target="_blank" >MY SUBMISSIONS</a>
    <%} %>
        


<%  BufferedReader br=null;
       try{ 
         //String path = "/home/letmestart/Desktop/onlinejudge/web/contests/";
          String path=connection.Path.getArgPath("contests", c, q,"description.txt");
         br = new BufferedReader(new FileReader(path));
}catch(Exception e){ out.print(e.getMessage()); }
for(;;){
   String str=null;
   try {
     str =  br.readLine();

   }catch(Exception e){break;} 
   if(str==null)break;
   out.print("<p style='text-align: justify; font-size: 20;' >" +str);

}
br.close();
// session.setAttribute("q", (String)request.getParameter("q") ); 
//   session.setAttribute("c", (String)request.getParameter("c") ); 
  %>
        </p>
          <a class="btn btn-primary " href="submit.jsp<% out.print("?q="+(String)request.getParameter("q")+"&c="+(String)request.getParameter("c")); out.flush(); %>" target="_blank">SUBMIT</a>

  <hr size="3" style="background-color:#333;"> </hr>
  <table class="table table-responsive table-bordered" id="datatable">
      <tr class="gradeA">
          <td><h5>Author: </h5></td>
          <%
          out.print("<td><a href='profile.jsp?uid="+now.getProblemsetter()+"'>"+now.getProblemsetter()+"</a> </td></tr>");
           %>
      <tr>
          <td><h5>Tester:</h5></td>

      <%
          out.print("<td><a href='profile.jsp?uid="+now.getProblemtester()+"'>"+now.getProblemtester()+"</a> </td></tr>");
           %>

      <tr class="gradeA">
        <td><h5>Time Limit:</h5></td>
        <td><% out.print(now.getTimelimit()); out.flush(); %> sec</td>
    </tr>
    <tr class="gradeA">
        <td><h5>Source Limit:</h5></td> 
        <td>50000 Bytes</td>
    </tr>
    <tr class="gradeA">
        <td><h5>Languages:</h5></td>
        <td> 	BASH, BF, C, C99 strict, CPP 4.3.2, CPP 4.8.1, CPP11, CS2, HASK, JAVA, JS, PAS fpc, PAS gpc, PERL, PERL6,<br/> PHP, PIKE, PRLG, PYTH, PYTH 3.1.2, RUBY</td>
    </tr>
  </table>   


     <!-- =======================comment on questions ======================== -->

       <%
  }
  else
      response.sendRedirect("error.jsp");
       
    if(username!=null)
           {
            %>
       <h2 style="color:#3399CC;">Leave a Comment</h2>
       <h4>Your name: </h4>
       <h5> <%=username%></h5><br/>
       <form action="problemcomment.jsp?q=<% out.println(""+(String)request.getParameter("q"));%>&c=<% out.println(""+(String)request.getParameter("c"));%>" method="post">
           <textarea rows="4"  name="comment" class="col-sm-12" onkeyup="this.rows = (this.value.split('\n').length||1);" autocomplete="off" role="textbox" placeholder="Write your comment here ... " title="sourcecodes" name="codes" required></textarea>
          
           <button type="submit" style="margin-top: 10px;" class="btn btn-success">Post Comment</button>
       </form>
           <%}
     else
      {%>
             <h3 style="color:#3399CC;">For Leave a Comment Please <a href="login.jsp">Login</a></h3>
 <%   }%>
 <br/>

     <%
           String qq = (String)request.getParameter("q");
          String cc = (String)request.getParameter("c");
          String cmnt = "FROM Comment C WHERE C.problemcode='"+qq+"' AND C.contestcode='"+cc+"' ORDER BY id DESC";
          Session sss = factory.openSession();
          List<Comment> comments = null;
          Object[] obc = null;
      try{
          Query comnt =  sss.createQuery(cmnt);
          comments = comnt.list();
          obc =comments.toArray();
      }

  catch(Exception e){}
      finally{
          factory.close();
          sss.clear();
          sss.close();
          
      }
       

%>
       <p>
           <%
            for(int i=1; i<= obc.length ;i++)
     {       Comment nowc = (Comment)obc[i-1];
                 int valid = nowc.getValid();
            //out.println(valid);
                if(valid == 1)
                        {
                    %>

             <b><a href="#"><%out.println(nowc.getUsername()); out.flush();%></a></b>
             <b style="color:#808080;"><%out.println(nowc.getSubmittime()); out.flush();%></b>

            <pre><%out.println(nowc.getCommentProblem()); out.flush();%></pre>
       </p>
       <br/>       
        <%} 

      }
        %>







    </div>




    </div> 
</div>	
</div>

    <script src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.nanoscroller/jquery.nanoscroller.js"></script>
    <script type="text/javascript" src="js/jquery.sparkline/jquery.sparkline.min.html"></script>
    <script type="text/javascript" src="js/jquery.easypiechart/jquery.easy-pie-chart.js"></script>
<script src="js/jquery.ui/jquery-ui.html" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery.nestable/jquery.nestable.js"></script>
    <script type="text/javascript" src="js/bootstrap.switch/bootstrap-switch.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
    <script src="js/jquery.select2/select2.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.slider/js/bootstrap-slider.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery.gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="js/behaviour/general.js"></script>

<script type="text/javascript">
  $(document).ready(function(){
    //initialize the javascript
    App.init();
  });
</script>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/behaviour/voice-commands.js"></script>
<script src="js/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.flot/jquery.flot.js"></script>
<script type="text/javascript" src="js/jquery.flot/jquery.flot.pie.js"></script>
<script type="text/javascript" src="js/jquery.flot/jquery.flot.resize.js"></script>
<script type="text/javascript" src="js/jquery.flot/jquery.flot.labels.js"></script>
</body>


</html>
