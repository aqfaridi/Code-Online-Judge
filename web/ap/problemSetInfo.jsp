 <%-- 
    Document   : admin
    Created on : Jun 5, 2014, 7:09:14 PM
    Author     : Pankaj Chaudhary
--%>


<%@page import="pojo.Problems"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="pojo.ContestInfo"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.io.*"%>
<%@page import="connection.Path"%>

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
    <link href="../js/bootstrap/dist/css/bootstrap.css" rel="stylesheet" />
	<link rel="stylesheet" href="../fonts/font-awesome-4/css/font-awesome.min.css">
             <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
        <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="../font-awesome/css/font-awesome.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->
	    <link rel="stylesheet" type="text/css" href="../js/jquery.gritter/css/jquery.gritter.css" />

  <link rel="stylesheet" type="text/css" href="../js/jquery.nanoscroller/nanoscroller.css" />
  
	<link rel="stylesheet" type="text/css" href="../js/bootstrap.switch/bootstrap-switch.css" />
	<link rel="stylesheet" type="text/css" href="../js/jquery.select2/select2.css" />
	<link rel="stylesheet" type="text/css" href="../js/bootstrap.slider/css/slider.css" />
	<link rel="stylesheet" type="text/css" href="../js/intro.js/introjs.css" />
  <!-- Custom styles for this template -->
  <link href="../css/style.css" rel="stylesheet" />
  <link href="../assets/css/bootstrap1.css" rel="stylesheet" />
</head>
<body>

  <!-- Fixed navbar -->
   <%
    String uname =(String) session.getAttribute("adminuser");
    String dpimage =(String) session.getAttribute("dpimage");
//    out.print(User);


          // String uname = (String)session.getAttribute("adminuser");
    if(uname != null)
               {%>

        <%@include file="navbar.jsp" %>
        <%@include file="leftpanel.jsp" %>
        <%  }
                else
                {
                response.sendRedirect("adminpanel.jsp");
                  }

    
     SessionFactory factory = new ConnectionProvider().getSessionFactory();
     Session newsession=factory.openSession();

     Problems setter = new Problems((String)session.getAttribute("contestcode"), (String)session.getAttribute("problemcode"), "problemname", "timelimit", "problemsetter", "problemtester", 0, "problemdescription",0,0,(float)0);
try
{
     setter = ( Problems )newsession.get( Problems.class, setter.getProblemcode() );
}
catch(Exception e){out.print(e.getMessage());}
finally{
    newsession.close(); 
    factory.close();
}
    String path = Path.getArgPath("contests",(String)setter.getContestcode(),(String)setter.getProblemcode()) + "description.txt";
    BufferedReader br=null;
    BufferedWriter bout=null;
    
    try{
        // making file 
        bout = new BufferedWriter(new FileWriter(path,true),5000);
        bout.write(" ");bout.flush();bout.close();
        br = new BufferedReader(new FileReader(path),5000);
        //
      }catch(Exception e){ out.print(e.getMessage()); }
   
    %>
    

                
       <script type="text/javascript" src="../tinymce/js/tinymce/tinymce.min.js"></script>
 
        
<script type="text/javascript">
tinymce.init({
    mode : "specific_textareas",
    editor_selector : "mceEditor",     
        plugins: [
                "autolink autosave link image lists charmap hr anchor",
                "visualblocks code fullscreen",
                "table"
        ],

        toolbar: "alignleft aligncenter alignright alignjustify | bullist numlist | outdent indent | fontselect fontsizeselect | fullscreen "

});
</script>
     
    
   <div class="container-fluid" id="pcont">

    <div class="row">
      <div class="col-sm-12 col-md-12">
             
          <div class="content">
                               
      <form action="problemSetInfoaction.jsp" id="contact-form" class="form-horizontal" method="post" enctype="multipart/form-data">
          
          
          
             <div class="form-group">
                      <label for="inputsubject" class="col-sm-2 control-label">Contest Code</label>
                      <div class="col-sm-3">
                            <input type="text" id="inputPassword3" class="form-control"  name="contestcode" id="scode"  value = "<%=setter.getContestcode() %>" />
             
                      </div>

                      <label for="inputPassword3" class="col-sm-2 control-label">Problem Code</label>
                      <div class="col-sm-3">
                       <input type="text" id="inputPassword3" class="form-control" name="problemcode"   value = "<%=setter.getProblemcode() %>" />
             
                      </div>
                  </div>
          
          
          
             <div class="form-group">
                      <label for="inputsubject" class="col-sm-2 control-label">Problem Name</label>
                      <div class="col-sm-3">
                            <input type="text" id="inputPassword3" class="form-control"  name="problemname" id="scode"  value = "<%=setter.getProblemname() %>" />
             
                      </div>

                      <label for="inputPassword3" class="col-sm-2 control-label">TimeLimit</label>
                      <div class="col-sm-3">
                       <input type="text" id="inputPassword3" class="form-control" name="timelimit"   value = "<%=setter.getTimelimit() %>" />
             
                      </div>
                  </div>
          
          
              <div class="form-group">
                      <label for="inputsubject" class="col-sm-2 control-label">Difficulty</label>
                      <div class="col-sm-3">
                            <input type="text" id="inputPassword3" class="form-control"  name="difficulty" id="scode"  value = "<%=setter.getDifficulty() %>" />
             
                      </div>

                      <label for="inputPassword3" class="col-sm-2 control-label">Problem Setter</label>
                      <div class="col-sm-3">
                       <input type="text" id="inputPassword3" class="form-control" name="problemsetter"   value = "<%=setter.getProblemsetter() %>" />
             
                      </div>
                  </div>
          

          
               <div class="form-group">
                      <label for="inputsubject" class="col-sm-2 control-label">Problem Tester:</label>
                      <div class="col-sm-3">
                            <input type="text" id="inputPassword3" class="form-control"  name="problemtester" id="scode"  value = "<%=setter.getProblemtester() %>" />
             
                      </div>
                                           <label for="inputsubject" class="col-sm-2 control-label">Number of Test Files</label>
                      <div class="col-sm-3">
                            <input type="text" id="testfiles" class="form-control"  name="testfiles" id="scode"  value = "" />
                      </div>    
                         <a id = "testf" class="btn btn-primary">Go</a>                     
                  </div>
          
          
 
                    <div class="form-group">       

                      
                           <label  class="col-sm-2 control-label">Input Files</label>  
                           <div id="textsection" class="col-sm-3"><!-- some controls--></div> 
                      
                     
                           <label  class="col-sm-2 control-label">Output Files</label>   
                           <div id="textsection2" class="col-sm-3"><!-- some controls--></div> 
                           
                 
                    
                    </div>      
          
 <script type="text/javascript" src="../js/jquery.js"></script>                          
