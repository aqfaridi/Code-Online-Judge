
<%
           String uname = (String)session.getAttribute("username");
            %>
<link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
         .navbar-inner{
			 background:#F4F4F4;
			 font-size:14px;
			 height:70px;
                         color: #333;

			 }
			

</style>

<div class="navbar">
<div class="navbar-inner">
    <div class="container">
    <div class="row">
        <div class="span5">
            <a href="beginer.jsp?id=BeginersCorner"> Beginers Corner</a>&nbsp;&nbsp;<a href="practice.jsp?id=PracticeMode"> PracticeMode</a>
<a href="index.jsp" class="brand"> <img src="./assets/img/logo.png" alt="CodeShare" width="100px" height="70px"/></a>
<br/>
<h1 class="brand" style="font-weight:bold; color: #333;">CodeShare</h1>
        </div>
        <br/>
       <form action="logout.jsp" method="post" class="pull-right">
<button class="btn btn-primary " > logout </button>
</form>

        <br/>

        <div class="pull-right" style="color:#666;">
            <b> Welcome</b>
            <a href="profile.jsp" style="color:#333;">
            <%
             if(uname!=null)
           
            {
                   out.println("<b>"+uname+"</b>");
            }
           

%>
</a>

&nbsp;&nbsp;
        </div>


    </div>

</div>
</div>
</div>