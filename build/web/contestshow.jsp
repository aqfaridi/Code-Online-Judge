<%-- 
    Document   : contestshow.jsp
    Author     : aqfaridi
--%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page errorPage="error.jsp" %>
<%@page import="pojo.Problems"%>
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
<%@page import="connection.Path" %>
<%@page import="java.sql.*"%>
<%@page import="connection.Config"%>

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
<script type="text/javascript" src="assets/js/countdown.js"></script>
  <!-- Fixed navbar -->
   <%
    String username =(String) session.getAttribute("username");
    String dpimage =(String) session.getAttribute("dpimage");
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
                    <div class="row-fluid">
                        <div class="col-sm-8">
                          
                <%! public SessionFactory factory = null;%>
                  <% 
                      String id = (String)request.getParameter("c");
                
                factory = new ConnectionProvider().getSessionFactory();
                Session s = factory.openSession();
                session.setAttribute("factory", factory);
            ContestInfo now=null;
            Object[] ob = null;
            Query q = null;
            String st = "";
            
           try{  
               st = "FROM ContestInfo S WHERE S.contestCode='"+id+"'";
                q =  s.createQuery(st);
                List<ContestInfo> users = q.list();
                ob=users.toArray();
                now = (ContestInfo)ob[0];
           }
           catch(Exception e){out.println(e.toString());}
                
   
   //s.clear();
   //s.close();
  
   %>     

        <h3 align="center"><% out.print(now.getContestCode()); out.flush(); %></h3>
        <%
            Timestamp sdate = now.getStartTime();
            Timestamp edate = now.getEndTime();
            java.util.Date date= new java.util.Date();
            Timestamp ts = new Timestamp(date.getTime());
      
 if(!(id.equalsIgnoreCase("BEGINNER") || id.equalsIgnoreCase("PRACTICE"))){
 
%>     
        
    <table id="sortTableExample" class='table zebra-striped'>
           <thead>
            <tr>
                <th class="red header">Quiz Code</th>
                <th class="blue header">Start Date</th>
                <th class="green header headerSortUp">End Date</th>
                <th class="yellow header">Contest</th>
            </tr>
            </thead>
           <tbody>

               <tr>
                   <td style="font-weight:bold;">
                         <% out.print(now.getContestCode()); out.flush(); %>
                   </td>
                   <td style="font-weight:bold;">
                        <% out.print(now.getStartTime()); out.flush(); %>
                   </td>
                   <td style="font-weight:bold;">
                       <% out.print(now.getEndTime()); out.flush(); %>
                   </td>


<td>
     <%   

            long remaining = (edate.getTime() - ts.getTime())/1000;
             
     if(ts.compareTo(sdate)<0 )
      {
          long instart = (sdate.getTime() - ts.getTime())/1000;
    %>
    <center>

         <script type="application/javascript">
                        var ist = <%=instart%>;
                        var ss = "hour"; 
                        var chk1 = ist /(24*3600);
                        //alert(ist);
                        //alert(chk1);
                        if(chk1 >= 1)
                            ss = "day";

                        var myCountdown2 = new Countdown({
                                time: ist,
                                width:180,
                                height:40,
                                rangeHi:ss	// <- no comma on last item!                              
                                });

                      </script>
        <%
        out.println("<p style='font-weight:bold;color:orange'>Remaining</p></center>");
      }
      else if(ts.compareTo(sdate)>0 && ts.compareTo(edate)<0)
      {
    %>
    <center>        <script type="application/javascript">
                        var rem = <%=remaining%>;
                        var str = "hour";
                        var chk2 = rem /(24*3600);
                        if(chk2 >= 1)
                            str = "day";
               
                        var myCountdown2 = new Countdown({                           
                                time: <%=remaining%>,
                                width:180,
                                height:40,
                                rangeHi:str	
                                });

                      </script>
                    
           
        <%
        out.println("<p style='font-weight:bold;color:green'>Running</p></center>");
      }

      else
      {
    %>
   <p style='font-weight:bold;color:red'>
        <%
        out.println("Contest ended");
      }               
        %>
       
    </p></td>
</tr></tbody></table>
        
        <%
     
}//if
%>       
        <br/>

        
        <!--   ====================poster====================  --->
        <img src='<% out.print("contests/"+now.getContestCode()+"/"+ now.getPoster()+"'"); %> alt="Poster" class="col-sm-12" align="center" height="350px"></img>
                
        <br/><br/>
          <%
          try{
        //s = factory.openSession();
        st = "FROM Problems S WHERE S.contestcode='"+now.getContestCode()+"' order by difficulty";
        q =  s.createQuery(st);
        List<Problems> ques = q.list();
        ob=ques.toArray();

              }catch(Exception e){out.print(e.getMessage()); }
          finally{
              s.clear();
              s.close();
              factory.close();
          }


        
        %>
        
      <table class='table'>
           <thead style="background-color: #F4F4F4; height: 40px; border: 2px; border-color: F4F4F4;">
            <tr>
                <th class="header">#</th>
                <th class="sheader">Problem Name</th>
                <th class="blue header">Problem Code</th>
                <th class="green header">Solved By</th>
                <th class="green header headerSortUp">Accuracy</th>
                </tr>
            </thead>
           <tbody>
            <% 
            Config c = new Config();
            Connection con = c.getcon();
            Statement stmt = con.createStatement();
            Statement stmt2 = con.createStatement();
            Statement stmt3 = con.createStatement();
            Statement stmt4 = con.createStatement();
            Statement stmt5 = con.createStatement();
            Statement stmt6 = con.createStatement();
            String contestcode = id;
        //contest running or ended
  if(ts.compareTo(sdate)>0)
      {
         try{
             for(int i=1; i<= ob.length ;i++)
                {  
                   Problems tmp = (Problems)ob[i-1];
                   String problemid = tmp.getProblemcode();
                   double acc = 0;
                   if(tmp.getTotal()!=0){
                       acc=(1000*tmp.getSuccess())/tmp.getTotal();
                       acc/=1000.0;
                   }

                  
                   int Nr=0,Dr=1,solved=0;
                   double Accuracy = 0.0;
                   String qry = "Select count(*) as col from "+contestcode+"submissions where status='Accepted' AND problemid='"+problemid+"'";
                   //out.println(qry);
                   String qry1 = "Select count(*) as col1 from "+contestcode+"submissions where problemid='"+problemid+"'";
                   //out.println(qry1);
                   String sql = "Select count(DISTINCT username) as col2 from "+contestcode+"submissions where status='Accepted' and problemid='"+problemid+"'"; 
                   //out.println(sql);

           

                          ResultSet rs = stmt.executeQuery(qry);
                          if(rs.next())
                              Nr = Integer.parseInt(rs.getString("col"));

                          ResultSet rs1 = stmt2.executeQuery(qry1);
                          if(rs1.next())
                              Dr = Integer.parseInt(rs1.getString("col1"));

                          ResultSet rs2 = stmt3.executeQuery(sql);
                          if(rs2.next())
                              solved = Integer.parseInt(rs2.getString("col2"));
                          //out.println(Nr+"/"+Dr);
                          //out.println(solved);
                          Accuracy = (Nr*1.0)/Dr;    
                          int ta = (int)(Accuracy*1000);
                          Accuracy = ta / 1000.0;
                          
               String qry2 = "Select count(*) as col from "+contestcode+"submissions where status='Accepted' AND problemid='"+problemid+"' AND username='"+username+"'";           
               int solve = 0;
               ResultSet rs3 = stmt5.executeQuery(qry2);
                          if(rs3.next())
                               solve = Integer.parseInt(rs3.getString("col"));
                          
               int notsolve = 0;           
               if(solve == 0)
               {
                    String qry3 = "Select count(*) as col from "+contestcode+"submissions where status <>'Accepted' AND problemid='"+problemid+"' AND username='"+username+"'";           
                    
                    ResultSet rs4 = stmt6.executeQuery(qry3);
                              if(rs4.next())
                                   notsolve = Integer.parseInt(rs4.getString("col"));   
               }
                          
               if(solve >= 1)           
                    out.print("<tr class = 'success' style = 'font-weight:bold;'><td>"+i+"</td><td><a href='problemshow.jsp?q="+tmp.getProblemcode()+"&c="+now.getContestCode()+"' >"+tmp.getProblemname()+"</td><td><a href='submit.jsp?q="+tmp.getProblemcode()+"&c="+now.getContestCode()+"' target= _blank>"+tmp.getProblemcode()+"</a></td><td>"+solved+" </td><td>"+Accuracy+"</td></tr>");
               else if(notsolve >= 1)
                      out.print("<tr class='danger' style = 'font-weight:bold;'><td>"+i+"</td><td><a href='problemshow.jsp?q="+tmp.getProblemcode()+"&c="+now.getContestCode()+"' >"+tmp.getProblemname()+"</td><td><a href='submit.jsp?q="+tmp.getProblemcode()+"&c="+now.getContestCode()+"' target= _blank>"+tmp.getProblemcode()+"</a></td><td>"+solved+" </td><td>"+Accuracy+"</td></tr>");
               else
                     out.print("<tr><td>"+i+"</td><td><a href='problemshow.jsp?q="+tmp.getProblemcode()+"&c="+now.getContestCode()+"' >"+tmp.getProblemname()+"</td><td><a href='submit.jsp?q="+tmp.getProblemcode()+"&c="+now.getContestCode()+"' target= _blank>"+tmp.getProblemcode()+"</a></td><td>"+solved+" </td><td>"+Accuracy+"</td></tr>");
            
               //contest running or ended

                 }
           
          }catch(Exception e){out.println(e.getMessage());}
      }
            %>
           </tbody>
        </table>
  
            