<script>
 $('#testf').click(function( event ) {
  
    var names = new Array( "input1","input2","input3", "input4","input5","input6","input7", "input8","input9","input10");
    var names2 = new Array( "output1","output2","output3", "output4","output5","output6","output7", "output8","output9","output10");
    var nof = $('#testfiles').val();

    for(var i=0; i<nof; i++) {
    	var input = document.createElement('input');
        input.name = names[i];
        input.type = "file";   
        $('form #textsection').append(input);
    }
    
    for(var i=0; i<nof; i++) {
    	var input = document.createElement('input');
        input.name = names2[i];
        input.type = "file";   
        $('form #textsection2').append(input);
    }

});

                 </script>                           
          
 <br/>
                            <div class="span" style="margin-left: 100px;color:#333;"><h4><b>Problem Description:</b></h4></div>
         
            <div class="form-group">
                      <div class="col-sm-1">
                          &nbsp;
                      </div>
                     <div class="col-sm-8">
                         
                         <textarea class="mceEditor"  name="problemdescription" rows="15" cols="60">

      <% 
       int cnt = 0;
       for(;;){
            String str=null;

            try {

              str =  br.readLine();

            }catch(Exception e){ out.print("MSG=="+e.getMessage()); out.flush(); break;} 
            if(str==null){break;}
            cnt++;
            out.print(""+str); out.flush();
       
       } 
       
      if(cnt==0){ out.print("Write problem description and test cases & their Explanation"); out.flush(); }
       br.close();
     
     
      %></textarea>
                     </div></div>
            
                 <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-success">Submit</button>
                <button class="btn btn-default">Cancel</button>
              </div>
              </div>                       
                    </form>
 </div>
        </div>				
      </div>
    </div>
</div>

  <script type="text/javascript" src="../js/jquery.gritter/js/jquery.gritter.js"></script>

  <script type="text/javascript" src="../js/jquery.nanoscroller/jquery.nanoscroller.js"></script>
	<script type="text/javascript" src="../js/behaviour/general.js"></script>
  <script src="../js/jquery.ui/jquery-ui.html" type="text/javascript"></script>
	<script type="text/javascript" src="../js/jquery.sparkline/jquery.sparkline.min.html"></script>
	<script type="text/javascript" src="../js/jquery.nestable/jquery.nestable.js"></script>
	<script type="text/javascript" src="../js/bootstrap.switch/bootstrap-switch.min.js"></script>
  <script src="../js/jquery.select2/select2.min.js" type="text/javascript"></script>
  <script src="../js/skycons/skycons.js" type="text/javascript"></script>
    <script src="../js/intro.js/intro.js" type="text/javascript"></script>
  


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
    <script src="../js/behaviour/voice-commands.js"></script>
  <script src="../js/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/jquery.flot/jquery.flot.js"></script>
<script type="text/javascript" src="../js/jquery.flot/jquery.flot.resize.js"></script>
	<script type="text/javascript" src="../js/jquery.flot/jquery.flot.labels.js"></script>
  </body>

<!-- Mirrored from foxypixel.net/cleanzone/ by HTTrack Website Copier/3.x [XR&CO'2013], Sat, 12 Jul 2014 11:03:16 GMT -->
</html>
