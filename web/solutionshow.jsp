<%-- 
    Document   : solutionshow
    Created on : Jul 16, 2014, 11:48:17 AM
    Author     : Pankaj Chaudhary
--%>
<%--
    Document   : register
    Created on : Dec 9, 2013, 12:49:49 PM
    Author     : aqfaridi
--%>

<%@page import="pojo.Submissions"%>
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
<%@page import="org.apache.commons.io.FileUtils" %>
<%@page import="connection.Path"%>
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
//    out.print(User);
    if(username != null)
               {%>

        <%@include file="navbar.jsp" %>
        <%@include file="leftpanelonlineindex.jsp" %>
        <%  }
                else
                {%>
                <%@include file="navbar1.jsp"%>
                  <%@include file="leftpanelofflineindex.jsp" %>
                 <% }
   %>
  	<div class="container-fluid" id="pcont">
                    <div class="row-fluid">
	
       <script src="src/ace.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript" src="js/jquery.js"></script>

                    
         <div class="col-sm-8 code-panel" id="editor"  style="height:800px; margin-left:12px;margin-top:20px;"></div>
         	<script>
		    var editor = ace.edit("editor");

		    editor.setTheme("ace/theme/chrome");
		    editor.getSession().setMode("ace/mode/c_cpp");
		    //editor.getSession().setValue("Error Loading template: No Language Selected , Select Language from left panel");
		    editor.setOption("showPrintMargin", false)
		    editor.setFontSize("16px") 
		    editor.renderer.setVScrollBarAlwaysVisible(true);
		    editor.setKeyboardHandler("ace/keyboard/ace");
                </script>
           
<%
        String id = (String)request.getParameter("id");
        String e = (String)request.getParameter("e");
        String contestid = (String)request.getParameter("c");
        String problemid = (String)request.getParameter("p");
        String userid = (String)request.getParameter("u");
        String langdB = (String)request.getParameter("l");
 %>
 
    <input id="codefilename" type="hidden" value=<%=id%> />
    <input id="ext" type="hidden" value=<%=e%> />
       <input id="contestid" type="hidden" value=<%=contestid%> />
    <input id="problemid" type="hidden" value=<%=problemid%> />
        <input id="userid" type="hidden" value=<%=userid%> />
    <input id="langdB" type="hidden" value=<%=langdB%> />
    
 <script>
    $( document).ready(function() {
             
        var codefilename = $('#codefilename').val();
        var ext = $('#ext').val();
        var problemid = $('#problemid').val();
        var contestid = $('#contestid').val();
        var userid = $('#userid').val();
        var langdB = $('#langdB').val();
        setTimeout(function ()  {
               
                $.post('showcode',{'id' : codefilename,'e':ext,'c':contestid},function(dt){
                        //alert(dt);
                        var json = JSON.parse(dt);
                        if(json['chk'] == "0")
                        {
                            alert("This solution is in Private Mode");
                                                 
                        }
                        else
                            window.editor.getSession().setValue(json['out']);
                        
                        //display info
                        
                    });       
        },0);
     });     
     

</script>
 

               
<div class="col-sm-3" style="margin-top: 20px;">
    <table class="table table-hover">
             <tr>
                 <td style="color:#666;"><b>User Name:</b></td>
                 <td><a href="profile.jsp?uid=<%=userid%>"><%=userid%></a></td>
             </tr>
             <tr>
                 <td style="color:#666;"><b>Problem Code:</b></td>
                 <td><a href="problemshow.jsp?c=<%=contestid%>&q=<%=problemid%>"><%=problemid%></a></td>
             </tr>
             <tr>
                 <td style="color:#666;"><b>Language:</b></td>
                 <td><%=e%></td>
             </tr>
   </table>
             
         <div class="form-group">
            <div class="col-sm-10 col-xs-10">
                <button id="compileone" class="btn btn-block btn-success btn-rad btn-lg">CompileOne It</button>

            </div>           
  </div>
    
        
    </div>
    
					
		</div> 

</div>
             <script>
 $('#compileone').click(function( event ) {
	
    var form = document.createElement('form');
    form.action = "http://www.compileone.com/index.php";//"//www.compileone.com/";
    form.method = 'POST';
    form.target = '_blank';
    var source = editor.getSession().getValue();
    var ext = $('#ext').val();
    var access = "private";
    var operation = "codeoj";
    var names = new Array( "operation","access","source", "ext");
    var values = new Array(operation,access,source, ext);
    for(var i=0; i<names.length; i++) {
    	var input = document.createElement('input');
        input.type = 'hidden';
        input.name = names[i];
        input.value = values[i];
        form.appendChild(input);
    }
    
    document.body.appendChild(form);
    form.submit();
    document.body.removeChild(form);
});

                 </script>
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
