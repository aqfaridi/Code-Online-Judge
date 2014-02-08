<%-- 
    Document   : submitaction
    Author     : aqfaridi
--%>

<%@page import="org.json.simple.JSONObject"%>

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
    String problemid = (String)request.getParameter("q");
    String code = (String)request.getParameter("code");
//    out.print(User);
    if(username != null)
               {%>

        <%@include file="navbar.jsp" %>
        <%@include file="leftpanelonline.jsp" %>
        <%  }
                else
                {
                    response.sendRedirect("login.jsp");
                }
   %>
  	
		<div class="container-fluid" id="pcont">
                    <div class="row-fluid">
                        <div class="col-sm-12">
                            <input type="hidden" id = "code" value=<%=code%> />
                            <input type="hidden" id = "contestcode" value=<%=contestcode%> />
                            <input type="hidden" id = "problemid" value=<%=problemid%> />
         
                        </div></div>
                            <div class="row-fluid" style="margin-top: 10%;">
                                <div class="col-sm-4">
                                 &nbsp;   
                                </div>
                                <div class="col-sm-4" style="border: 1px #333 solid; height: 150px; z-index: 5000;  ">
                                    <center>
                                        
                                      <img src="assets/img/loading.gif" alt="Running please wait..." id="loading"/><br/>
                                      <img src="assets/img/accepted.gif" alt="Accepted" id="Accepted"/>
                                      <img src="assets/img/wrong.gif" alt="Wrong Answer" id="Wrong" />
                                      <img src="assets/img/tle.png" alt="TimeLimit Exceeded" id="TLE" />
                                      <img src="assets/img/presentation.png" alt="Presentation Error" id="Presentation" />
                                      <img src="assets/img/runtime.png" alt="Runtime Error" id="Runtime" />
                                      <br/>
  <span id="exec_time" style="font-weight:bold;color:#666;"></span><br/>
  <span id="status" style="font-weight:bold;"></span><br/><br/>
  <a  class="btn btn-primary" id = "mysub" href = "mysubmission.jsp?q=<%out.print(""+(String)request.getParameter("q")+"&c="+(String)request.getParameter("c")+"&id=0" ); out.flush(); %>">My Submissions</a>
                                    </center>
                                </div>
                            </div>
      
  
   <script type="text/javascript" src="js/jquery.js"></script>
  <script>
    $( document ).ready(function() {
        $('#mysub').hide();
         $('#Accepted').hide(); $('#Wrong').hide(); $('#TLE').hide(); $('#Presentation').hide(); $('#Runtime').hide(); 
        var myInterval =  setInterval(function ()  {
                var code =  $('#code').val();
                var contestcode =  $('#contestcode').val();
                var problemid =  $('#problemid').val();
                $.post('checkdb',{'q' : problemid,'c':contestcode,'code':code},function(dt){
                        var json = JSON.parse(dt);
                        //alert(dt);
                        if(json['check'] == "1")
                        {
                            //alert(dt);   
                            if(json['status'] == "Accepted")
                            {
                                $('#status').css("color","green");
                                $('#Accepted').show();
                                $('#exec_time').text(" "+json['exec_time'] + " sec");
                                
                            }
                            else if(json['status'] == "Wrong Answer")
                            {
                                $('#status').css("color","red");
                                $('#Wrong').show();
                                $('#exec_time').text(" "+json['exec_time'] + " sec");
                            }
                            else if(json['status'] == "Presentation Error")
                            {
                                $('#Presentation').show();
                                $('#status').css("color","orange");                        
                            }
                            else if(json['status'] == "Time Limit Exceeded")
                            {
                                $('#TLE').show();
                                $('#status').css("color","orange");                        
                            }
                            else 
                            {
                                $('#Runtime').show();
                                $('#status').css("color","orange");                        
                            }
                            
                            $('#status').text(json['status']);
                            
                            $('#loading').hide();//.css("visibility", 'hidden');
                            $('#mysub').show();
                            setTimeout(function() { clearInterval( myInterval ); });                           
                        }       
                    });       
        },3000);
     });

  </script>

                        </div>
					
		</div> 
		
	</div>
</div>


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
