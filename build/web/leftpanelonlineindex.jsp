<%-- 
    Document   : leftpanel
    Created on : Jul 21, 2014, 3:55:09 AM
    Author     : Pankaj Chaudhary
--%>
<% 
String user = (String)session.getAttribute("username");
%>
<div id="cl-wrapper" >
            <div class="cl-sidebar">
                    <div class="cl-toggle"><i class="fa fa-bars"></i></div>
                    <div class="cl-navblock">
    <div class="menu-space">
      <div class="content">
        <div class="side-user">
         <div class="avatar"><img src="uploadimg/<%=(String)session.getAttribute("dpimage")%>" height="50" width="45" alt="" /></div>
         
          <div class="info">
            <a href="#"><%=user%></a>
             <img src="images/state_online.png" alt="Status" /> <span>Online</span>
           </div>
         </div>
        <ul class="cl-vnavigation">
            <li><a href="index.jsp"><i class="fa fa-calendar"></i><span><b>Contests</b></span></a></li>
            <li><a href="contestshow.jsp?c=BEGINNER"><i class="fa fa-smile-o"></i><span><b>Beginner Corner</b></span></a>
            <li><a href="contestshow.jsp?c=PRACTICE"><i class="fa fa-pencil-square-o"></i><span><b>Practice Corner</b></span></a></li>
  
        </ul>
      </div>
    </div>
    <div class="text-right collapse-button" style="padding:7px 9px;">
      <input type="text" class="form-control search" placeholder="Search..." />
      <button id="sidebar-collapse" class="btn btn-default" style=""><i style="color:#fff;" class="icon icon-white icon-arrow-left"></i></button>
    </div>
                    </div>
            </div>
