<%-- 
    Document   : register
    Created on : Dec 9, 2013, 12:49:49 PM
    Author     : aqfaridi
--%>
<%@ page errorPage="error.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <html lang="en">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="shortcut icon" href="images/favicon.ico">


	<title>Register | CodeOJ</title>
	
	<!-- Bootstrap core CSS -->
	<link href="js/bootstrap/dist/css/bootstrap.css" rel="stylesheet"/>

	<link rel="stylesheet" href="fonts/font-awesome-4/css/font-awesome.min.css"/>


	<!-- Custom styles for this template -->
	<link href="css/style.css" rel="stylesheet" />	
        <link href="assets/css/bootstrap1.css" rel="stylesheet" />
 </head>

    <body class="texture">
        <%

            String uname = (String)session.getAttribute("username");
             if(uname!=null)
                {
                    response.sendRedirect("index.jsp");
                }

%>
<div id="cl-wrapper" class="sign-up-container">

	<div class="middle-sign-up">
		<div class="block-flat">
			<div class="header" style="background-color:#dddddd; border: 0;">							
				<h3 class="text-center" style="color: #333333;"><img class="logo-img" src="images/logo.png" alt="logo"/>CodeOJ</h3>
			</div>
			<div>
<form style="margin-bottom: 0px !important;" class="form-horizontal" action="registeraction.jsp" parsley-validate method="post">
        <div class="content">
                <h5 class="title text-center"><strong>Sign Up</strong></h5>
              <hr/>


<div class="form-group">
    <div class="col-sm-12">
        <div class="input-group">
                <span class="input-group-addon"><i class="icon-user"></i></span>
                <input type="text" name="fullname"   required data-parsley-minlength="6" placeholder="Fullname" class="form-control">
        </div>
    <div id="nick-error"></div>
                                                              </div>
 <c:if test='${not empty param["name"]}'>
     <center><p style="color:red;font-weight:bold;">Invalid Name</p></center>
</c:if> 
</div>
    <div class="form-group">
        <div class="col-sm-12">
                <div class="input-group">
                        <span class="input-group-addon"><i class="icon-barcode"></i></span>
                        <input type="text" name="username" parsley-trigger="change" parsley-error-container="#nick-error" required placeholder="Username" class="form-control">
                </div>
                <div id="nick-error"></div>
                   <c:if test='${not empty param["exists"]}'>
                       <center><p style="color:red;font-weight:bold;">Username or Email Already Registered.</p></center>
</c:if>
 
<c:if test='${not empty param["uname"]}'>
    <center><p style="color:red;font-weight:bold;">Invalid Username (6-20 characters)</p></center>
</c:if>

    </div>
    </div>
    <div class="form-group">
            <div class="col-sm-12">
                    <div class="input-group">
                            <span class="input-group-addon"><i class="icon-envelope"></i></span>
                            <input type="email" name="email" parsley-trigger="change" parsley-error-container="#email-error" required placeholder="E-mail" class="form-control">
                    </div>
<div id="email-error"></div>
<c:if test='${not empty param["email"]}'>
    <center> <p style="color:red;font-weight:bold;">Invalid Email</p></center>
</c:if>
            </div>
    </div>
    <div class="form-group">
     <div class="col-sm-6 col-xs-6">
      <div class="input-group">
           <span class="input-group-addon"><i class="icon-lock"></i></span>
           <input id="pass1" name="passwd" type="password" parsley-error-container="#password-error" placeholder="Password" required class="form-control">
      </div>
<div id="password-error"></div>

            </div>
        
            <div class="col-sm-6 col-xs-6">
                    <div class="input-group">
                            <span class="input-group-addon"><i class="icon-lock"></i></span>
                            <input parsley-equalto="#pass1" name="conpasswd" type="password" parsley-error-container="#confirmation-error"required placeholder="Confirm Password" class="form-control">
                    </div>
<div id="confirmation-error"></div>

            </div>
    </div> 
              
   <c:if test='${not empty param["passwd"]}'>
       <center> <p style="color:red;font-weight:bold;">Invalid Password (6-20 characters)</p></center>
</c:if>              
    <c:if test='${not empty param["cpasswd"]}'>
<center> <p style="color:red;font-weight:bold;">Password does not matches</p></center>
</c:if>             
    <c:if test='${not empty param["success"]}'>
<center> <p style="color:green;font-weight:bold;">Registration Successful. Check your Inbox !!</p></center>
</c:if>
             <p class="spacer">By creating an account, you agree with the <a href="#">Terms</a> and <a href="#">Conditions</a>.</p>
            
       <div class="form-group">
            <div class="col-sm-8 col-xs-8">
                <button class="btn btn-block btn-success btn-rad btn-lg" type="submit">Sign Up</button>

            </div>
        
            <div class="col-sm-4 col-xs-4">
                 <a class="btn btn-block btn-primary btn-rad btn-lg" href="login.jsp">Sign In</a>  
            </div>
    </div> 
             
							
					</div>
			  </form>
			</div>
		</div>
		<div class="text-center out-links"><a href="#">&copy; 2014 Code Online Judge</a></div>
	</div> 
	
</div>

 <script type="text/javascript">
    $(document).ready(function(){
      //initialize the javascript
      App.init();
      $('form').parsley();
    });
  </script>
   <script src="js/jquery.parsley/dist/parsley.min.html" type="text/javascript"></script>
  <script src="js/jquery.parsley/src/extra/dateiso.html" type="text/javascript"></script>
  <script src="js/jquery.js"></script>
  <script src="js/jquery.parsley/dist/parsley.html" type="text/javascript"></script>
  <script src="js/behaviour/general.js" type="text/javascript"></script>

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

<!-- Mirrored from foxypixel.net/cleanzone/pages-sign-up.html by HTTrack Website Copier/3.x [XR&CO'2013], Sat, 12 Jul 2014 11:03:47 GMT -->
</html>
