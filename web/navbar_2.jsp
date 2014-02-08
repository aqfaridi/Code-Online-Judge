<%-- 
    Document   : navbar
    Created on : Jul 21, 2014, 2:42:02 AM
    Author     : Pankaj Chaudhary
--%>
<%
String username1=(String)session.getAttribute("username");
String dpimage1 =(String) session.getAttribute("dpimage");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <div id="head-nav" class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="fa fa-gear"></span>
        </button>
        <a class="navbar-brand" href="index.jsp"><span>CodeOJ</span></a>
      
      </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
          <li class="active"><a href="index.jsp">Home</a></li>
          <li><a href="#about">About</a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Contact <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="profile.jsp?uid=aqfaridi">Abdul Qadir Faridi</a></li>
              <li><a href="profile.jsp?uid=jaswant">Jaswant Singh</a></li>
              <li><a href="profile.jsp?uid=pankaj9310">Pankaj Chaudhary</a></li>
                  
      </ul>
          </li>

        </ul>
    <ul class="nav navbar-nav navbar-right user-nav">
      <li class="dropdown profile_menu">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img alt="<%=username1%>" src="uploadimg/<%=dpimage1%>" height="35px" width="40px;" /><%=username1%> <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="changepass.jsp">Account Setting</a></li>
          <li><a href="profile.jsp?uid=<%=username1%>">Profile</a></li>
          <li><a href="#">Messages</a></li>
          <li class="divider"></li>
          <li><a href="logout.jsp">Sign Out</a></li>
        </ul>
      </li>
    </ul>			
    <ul class="nav navbar-nav navbar-right not-nav">
     
  
      <li class="button"><a href="javascript:;" class="speech-button"><i class="fa fa-facebook"></i></a></li>	
      <li class="button"><a href="javascript:;" class="speech-button"><i class="fa fa-twitter"></i></a></li>	
      <li class="button"><a href="javascript:;" class="speech-button"><i class="fa fa-google-plus"></i></a></li>				
    </ul>

      </div><!--/.nav-collapse -->
    </div>
  </div>