<br><br/><br/>
        <p style="text-align: justify; ">
            <%  BufferedReader br=null;
           try{ 
             String path = connection.Path.getArgPath("contests",now.getContestCode(),"description.txt");
              br = new BufferedReader(new FileReader(path.toString()));
    }catch(Exception e){ out.print(e.getMessage()); }
   for(;;){
       String str=null;
       try {
         str =  br.readLine();
        
       }catch(Exception e){break;} 
       if(str==null)break;
       out.print(""+str);
       
   }
           %>

        
        </p>

    </div>
    
           <!--    =============== current top ranker  ====================  -->
           
    <div class="col-sm-4">
        <h3>Current Top Rankers : </h3>
      <table  class='table '>
           <thead style="background-color: #F4F4F4; height: 40px; border: 2px; border-color: F4F4F4;">
            <tr>
               
                <th class="header">Rank</th>
                <th class="blue header">User</th>
                <th class="green header">Score</th>
                <th class="green header">Total Time</th>
                </tr>
            </thead>
           <tbody>
         <%      
     String query =  "Select * from "+contestcode+"ranking ORDER BY score DESC , time ASC LIMIT 10";
try
{
      ResultSet rs4 = stmt4.executeQuery(query);
      int i=0;
      while(rs4.next())
      {
            i++;
            out.print("<tr>");
            out.print("<td align='center'>"+i+"</td>");
            out.print("<td  align='center'><a href='profile.jsp?uid="+rs4.getString("userid")+"'>"+rs4.getString("userid")+"</a></td>");
            long sc =  Long.parseLong(rs4.getString("score")); 
            long diff = Long.parseLong(rs4.getString("time"));
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
           out.print("</tr>");
      }
}catch(Exception e){}
finally{
    con.close();
}
         
    %>        
           </tbody>
        </table>
    <br/><br/><br/>
    </div>
    </div>
    </div>
</div>
    <br/><br/>
        

    


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
