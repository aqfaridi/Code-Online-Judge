<%-- 
    Document   : forgotpass
    Created on : Jul 21, 2014, 7:20:14 AM
    Author     : Pankaj Chaudhary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from foxypixel.net/cleanzone/pages-forgot-password.html by HTTrack Website Copier/3.x [XR&CO'2013], Sat, 12 Jul 2014 11:03:47 GMT -->
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

<div id="cl-wrapper" class="forgotpassword-container">

	<div class="middle">
		<div class="block-flat">
			<div class="header" style="background-color:#dddddd; border: 0;">							
				<h3 class="text-center" style="color: #333333;"><img class="logo-img" src="images/logo.png" alt="logo"/>CodeOJ</h3>
			</div>
			<div>
		<form style="margin-bottom: 0px !important;" class="form-horizontal" action="#" parsley-validate validate>
					<div class="content">
						<h5 class="title text-center"><strong>Forgot your password?</strong></h5>
            <p class="text-center">Don't worry, we'll send you an email to reset your password.</p>
              <hr/>

              
							<div class="form-group">
								<div class="col-sm-12">
									<div class="input-group">
										<span class="input-group-addon"><i class="icon-envelope"></i></span>
										<input type="email" name="email" parsley-trigger="change" parsley-error-container="#email-error" required placeholder="Your Email" class="form-control">
									</div>
                  <div id="email-error"></div>
								</div>
							</div>
             <p class="spacer text-center">Don't remember your email? <a href="#">Contact Support</a>.</p>
            <button class="btn btn-block btn-primary btn-rad btn-lg" type="submit">Reset Password</button>
							
					</div>
			  </form>
			</div>
		</div>
		<div class="text-center out-links"><a href="#">&copy; 2014 Your Code Online Judge</a></div>
	</div> 
	
</div>


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

<!-- Mirrored from foxypixel.net/cleanzone/pages-forgot-password.html by HTTrack Website Copier/3.x [XR&CO'2013], Sat, 12 Jul 2014 11:03:47 GMT -->
</html>
