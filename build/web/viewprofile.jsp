<%-- 
    Document   : profile1
    Created on : Jul 21, 2014, 5:14:45 AM
    Author     : Pankaj Chaudhary
--%>

<%@page import="pojo.Submissions"%>
<%@page import="java.sql.Timestamp"%>
<%@ page errorPage="error.jsp" %>
<%@page import="java.nio.file.Path"%>
<%@page import="java.nio.file.FileSystems"%>
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
<!DOCTYPE html>
<html>
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
        
              <%
    String username =(String) session.getAttribute("username");
    String dpimage =(String) session.getAttribute("dpimage");
    String uid=request.getParameter("uid");
//    out.print(User);
    if(username != null)
               {%>

        <%@include file="navbar.jsp" %>
        <%@include file="leftpanel.jsp" %>
        <%  }
                else
                {%>
                <% response.sendRedirect("index.jsp"); %>
                  <%@include file="leftpanel1.jsp" %>
                 <% }
   %>
   
   
             <%! public SessionFactory factory = null;%>
  <%
                try{
      
               factory = new ConnectionProvider().getSessionFactory();
               Session s = factory.openSession();
               session.setAttribute("factory", factory);
               String st = "FROM User U WHERE U.username='"+uid+"'";
               Query q =  s.createQuery(st);
               List<User> users = q.list();
               Object[] ob=users.toArray();
               User now = (User)ob[0];
           
               s.close();
               factory.close();
               
        %>
            
            
 
        <div class="container-fluid" id="pcont">

	<div class="cl-mcont">
    <div class="row">
      <div class="col-sm-12">
        <div class="block-flat profile-info">
          <div class="row">
            <div class="col-sm-2">
              <div class="avatar">
                 
                <img src="uploadimg/<%=now.getDpimage() %>" class="profile-avatar" />
                </div>
                </div>
                <div class="col-sm-7">
                  <div class="personal">
                    <h1 class="name"><% out.print(now.getFullname()); out.flush(); %></h1>
                    <p class="description"><% out.println( now.getInstitute());  out.flush(); %>.
                    <br/>
                    <% out.println( now.getAboutme());  out.flush(); %>
                    <p>
                    
                <button class="btn btn-primary btn-flat btn-rad" data-modal="reply-ticket"><i class="fa fa-check"></i> Following</button>
              </div>
            </div>
            <div class="col-sm-3">
              <table class="no-border no-strip skills">
                <tbody class="no-border-x no-border-y">
                  <tr>
                    <td style="width:45%;">C</td>
                    <td><div class="progress"><div style="width: 80%" class="progress-bar progress-bar-info"></div></div></td>
                  </tr>
                  <tr>
                    <td>C++</td>
                    <td><div class="progress"><div style="width: 70%" class="progress-bar progress-bar-info"></div></div></td>
                  </tr>
                  <tr>
                    <td>Java</td>
                    <td><div class="progress"><div style="width: 50%" class="progress-bar progress-bar-info"></div></div></td>
                  </tr>
                  <tr>
                    <td>Python</td>
                    <td><div class="progress"><div style="width: 90%" class="progress-bar progress-bar-info"></div></div></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="row">
      <div class="col-sm-8">
        <div class="tab-container">
          <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#home">Information</a></li>
            <li><a data-toggle="tab" href="#friends">Friends</a></li>
         
          </ul>
          <div class="tab-content">
            <div id="home" class="tab-pane active cont">
              <table class="no-border no-strip information">
                <tbody class="no-border-x no-border-y">
                  <tr>
                    <td style="width:20%;" class="category"><strong>CONTACT</strong></td>
                    <td>
                      <table class="no-border no-strip skills">
                        <tbody class="no-border-x no-border-y">
                              <tr><td style="width:20%;"><b>Website</b></td><td><% out.print(now.getWebsite()); out.flush(); %></td></tr>
                              <tr><td style="width:20%;"><b>E-mail</b></td><td><% out.print(now.getEmailid()); out.flush(); %></td></tr>
                              <tr><td style="width:20%;"><b>Mobile</b></td><td><% out.print(now.getPhoneno()); out.flush(); %></td></tr>
                              <tr><td style="width:20%;"><b>Location</b></td><td><% out.print(now.getCity()); out.flush(); %>, <% out.print(now.getCountry()); out.flush(); %></td></tr>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td class="category"><strong>ABOUT ME</strong></td>
                        <td><p><% out.println(now.getAboutme()); out.flush(); %></p></td>
                  </tr>
                  <tr>
                    <td class="category"><strong>SOCIAL</strong></td>
                    <td> <a href="#" class="btn btn-default btn-flat btn-facebook bg" type="button"><i class="fa fa-facebook"></i> <span>Facebook</span></a>
                      <a href="#" class="btn btn-default btn-flat btn-linkedin bg" type="button"><i class="fa fa-linkedin"></i> <span>Linkedin</span></a>
                      <button class="btn btn-default btn-flat btn-twitter bg" type="button"><i class="fa fa-twitter"></i> <span>Twitter</span></button>
                      <button class="btn btn-default btn-flat btn-google-plus bg" type="button"><i class="fa fa-google-plus"></i> <span>Google+</span></button>
                    </td>
                  </tr>
               
                </tbody>
              </table>
                           <%
                            out.println("</table>");
                            }catch(Exception e)
                          {}
		%>
            </div>
            <div id="friends" class="tab-pane cont">
            <div class="btn-group pull-right">
              <button type="button" class="btn btn-sm btn-flat btn-default"><i class="fa fa-angle-left"></i></button> 
              <button type="button" class="btn btn-sm btn-flat btn-default"><i class="fa fa-angle-right"></i></button> 
            </div>
            <div class="btn-group pull-right">
              <button type="button" class="btn btn-sm btn-flat btn-default dropdown-toggle" data-toggle="dropdown">
              Order by <span class="caret"></span>
              </button>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">Asc</a></li>
                <li><a href="#">Desc</a></li>
                <li><a href="#">Email</a></li>
                <li class="divider"></li>
                <li><a href="#">Birthday</a></li>
              </ul>
            </div>
              <h3 class="widget-title">My Friends</h3>
              <div class="row friends-list">
                <div class="col-sm-6 col-md-4">
                  <div class="friend-widget">
                    <img src="images/avatars/avatar1.html" />
                    <h4>Andrea Smith</h4>
                    <p>Work</p>
                  </div>
                </div>
                <div class="col-sm-6 col-md-4">
                  <div class="friend-widget">
                    <img src="images/avatars/avatar2.html" />
                    <h4>Jeff Hanneman</h4>
                    <p>Family</p>
                  </div>
                </div>
                <div class="col-sm-6 col-md-4">
                  <div class="friend-widget">
                    <img src="images/avatar1_50.html" />
                    <h4>Jeff Hanneman</h4>
                    <p>Friends</p>
                  </div>
                </div>
                <div class="col-sm-6 col-md-4">
                  <div class="friend-widget">
                    <img src="images/avatar3_50.html" />
                    <h4>Andrea Smith</h4>
                    <p>Work</p>
                  </div>
                </div>
                <div class="col-sm-6 col-md-4">
                  <div class="friend-widget">
                    <img src="images/avatar4_50.jpg" />
                    <h4>Jeff Hanneman</h4>
                    <p>Work</p>
                  </div>
                </div>
                <div class="col-sm-6 col-md-4">
                  <div class="friend-widget">
                    <img src="images/avatars/avatar2.html" />
                    <h4>Jeff Hanneman</h4>
                    <p>Work</p>
                  </div>
                </div>
              </div>
            </p></div>
        
              
        
          </div>
        </div>    
        
        
      </div>
      
      <div class="col-sm-4 side-right">
        <div class="block-flat bars-widget">
          <div class="spk4 pull-right spk-widget"></div>
          <h4>Total Sales</h4>
          <p>Monthly summary</p>
          <h3>545</h3>
        </div>
        
        <div class="block-flat bars-widget">
          <div class="spk5 pull-right spk-widget"></div>
          <h4>New Visitors</h4>
          <p>Stat Description</p>
          <h3>146</h3>
        </div>
    
        
      </div>
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
  <script type="text/javascript" src="js/jquery.niftymodals/js/jquery.modalEffects.html"></script>   
  <script type="text/javascript" src="js/masonry.html"></script>
  <script type="text/javascript" src="js/jquery.crop/js/jquery.Jcrop.html"></script>

  <!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
  <script src="js/jquery.upload/js/jquery.iframe-transport.html"></script>
  <!-- The basic File Upload plugin -->
  <script src="js/jquery.upload/js/jquery.fileupload.html"></script>
	<script type="text/javascript" src="js/behaviour/general.js"></script>

    <script type="text/javascript">
      $(document).ready(function(){
        //initialize the javascript
        App.init();
        
        $(".spk4").sparkline([2,4,3,6,7,5,8,9,4,2,10,], { type: 'bar', width: '200px', barWidth: 6, height: '50px',barColor: '#19B698'});
        $(".spk5").sparkline([5,3,5,6,5,7,4,8,6,9,8,], { type: 'bar', width: '80px', barWidth: 6, height: '50px',barColor: '#E85647'});
        
        //Profile Image Upload
          'use strict';
        // Change this to the location of your server-side upload handler:
        var url =  'js/jquery.upload/server/php/index.html';
        var jcrop;
        var timg;
        
        $('#fileupload').fileupload({
            url: url,
            dataType: 'json',
            done: function (e, data) {
                $.each(data.result.files, function (index, file) {
                    timg = file.name;
                    $(".crop-image").html('<img src="js/jquery.upload/server/php/files/' + file.name + '" />');
                    $('#progress').fadeOut();
                    
                    //Crop Image
                    $(".crop-image img").Jcrop({
                      aspectRatio: 1
                    },function(){
                      jcrop = this;
                    });
                });
                
                $("#crop-image").niftyModal();
            },
            progressall: function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress').fadeIn();
                $('#progress').css(
                    'width',
                    progress + '%'
                );
            }
        }).prop('disabled', !$.support.fileInput).parent().addClass($.support.fileInput ? undefined : 'disabled');
        
        $("#save-image").click(function(){
          var c = jcrop.tellSelect();
          //console.log(jcrop.tellSelect());
          if( c.w != 0 ){
            $(".profile-avatar").attr("src",'js/jquery.upload/server/php/files/cropb6ce.html?src=' + timg + '&x=' + c.x + '&y=' + c.y + '&w=' + c.w + '&h=' + c.h );
            $("#crop-image").niftyModal('hide');
          }else{
            alert("Please select a crop region then press save.");
          }
        });

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

<!-- Mirrored from foxypixel.net/cleanzone/pages-profile.html by HTTrack Website Copier/3.x [XR&CO'2013], Sat, 12 Jul 2014 11:03:49 GMT -->
</html>
