<%-- 
    Document   : Submit1
    Created on : Jul 23, 2014, 9:36:55 AM
    Author     : Pankaj Chaudhary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from foxypixel.net/cleanzone/pages-blank.html by HTTrack Website Copier/3.x [XR&CO'2013], Sat, 12 Jul 2014 11:03:47 GMT -->
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
    
    
            <%
    String username =(String) session.getAttribute("username");
//    out.print(User);
    if(username != null)
               {%>

         <%@include file="navbar.jsp" %>
        <%@include file="leftpanelonline.jsp" %>
        <%  }
                else
                {%>
                <%@include file="navbar1.jsp"%>
                  <%@include file="leftpaneloffline.jsp" %>
                 <% }
   %>
    
    
    <!--  ================= Text Editer Part ======================= -->
    
    
    <script language="Javascript" type="text/javascript" src="editarea_0_8_2/editarea_0_8_2/edit_area/edit_area_full.js"></script>
	<script language="Javascript" type="text/javascript">
		
        // initialisation
	

		editAreaLoader.init({
			id: "example_2"	// id of the textarea to transform
			,start_highlight: true
			,allow_toggle: true
                        ,allow_resize: "both"
                        ,word_wrap: true
			,language: "en"
			,syntax: "cpp"
			,toolbar: "search, go_to_line,  |, fullscreen, |, undo, redo, |, select_font, |, syntax_selection, |, change_smooth_selection, highlight, reset_highlight, |, help"
			,syntax_selection_allow: "java,php,python,c,cpp,C#,pas,brainfuck,perl,ruby,haskel"
			,is_multi_files: true
			,EA_load_callback: "editAreaLoaded"
			,show_line_colors: true
                        ,replace_tab_by_spaces: 4
		});

		// callback functions
		function my_save(id, content){
			alert("Here is the content of the EditArea '"+ id +"' as received by the save callback function:\n"+content);
		}

		function my_load(id){
			editAreaLoader.setValue(id, "The content is loaded from the load_callback function into EditArea");
		}

		function test_setSelectionRange(id){
			editAreaLoader.setSelectionRange(id, 100, 150);
		}

		function test_getSelectionRange(id){
			var sel =editAreaLoader.getSelectionRange(id);
			alert("start: "+sel["start"]+"\nend: "+sel["end"]);
		}

		function test_setSelectedText(id){
			text= "[REPLACED SELECTION]";
			editAreaLoader.setSelectedText(id, text);
		}

		function test_getSelectedText(id){
			alert(editAreaLoader.getSelectedText(id));
		}

		function editAreaLoaded(id){
			if(id=="example_2")
			{
				open_file1();
				
			}
		}

		function open_file1()
		{
			var new_file= {id: "to\\ é # € to", text: "", syntax: 'cpp', title: 'your code'};
			editAreaLoader.openFile('example_2', new_file);
		}

	

		function close_file1()
		{
			editAreaLoader.closeFile('example_2', "to\\ é # € to");
		}

		function toogle_editable(id)
		{
			editAreaLoader.execCommand(id, 'set_editable', !editAreaLoader.execCommand(id, 'is_editable'));
		}

	</script>
                <script type="text/javascript" src="tinymce/js/tinymce/tinymce.js"></script>
                <script src="assets/js/bootstrap.js" type="text/javascript"></script>

<%
    String problemcode = (String)request.getParameter("q");
    String contestcode = (String)request.getParameter("c");
%>  


<div class="container-fluid">
    <div class="row-fluid">
        <div class="col-sm-1">
            &nbsp;
        </div>
        <%String st =(String)request.getParameter("q");%>
<div class="col-sm-11">
    <h4>Submit a Solution: <%=st %></h4>
    <br/>
    <h5>Please insert your source code: </h5>
    <div class="row-fluid">
 
     
<form action="submitaction?q=<%=problemcode%>&c=<%=contestcode%>" class="form-horizontal" method="post" enctype="multipart/form-data" >
    
        <div class="col-sm-8">
   


             <textarea id="example_2" style="height: 400px; width: 100%;" name="test1"  maxlength="50000">
		</textarea>
    <br/>
        </div>
        <div class="col-sm-3">
            
            <table>
                
                <tr>
                    <td>OR choose a file to upload:</td>
                </tr>
                <tr>
                    <td><input type="file" name="test2" id ="upload"/></td>
                </tr>
                <tr>
                    <td>Language:</td>
                </tr>
                <tr>
                    <td>
                        <select  id="language" name="language">
                            <% String dlang = (String)session.getAttribute("dlang");
     if(dlang==null    )
         out.println("<option>- - Select Language - -</option>");
     else
        out.println("<option value="+dlang+">"+dlang+"</option>");

%>
                                <option value="AWK">AWK</option>
                                <option value="Bash">Bash</option>
                                <option value="C++">C++</option>
                                <option value="C">C</option>
                                <option value="C#">C#</option>
                                <option value="Java">Java</option>
                                <option value="Haskell">HASKELL</option>

                                <option value="Pike">Pike</option>
                                <option value="Perl">Perl</option>

                                <option value="Python2.7">Python2.7</option>
                                <option value="Python3">Python3</option>
                                <option value="PHP">PHP</option>
                                <option value="Pascal">Pascal</option>
                                <option value="Ruby">Ruby</option>
                        </select>
               </td>
                </tr>
                <tr>
                    <td>
                      <button id = "btn-run" type="submit" class="btn btn-success" >Submit</button>
                     </td>
                </tr>
            </table>
               
              </div>
        </div>
     </form>
         
</div></div>
</div>
</div>
    
    
    
    
</div>
<script type="text/javascript" src="assets/js/jquery.js"></script>
		<script type="text/javascript" src="assets/js/jquery-1.7.1.min.js"></script>
	<script src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery.nanoscroller/jquery.nanoscroller.js"></script>
	<script type="text/javascript" src="js/jquery.sparkline/jquery.sparkline.min.html"></script>
	<script type="text/javascript" src="js/jquery.easypiechart/jquery.easy-pie-chart.js"></script>
  <script src="js/jquery.ui/jquery-ui.html" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.nestable/jquery.nestable.js"></script>
	<script type="text/javascript" src="js/bootstrap.switch/bootstrap-switch.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
	<script src="js/jquery.select2/select2.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.slider/js/bootstrap-slider.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.gritter/js/jquery.gritter.js"></script>
	<script type="text/javascript" src="js/behaviour/general.js"></script>

    <script type="text/javascript">
      $(document).ready(function(){
        //initialize the javascript
        App.init();
      });
      
</script>

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

<!-- Mirrored from foxypixel.net/cleanzone/pages-blank.html by HTTrack Website Copier/3.x [XR&CO'2013], Sat, 12 Jul 2014 11:03:47 GMT -->
</html>

