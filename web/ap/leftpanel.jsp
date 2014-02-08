<%-- 
    Document   : leftpanel
    Created on : Jul 21, 2014, 3:55:09 AM
    Author     : Pankaj Chaudhary
--%>
<% 
String user = (String)session.getAttribute("adminuser");
%>
<div id="cl-wrapper" >
            <div class="cl-sidebar">
                    <div class="cl-toggle"><i class="fa fa-bars"></i></div>
                    <div class="cl-navblock">
    <div class="menu-space">
      <div class="content">
        <div class="side-user">
          <div class="avatar"><img src="../images/avatar1_50.html" alt="Avatar" /></div>
          <div class="info">
            <a href="#"><%=user%></a>
             <img src="../images/state_online.png" alt="Status" /> <span>Online</span>
           </div>
         </div>
        <ul class="cl-vnavigation">

          <li><a href="#"><i class="fa fa-book"></i><span>Contest Set</span></a>
            <ul class="sub-menu">
              <li><a href="contestSet.jsp">Contest Code</a></li>
              <li><a href="contestSetInfo.jsp">Contest Set Info</a></li>
            </ul>
          </li>
          <li><a href="#"><i class="fa fa-list-alt"></i><span>Problem Set</span></a>
            <ul class="sub-menu">
              <li><a href="problemSet.jsp">Problem Code</a></li>
              <li><a href="problemSetInfo.jsp">Problem Set Info</a></li>
            </ul>
          </li>
           <li><a href="comment.jsp"><i class="fa fa-comments"></i><span>Comments</span></a></li>
          <li><a href="users.jsp"><i class="fa fa-user     "></i><span>Users</span></a></li>
          <li><a href="contestdelete.jsp"><i class="fa fa-file"></i><span>Contest Delete</span></a></li>
          <li><a href="ratingupdate.jsp"><i class="fa fa-file"></i><span>Rating Update</span></a></li>
          <li><a href="makepublic.jsp"><i class="fa fa-file"></i><span>Make Public</span></a></li>
         
        </ul>
      </div>
    </div>
    <div class="text-right collapse-button" style="padding:7px 9px;">
      <input type="text" class="form-control search" placeholder="Search..." />
      <button id="sidebar-collapse" class="btn btn-default" style=""><i style="color:#fff;" class="icon icon-white icon-arrow-left"></i></button>
    </div>
                    </div>
            </div>
