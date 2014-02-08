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
          <li><a href="#"><i class="fa fa-home"></i><span>Dashboard</span></a>
            <ul class="sub-menu">
              <li><a href="index-2.html">Version 1</a></li>
              <li><a href="dashboard2.html"><span class="label label-primary pull-right">New</span> Version 2</a></li>
            </ul>
          </li>
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
          <li><a href="#"><i class="fa fa-list-alt"></i><span>Forms</span></a>
            <ul class="sub-menu">
              <li><a href="form-elements.html">Components</a></li>
              <li><a href="form-validation.html">Validation</a></li>
              <li><a href="form-wizard.html">Wizard</a></li>
              <li><a href="form-masks.html">Input Masks</a></li>
              <li><a href="form-multiselect.html"><span class="label label-primary pull-right">New</span>Multi Select</a></li>
              <li><a href="form-wysiwyg.html"><span class="label label-primary pull-right">New</span>WYSIWYG Editor</a></li>
              <li><a href="form-upload.html"><span class="label label-primary pull-right">New</span>Multi Upload</a></li>
            </ul>
          </li>
          <li><a href="#"><i class="fa fa-table"></i><span>Tables</span></a>
            <ul class="sub-menu">
              <li><a href="tables-general.html">General</a></li>
              <li><a href="tables-datatables.html"><span class="label label-primary pull-right">New</span>Data Tables</a></li>
            </ul>
          </li>              
          <li><a href="#"><i class="fa fa-map-marker nav-icon"></i><span>Maps</span></a>
            <ul class="sub-menu">
              <li><a href="maps.html">Google Maps</a></li>
              <li><a href="vector-maps.html"><span class="label label-primary pull-right">New</span>Vector Maps</a></li>
            </ul>
          </li>             
          <li><a href="#"><i class="fa fa-envelope nav-icon"></i><span>Email</span></a>
            <ul class="sub-menu">
              <li><a href="email-inbox.html">Inbox</a></li>
              <li><a href="email-read.html">Email Detail</a></li>
              <li><a href="email-compose.html"><span class="label label-primary pull-right">New</span>Email Compose</a></li>
            </ul>
          </li>
          <li><a href="typography.html"><i class="fa fa-text-height"></i><span>Typography</span></a></li>
          <li><a href="charts.html"><i class="fa fa-bar-chart-o"></i><span>Charts</span></a></li>
          <li><a href="#"><i class="fa fa-file"></i><span>Pages</span></a>
            <ul class="sub-menu">
              <li class="active"><a href="pages-blank.html">Blank Page</a></li>
              <li><a href="pages-blank-header.html">Blank Page Header</a></li>
              <li><a href="pages-blank-aside.html">Blank Page Aside</a></li>
              <li><a href="pages-login.html">Login</a></li>
              <li><a href="pages-404.html">404 Page</a></li>
              <li><a href="pages-500.html">500 Page</a></li>
              <li><a href="pages-sign-up.html"><span class="label label-primary pull-right">New</span>Sign Up</a></li>
              <li><a href="pages-forgot-password.html"><span class="label label-primary pull-right">New</span>Forgot Password</a></li>
              <li><a href="pages-profile.html"><span class="label label-primary pull-right">New</span>Profile</a></li>
              <li><a href="pages-search.html"><span class="label label-primary pull-right">New</span>Search</a></li>
              <li><a href="pages-calendar.html"><span class="label label-primary pull-right">New</span>Calendar</a></li>
              <li><a href="pages-code-editor.html"><span class="label label-primary pull-right">New</span>Code Editor</a></li>
              <li><a href="pages-gallery.html">Gallery</a></li>
              <li><a href="pages-timeline.html">Timeline</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
    <div class="text-right collapse-button" style="padding:7px 9px;">
      <input type="text" class="form-control search" placeholder="Search..." />
      <button id="sidebar-collapse" class="btn btn-default" style=""><i style="color:#fff;" class="icon icon-white icon-arrow-left"></i></button>
    </div>
                    </div>
            </div>
