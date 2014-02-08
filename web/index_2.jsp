<%-- 
    Document   : index.jsp
    Created on : Jul 24, 2014, 4:17:45 AM
    Author     : aqfaridi
--%>

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
<%@page import="java.sql.*"%>
<%@page import="connection.Config"%>
<!DOCTYPE html>
<html>
   <head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="shortcut icon" href="images/favicon.ico">

	<title>Code Online Jude</title>
	
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <body>
                <%
    String username =(String) session.getAttribute("username");
//    out.print(User);
    if(username != null)
               {%>

        <%@include file="navbar.jsp" %>
        <%@include file="leftpanelonlineindex.jsp" %>
        <%  }
                else
                {%>
                 <%@ include file="navbar1.jsp" %>
                 <%@include file="leftpanelofflineindex.jsp" %>
                 <% }
   %>
    <c:if test='${not empty param["register"]}'>
                          <script>
                            alert("Please Register First !!")
                          </script>
    </c:if> 
 <div class="container-fluid">
   <div class="row-fluid" style="margin-top: 20px;">
        <div class="col-sm-3">
                   
               <table class=" table table-bordered">
                <tr>
                    <td colspan="3" style="background-color: #F4F4F4;"><h4 align="center"> → Top rated</h4> 
                    </td>
                </tr>
                <tr>
                    <td>#</td>
                    <td>User</td>
                    <td>Rating</td>
                </tr>
   
   
   
   
   <% 
   
   SessionFactory factory = new ConnectionProvider().getSessionFactory();
   Session s = factory.openSession();
   Session s2= factory.openSession();
   String st = "FROM User U ORDER BY U.rating DESC";
   String st2 = "FROM User U ORDER BY U.contribution DESC";
   Query q=null,q2=null;
   Object[] ob = null;
   int maxRows = 5;
   try{
        q =  s.createQuery(st);
        q.setMaxResults(maxRows);
        q2 =  s2.createQuery(st2);
        q2.setMaxResults(maxRows);
        List<User> users = q.list();
        ob=users.toArray();
        for(int i=0;i<Math.min(ob.length,maxRows);i++)
        {
            User one = (User)ob[i];
            String un = one.getUsername();
   %>
                <tr>
                    <td><%=i+1%></td>
                    <td><a class="aa" href="profile.jsp?uid=<%=un%>"><%=un%></a></td>
                    <td><% out.print(one.getRating()); out.flush();  %></td>
                </tr>
   
                <%
        }
                    %>
        </table>              
    <br/> <br/> <br/>
               <table class=" table table-bordered">
                <tr>
                    <td colspan="3" style="background-color: #F4F4F4;"><h4 align="center"> → Top contributors</h4> 
                    </td>
                </tr>
                <tr>
                    <td>#</td>
                    <td>User</td>
                    <td> Contribution.</td>
                </tr>

            <% 
        
            users = q2.list();
            ob=users.toArray();
            for(int i=0;i < Math.min(ob.length,maxRows);i++)
            {
                User one = (User)ob[i];
                String un = one.getUsername();
             %>    
                <tr>
                    <td><%=i+1%></td>
                   <td><a class="aa" href="profile.jsp?uid=<%=un%>"><%=un%></a></td>
                   <td><% out.print(one.getContribution()); out.flush();  %></td>
                </tr>
                <%
            }
                %>    

            </table> 
            
    </div>
        <div class="col-sm-8">
            
            <!-- ============== upcoming contest part =================== -->
              <table class="table table-bordered">
                <tr>
                    <td colspan="5" style="background-color: #F4F4F4;"><h4>upcoming contests </h4></td>
                </tr>
                <tr>
                    <td><h5 align="center"> #</h5></td>
                    <td class="span3"><h5 align="center">Name</h5></td>
                    <td><h5 align="center">Start Time</h5></td>
                    <td><h5 align="center">End Time</h5></td>
                    <td> <h5 align="center">Register</h5></td>
                </tr>
               <%              
         }
    catch(Exception e)
   {} 
    finally
   {
        s.close();
   }
                    
                    
                    
                    
                    
                    
                    
        int len =0;
                      
         Config c = new Config();
         Connection con = c.getcon();        
       //  ResultSet rss = null;
         Statement stt = con.createStatement();
          Statement stt1 = con.createStatement();
         String qry = "";
         int cnt = 0;             
               
            try{
                    // Session s3= factory.openSession();
                     String st3 = "FROM ContestInfo st WHERE st.startTime > CURRENT_TIMESTAMP() ORDER BY st.startTime ASC";  //DESC
                     Query q3 =  s2.createQuery(st3);
                     List <ContestInfo> setters = q3.list();
                     ob = setters.toArray();
                      len = ob.length ;
                    // ContestInfo test = (ContestInfo)ob[0]; ContestInfo test2 = (ContestInfo)ob[1];
                     //test.
                      //      out.write(test.toString()); out.flush();

                        //    out.write(test2.toString()); out.flush();
               }
               catch(Exception ex){   
                   out.print(ex.toString());out.flush(); }
                  
                    
             for(int i=1;i<=Math.min(4,len);i++){
                   cnt = 0;
                   ContestInfo test = (ContestInfo)ob[i-1];
        %>           
                    <tr><td><%=i%></td>
                     <td><a href='contestshow.jsp?c=<%=test.getContestCode()%>' class='aa'><%=test.getContestName()%></a> </td>
                     <td><%=test.getStartTime().toString()%></td>
                     <td><%=test.getEndTime()%></td>
                     
                     <td>    
                         <%

                           qry = "select count(*) as col from "+test.getContestCode()+"ranking where userid='"+username+"'";
                           ResultSet rss = stt.executeQuery(qry);
                           if(rss.next())
                           {
                               cnt = Integer.parseInt(rss.getString("col"));
                            }
                           if(cnt == 0)
                               {
                       %>
                                     <form action="reg.jsp" method="post">
                                            <input type="hidden" name="contestcode" value="<%=test.getContestCode()%>" />
                                            <button type='submit' class='btn btn-danger'>Register</button>
                                     </form>
                           <%
                                }//if
                                           else
                                {
                                %>
                                 <p style="color:green;font-weight:bold;">Registered</p>
                                 <%
                                 }//else
                           
                           out.println("</td></tr>");
             }
                          %>
                          
           
            </table>
                          
                          <!-- ================== current contest part =================== -->
                          
      <table class="table table-bordered">
                <tr>
                    <td colspan="5" style="background-color: #F4F4F4;"><h4>Current contests </h4></td>
                </tr>
                <tr>
                    <td><h5 align="center"> #</h5></td>
                    <td class="span3"><h5 align="center">Name</h5></td>
                    <td><h5 align="center">Start Time</h5></td>
                    <td><h5 align="center">End Time</h5></td>
                    <td> <h5 align="center">Register</h5></td>
                </tr>
             
                <% 
   
             int len2 =0;
                    try {
                    //Session s4= factory.openSession();
                    String st4 = "FROM ContestInfo st WHERE st.startTime < CURRENT_TIMESTAMP() AND st.endTime > CURRENT_TIMESTAMP() ORDER BY st.startTime ASC";  //DESC
                    Query q4 =  s2.createQuery(st4);
                    List <ContestInfo> setters = q4.list();
                    ob = setters.toArray();
                     len2 = ob.length ;
  // ContestInfo test = (ContestInfo)ob[0]; ContestInfo test2 = (ContestInfo)ob[1];
   //test.
    //      out.write(test.toString()); out.flush();
          
      //    out.write(test2.toString()); out.flush();
               }catch(Exception ex){ out.print(ex.toString());out.flush(); }
                    
   
               for(int i=1;i<=Math.min(4,len2);i++){
                   cnt = 0;
                   ContestInfo test = (ContestInfo)ob[i-1];
                   if(!(test.getContestCode().toString().equalsIgnoreCase("BEGINNER") || test.getContestCode().toString().equalsIgnoreCase("PRACTICE"))){
        %>           
                    <tr><td><%=i%></td>
                     <td><a href='contestshow.jsp?c=<%=test.getContestCode()%>' class='aa'><%=test.getContestName()%></a> </td>
                     <td><%=test.getStartTime().toString()%></td>
                     <td><%=test.getEndTime()%></td>
                     
                     <td>    
                         <%

                           qry = "select count(*) as col from "+test.getContestCode()+"ranking where userid='"+username+"'";
                           ResultSet rss2 = stt.executeQuery(qry);
                           if(rss2.next())
                           {
                               cnt = Integer.parseInt(rss2.getString("col"));
                            }
                           if(cnt == 0)
                               {
                       %>
                                     <form action="reg.jsp" method="post">
                                            <input type="hidden" name="contestcode" value="<%=test.getContestCode()%>" />
                                            <button type='submit' class='btn btn-danger'>Register</button>
                                     </form>
                           <%
                                }//if
                                           else
                                {
                                %>
                                 <p style="color:green;font-weight:bold;">Registered</p>
                                 <%
                                 }//else
                           out.println("</td></tr>");
               }
               }
           
                 %>
                
            </table>
            <br/>
            
            
            <!-- ============== past contest part ========================== -->
            

            
            
            
            
            
            
                    <br/>
              <table class="table">
                <tr>
                    <td colspan="5" style="background-color: #F4F4F4;"><h4>Past contests </h4></td>
                </tr>
                <tr>
                    <td><h5 align="center"> #</h5></td>
                    <td class="span3"><h5 align="center">Name</h5></td>
                    <td><h5 align="center">Winner Name</h5></td>
                    <td><h5 align="center">Winner Score</h5></td>
             
                </tr>          
 <% int len3 =0;
                    try {
   //Session s4= factory.openSession();
   String st4 = "FROM ContestInfo st WHERE st.endTime < CURRENT_TIMESTAMP() ORDER BY st.endTime DESC";  //DESC
   Query q4 =  s2.createQuery(st4);
   List <ContestInfo> setters = q4.list();
   ob = setters.toArray();
    len3 = ob.length ;
  // ContestInfo test = (ContestInfo)ob[0]; ContestInfo test2 = (ContestInfo)ob[1];
   //test.
    //      out.write(test.toString()); out.flush();
          
      //    out.write(test2.toString()); out.flush();

   
               for(int i=1;i<=Math.min(3,len3);i++){
               
                   ContestInfo test = (ContestInfo)ob[i-1];
                   String contestcode = test.getContestCode();
        %>           
                    <tr><td rowspan="4"><%=i%></td>
                        
                     <td rowspan="4"><a href='contestshow.jsp?c=<%=contestcode%>' class='aa'><%=test.getContestName()%></a> </td>
                    </tr>
                         <%

                           qry = "select  "+contestcode+"ranking.userid," + contestcode + "ranking.score," + contestcode + "ranking.time,User.fullname from "+contestcode+"ranking INNER JOIN User ON "+contestcode+"ranking.userid=User.username ORDER BY "+contestcode+"ranking.score DESC,"+contestcode+"ranking.time ASC";
                           //out.println(qry);
                           ResultSet rss2 = stt1.executeQuery(qry);
                           int win = 1;
                           String winner="",score="",time="",name="";
                           long hh=0,mm=0,ss=0,diff=0;
                           while(rss2.next() && win <=3)
                           {
                              
                               winner = rss2.getString("userid");
                               score = rss2.getString("score");
                               name = rss2.getString("fullname");
                                diff = Long.parseLong(rss2.getString("time"));             
                                diff /= 1000;
                                hh=diff/(60*60);
                                diff=diff-hh*(3600);
                                mm=diff/60;
                                diff=diff-mm*60;
                                ss=diff;
                                time = hh+":"+mm+":"+ss;
                                
                               out.println("<tr><td>"+win+". "+name+"("+winner+")</td>");
                               out.println("<td>"+score+"("+time+")</td></tr>");
                               win++;
                      
                            }   
               }
               
                   }
               catch(Exception ex){ out.print(ex.toString());out.flush(); }
               finally{
                      con.close();
                      s2.close();      
                      factory.close();                  
                    }     
                              
               
                 %>
                
              </table>
            <br/>
            
            
            
            
            
            
            
            
            <!-- ============== Tutorials part start here =========================== -->
              <table class="table table-bordered">
                <tr>
                    <td colspan="5" style="background-color: #F4F4F4;"><h4>New Tutorial: </h4></td>
                </tr>
                <tr>
                    <td><h5 align="center"> #</h5></td>
                    <td class="col-sm-3"><h5 align="center">Name</h5></td>
                    <td><h5 align="center">Covered Topics</h5></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td><a href="#" class="aa">edit distance</a> </td>
                    <td>DP, greedy</td>
               </tr>
            </table>
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
