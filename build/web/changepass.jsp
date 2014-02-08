<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from foxypixel.net/cleanzone/pages-login.html by HTTrack Website Copier/3.x [XR&CO'2013], Sat, 12 Jul 2014 11:03:47 GMT -->
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="shortcut icon" href="images/favicon.ico">

	<title>Clean Zone</title>
	
	<!-- Bootstrap core CSS -->
	<link href="js/bootstrap/dist/css/bootstrap.css" rel="stylesheet">

	<link rel="stylesheet" href="fonts/font-awesome-4/css/font-awesome.min.css">

	<!-- Custom styles for this template -->
	<link href="css/style.css" rel="stylesheet" />	
        <link href="assets/css/bootstrap1.css" rel="stylesheet" />	
</head>

<body class="texture">
    <%
    String username = (String)session.getAttribute("username");
    if(username == null)
               {
        response.sendRedirect("index.jsp");
    }
    %>
<div id="cl-wrapper" class="login-container">

	<div class="middle-login">
		<div class="block-flat">
			<div class="header" style="background-color:#dddddd; border: 0;">							
				<h3 class="text-center" style="color: #333333;"><img class="logo-img" src="images/logo.png" alt="logo"/>CodeOJ</h3>
			</div>
			<div>
                            <form style="margin-bottom: 0px !important;" class="form-horizontal" action='passchange.jsp' method="post">
        <div class="content">
        <h4 class="title">Change Password</h4>
                <div class="form-group">
                        <div class="col-sm-12">
                                <div class="input-group">
                                        <span class="input-group-addon"><i class="icon-user"></i></span>
                                        <input type="password" placeholder="Current Password" id="username" class="form-control" name="password">
                                </div>
                        </div>
                </div>
                        <div class="form-group">
                                <div class="col-sm-12">
                                        <div class="input-group">
                                                <span class="input-group-addon"><i class="icon-lock"></i></span>
                                                <input type="password" placeholder="New Password" id="password" class="form-control" name="passwd">
                                        </div>
                                </div>
                        </div>
                        <div class="form-group">
                                <div class="col-sm-12">
                                        <div class="input-group">
                                                <span class="input-group-addon"><i class="icon-lock"></i></span>
                                                <input type="password" placeholder="Confirm Password" id="password" class="form-control" name="conpasswd">
                                        </div>
                                </div>
                        </div>
        
        </div>
        <div class="foot">
                <button class="btn btn-primary" data-dismiss="modal" type="submit">Update Password</button>
        </div>
</form>
			</div>
		</div>
		<div class="text-center out-links"><a href="#">&copy; 2014 codeOJ</a></div>
	</div> 
	
</div>

<script src="js/jquery.js"></script>
	<script type="text/javascript" src="js/behaviour/general.js"></script>

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

<!-- Mirrored from foxypixel.net/cleanzone/pages-login.html by HTTrack Website Copier/3.x [XR&CO'2013], Sat, 12 Jul 2014 11:03:47 GMT -->
</html>
