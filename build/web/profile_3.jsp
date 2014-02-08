 <%-- 
    Document   : profile1
    Created on : Jul 21, 2014, 5:14:45 AM
    Author     : Pankaj Chaudhary
--%>

<%@page import="pojo.Submissions"%>
<%@ page errorPage="error.jsp" %>
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
<%@page import="connection.Config"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<html>
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
    String dpimage =(String) session.getAttribute("dpimage");
    String uid = (String)request.getParameter("uid");   
    
    
//    out.print(User);
    if(username != null)
    {
    %>

        <%@include file="navbar.jsp" %>
        <%@include file="leftpanelonlineindex.jsp" %>
        <% 
    
    }
       else if(uid != null && username == null)
               {%>

        <%@include file="navbar1.jsp" %>
        <%@include file="leftpanelofflineindex.jsp" %>
        <%  }
       else
                {%>
                <% response.sendRedirect("index.jsp"); %>
                 <% }
   %>
   
   
             <%! public SessionFactory factory = null;%>
  <%
                try{
      
                    factory = new ConnectionProvider().getSessionFactory();
                    Session s = factory.openSession();
                    session.setAttribute("factory", factory);
                    String st = "FROM User U WHERE U.username='"+uid+"'";
                    Query q =  s.createQuery(st);
                    List<User> users = q.list();
                    Object[] ob=users.toArray();
                    User now = (User)ob[0];
         
               s.close();
               //factory.close();
               
        %>
            
            
 
        <div class="container-fluid" id="pcont">

	<div class="cl-mcont">
    <div class="row">
      <div class="col-sm-12">
        <div class="block-flat profile-info">
          <div class="row">
            <div class="col-sm-2">
              <div class="avatar">
                 
                <img src="uploadimg/<%=now.getDpimage()%>" class="profile-avatar" />
                </div>
                </div>
                <div class="col-sm-7">
                  <div class="personal">
                    <h1 class="name"><% out.print(now.getFullname()); out.flush(); %></h1>
                    <p class="description"><% out.println( now.getInstitute());  out.flush(); %>
                    <br/>
                    <% out.println( now.getAboutme());  out.flush(); %>
                    <p>
                    
                <button class="btn btn-primary btn-flat btn-rad" data-modal="reply-ticket"><i class="fa fa-check"></i> Following</button>
              </div>
            </div>
          
                    <div class="col-sm-3">
                            <div class="block-flat bars-widget">
          <div class="spk4 pull-right spk-widget"></div>
          <h4>Rank: &nbsp;&nbsp;<span style="color: #0063dc; font-weight: bold">NA</span></h4>
          
        </div>
        
        <div class="block-flat bars-widget">
          <div class="spk4 pull-right"></div>
          <h4>Rating: &nbsp;&nbsp;<span style="color: #0063dc; font-weight: bold">1000</span></h4>
         
          
        </div>
                    </div> 
                    

                    
                    
                    
          </div>
        </div>
      </div>
    </div>
    
    <div class="row">
      <div class="col-sm-9">
        <div class="tab-container">
          <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#home">Information</a></li>
            <li><a data-toggle="tab" href="#friends">Problems Solved</a></li>
      <%
 if(uid.equals(username))
 {
     %> 
            <li><a data-toggle="tab" href="#settings">Settings</a></li>
      <%
}
%>                
          </ul>
          <div class="tab-content">
            <div id="home" class="tab-pane active cont">
              <table class="no-border no-strip information">
                <tbody class="no-border-x no-border-y">
                  <tr>
                    <td style="width:20%;" class="category"><strong>CONTACT</strong></td>
                    <td>
                      <table class="no-border no-strip skills">
                        <tbody class="no-border-x no-border-y">
                              <tr><td style="width:20%;"><b>Website</b></td><td><% out.print(now.getWebsite()); out.flush(); %></td></tr>
                              <tr><td style="width:20%;"><b>E-mail</b></td><td><% out.print(now.getEmailid()); out.flush(); %></td></tr>
                              <tr><td style="width:20%;"><b>Mobile</b></td><td><% out.print(now.getPhoneno()); out.flush(); %></td></tr>
                              <tr><td style="width:20%;"><b>Location</b></td><td><% out.print(now.getCity()); out.flush(); %>, <% out.print(now.getCountry()); out.flush(); %></td></tr>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td class="category"><strong>ABOUT ME</strong></td>
                        <td><p><% out.println(now.getAboutme()); out.flush(); %></p></td>
                  </tr>
                  <tr>
                    <td class="category"><strong>SOCIAL</strong></td>
                    <td> <a href="#" class="btn btn-default btn-flat btn-facebook bg" type="button"><i class="fa fa-facebook"></i> <span>Facebook</span></a>
                      <a href="#" class="btn btn-default btn-flat btn-linkedin bg" type="button"><i class="fa fa-linkedin"></i> <span>Linkedin</span></a>
                      <button class="btn btn-default btn-flat btn-twitter bg" type="button"><i class="fa fa-twitter"></i> <span>Twitter</span></button>
                      <button class="btn btn-default btn-flat btn-google-plus bg" type="button"><i class="fa fa-google-plus"></i> <span>Google+</span></button>
                    </td>
                  </tr>
               
                </tbody>
              </table>
                           <%
                            out.println("</table>");
                            }catch(Exception e)
                          {}
		%>
            </div>
            <div id="friends" class="tab-pane cont">
            <div class="btn-group pull-right">
              <button type="button" class="btn btn-sm btn-flat btn-default"><i class="fa fa-angle-left"></i></button> 
              <button type="button" class="btn btn-sm btn-flat btn-default"><i class="fa fa-angle-right"></i></button> 
            </div>

              <h3 class="widget-title">Problems Solved</h3>
              <div class="row friends-list">
                   <table class="table table-hover" style='font-weight:bold;'>
                      
            <%     HashMap<String, Integer> hm = new HashMap();
                   HashMap<String, Integer> pcode = new HashMap();
                  try{
                        String contestcode="",sql="",problemcode="",l="";
                        
                        int num = 0;
                        Config c = new Config();
                        Connection con = c.getcon();
                        Statement st = con.createStatement();
                        Statement st1 = con.createStatement();
                        String qry = "select * from ContestInfo";
                        ResultSet rs = st.executeQuery(qry);
                    
                        while(rs.next())
                        {
                            num = 0;                             
                            contestcode = rs.getString("contestcode");
                            sql = "Select DISTINCT problemid, langdB from "+contestcode+"submissions where username='"+uid+"' and status='Accepted' order by problemid";
                            //out.print(sql);
                            ResultSet rs1 = st1.executeQuery(sql);
                            rs1.last();
                            num = rs1.getRow();
                            //out.print(num);
                            if(num == 0)
                                continue;
                            
                            rs1.first();
                            out.print("<tr><td><b>"+contestcode+"</b></td>");out.print("<td>");

                            do
                            {
                                l = rs1.getString("langdB");
                                if(hm.containsKey(l))
                                   hm.put(l,(int)hm.get(l)+1);
                                else
                                   hm.put(l,1);
                                
                                problemcode = rs1.getString("problemid");
                                if(!(pcode.containsKey(problemcode)))
                                {    
                                    
                                    out.print("<a href='mysubmission.jsp?c="+contestcode+"&q="+problemcode+"'><b>"+ problemcode +"</b></a> &nbsp;&nbsp;&nbsp;");  
                                    pcode.put(problemcode,1);
                                 }
                                
                            }while(rs1.next());
                            out.print("</td>");
                                    
                        }
                  
                  }catch(Exception e){out.print(e.getMessage());}
                  
            %>      
                   </table>
              </div>
            </p></div>
 <%
 if(uid.equals(username))
 {
     %> 
             <div id="settings" class="tab-pane">
                
                  <%
         try{
       
               //factory = new ConnectionProvider().getSessionFactory();
                Session s = factory.openSession();
                 session.setAttribute("factory", factory);
                 String st = "FROM User U WHERE U.username='"+username+"'";
               Query q =  s.createQuery(st);
               List<User> users = q.list();
               Object[] ob=users.toArray();
                User now = (User)ob[0];
        
            s.close();
            
            
  %>
  <form role="form" class="form-horizontal" action="dpimage.jsp" method="post" enctype="multipart/form-data">
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="nick">Profile Pic</label>
                    <div class="col-sm-9"> 
                      <div class="avatar-upload">
                           <img src="uploadimg/<%=dpimage%>" height="50px" width="45px;" class="profile-avatar img-thumbnail" />
                        <input id="fileupload" type="file" name="photo">
                        <div id="progress" class="overlay"></div>
                      </div>
                    </div>
                  </div>
                        <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                      <button class="btn btn-primary" type="submit">Update</button>
                      <button class="btn btn-default">Reset</button>
                    </div>
                  </div>
              </form>
                     <form role="form" class="form-horizontal" action="profilechange.jsp" method="post">
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="name">Full Name</label>
                    <div class="col-sm-9">
                        <input type="text" name="fullname" id="name" class="form-control" value="<% out.print(now.getFullname()); out.flush(); %>">
                    </div>
                  </div>
               
                    
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="inputEmail3">Phone No.</label>
                    <div class="col-sm-9">
                        <input type="text" name="phoneno" class="form-control"value="<% out.print(now.getPhoneno()); out.flush(); %>" >
                    </div>
                  </div>
                    
                     <div class="form-group">
                    <label class="col-sm-3 control-label" for="inputEmail3">Institute Name</label>
                    <div class="col-sm-9">
                        <input type="text" name="institute" class="form-control"value="<% out.print(now.getInstitute()); out.flush(); %>" >
                    </div>
                  </div>
                    
                      <div class="form-group">
                    <label class="col-sm-3 control-label" for="inputEmail3">Date Of Birth</label>
                    <div class="col-sm-9">
                      
                    
                    <tr>
                     
<td class="col-sm-9">
<select style="width:80px" name="day">
<%
     String days="",months="",years="";
     String dob = now.getDateofbirth();
      if(dob!="")
                {
                    String[] str = dob.split("/");
                    days = str[0];
                    months = str[1];
                     years = str[2];
                 }
     if(dob=="")
          out.println("<option>Days</option>");
     else
          out.println("<option>"+days+"</option>");
 for(int i=1;i<=31;i++)
{
	out.println("<option>"+i+"</option>");

}

%>
</select>
 <select style="width:80px" name="month">

<%

     if(dob=="")
         out.println("<option>Months</option>");
     else
        out.println("<option>"+months+"</option>");

%>


<option value="01">01</option>
<option>02</option>
<option>03</option>
<option>04</option>
<option>05</option>
<option>06</option>
<option>07</option>
<option>08</option>
<option>09</option>
<option>10</option>
<option>11</option>
<option>12</option>
</select>
 <select style="width:80px" name="year">

<%
   
     if(dob=="")
         out.println("<option>Years</option>");
     else
         out.println("<option>"+years+"</option>");
 
 for(int i=1960;i<2013;i++)
{
out.println("<option>"+i+"</option>");
}


%>
</select>
</td>
</tr>
</div>
                      </div>
            
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="inputEmail3">Current City</label>
                    <div class="col-sm-9">
                       <input type="text" name="city" class="form-control"value="<% out.print(now.getCity()); out.flush(); %>" >
                    </div>
                </div>
                    
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="inputEmail3">Country</label>
                    <div class="col-sm-9">
                        <select class="col-sm-12" name="country" >
                      <%
         String country = now.getCountry();
     if(country=="")
         out.println("<option>- - Select a country - -</option>");
     else
        out.println("<option>"+country+"</option>");

%>

<option value="AF">Afghanistan</option>
<option value="AX">Åland Islands</option>
<option value="AL">Albania</option>
<option value="DZ">Algeria</option>
<option value="AS">American Samoa</option>
<option value="AD">Andorra</option>
<option value="AO">Angola</option>
<option value="AI">Anguilla</option>
<option value="AQ">Antarctica</option>
<option value="AG">Antigua and Barbuda</option>
<option value="AR">Argentina</option>
<option value="AM">Armenia</option>
<option value="AW">Aruba</option>
<option value="AU">Australia</option>
<option value="AT">Austria</option>
<option value="AZ">Azerbaijan</option>
<option value="BS">Bahamas</option>
<option value="BH">Bahrain</option>
<option value="BD">Bangladesh</option>
<option value="BB">Barbados</option>
<option value="BY">Belarus</option>
<option value="BE">Belgium</option>
<option value="BZ">Belize</option>
<option value="BJ">Benin</option>
<option value="BM">Bermuda</option>
<option value="BT">Bhutan</option>
<option value="BO">The Plurinational State of Bolivia</option>
<option value="BQ">Bonaire, Sint Eustatius and Saba</option>
<option value="BA">Bosnia and Herzegovina</option>
<option value="BW">Botswana</option>
<option value="BV">Bouvet Island</option>
<option value="BR">Brazil</option>
<option value="IO">British Indian Ocean Territory</option>
<option value="BN">Brunei Darussalam</option>
<option value="BG">Bulgaria</option>
<option value="BF">Burkina Faso</option>
<option value="BI">Burundi</option>
<option value="KH">Cambodia</option>
<option value="CM">Cameroon</option>
<option value="CA">Canada</option>
<option value="CV">Cape Verde</option>
<option value="KY">Cayman Islands</option>
<option value="CF">Central African Republic</option>
<option value="TD">Chad</option>
<option value="CL">Chile</option>
<option value="CN">China</option>
<option value="CX">Christmas Island</option>
<option value="CC">Cocos (Keeling) Islands</option>
<option value="CO">Colombia</option>
<option value="KM">Comoros</option>
<option value="CG">Congo</option>
<option value="CD">Congo, The Democratic Republic Of The</option>
<option value="CK">Cook Islands</option>
<option value="CR">Costa Rica</option>
<option value="CI">Cote D'Ivoire</option>
<option value="HR">Croatia</option>
<option value="CU">Cuba</option>
<option value="CW">Curaçao</option>
<option value="CY">Cyprus</option>
<option value="CZ">Czech Republic</option>
<option value="DK">Denmark</option>
<option value="DJ">Djibouti</option>
<option value="DM">Dominica</option>
<option value="DO">Dominican Republic</option>
<option value="EC">Ecuador</option>
<option value="EG">Egypt</option>
<option value="SV">El Salvador</option>
<option value="GQ">Equatorial Guinea</option>
<option value="ER">Eritrea</option>
<option value="EE">Estonia</option>
<option value="ET">Ethiopia</option>
<option value="FK">Falkland Islands (Malvinas)</option>
<option value="FO">Faroe Islands</option>
<option value="FJ">Fiji</option>
<option value="FI">Finland</option>
<option value="FR">France</option>
<option value="GF">French Guiana</option>
<option value="PF">French Polynesia</option>
<option value="TF">French Southern Territories</option>
<option value="GA">Gabon</option>
<option value="GM">Gambia</option>
<option value="GE">Georgia</option>
<option value="DE">Germany</option>
<option value="GH">Ghana</option>
<option value="GI">Gibraltar</option>
<option value="GR">Greece</option>
<option value="GL">Greenland</option>
<option value="GD">Grenada</option>
<option value="GP">Guadeloupe</option>
<option value="GU">Guam</option>
<option value="GT">Guatemala</option>
<option value="GG">Guernsey</option>
<option value="GN">Guinea</option>
<option value="GW">Guinea-Bissau</option>
<option value="GY">Guyana</option>
<option value="HT">Haiti</option>
<option value="HM">Heard Island and McDonald Islands</option>
<option value="VA">Holy See (Vatican City State)</option>
<option value="HN">Honduras</option>
<option value="HK">Hong Kong</option>
<option value="HU">Hungary</option>
<option value="IS">Iceland</option>
<option value="India">India</option>
<option value="ID">Indonesia</option>
<option value="IR">Iran, Islamic Republic of</option>
<option value="IQ">Iraq</option>
<option value="IE">Ireland</option>
<option value="IL">Israel</option>
<option value="IT">Italy</option>
<option value="JM">Jamaica</option>
<option value="JP">Japan</option>
<option value="JE">Jersey</option>
<option value="JO">Jordan</option>
<option value="KZ">Kazakhstan</option>
<option value="KE">Kenya</option>
<option value="KI">Kiribati</option>
<option value="KP">Korea, Democratic People's Republic of (North)</option>
<option value="KR">Korea, Republic of (South)</option>
<option value="KW">Kuwait</option>
<option value="KG">Kyrgyzstan</option>
<option value="LA">Lao People's Democratic Republic</option>
<option value="LV">Latvia</option>
<option value="LB">Lebanon</option>
<option value="LS">Lesotho</option>
<option value="LR">Liberia</option>
<option value="LY">Libyan Arab Jamahiriya</option>
<option value="LI">Liechtenstein</option>
<option value="LT">Lithuania</option>
<option value="LU">Luxembourg</option>
<option value="MO">Macao</option>
<option value="MK">Macedonia, The Former Yugoslav Republic of</option>
<option value="MG">Madagascar</option>
<option value="MW">Malawi</option>
<option value="MY">Malaysia</option>
<option value="MV">Maldives</option>
<option value="ML">Mali</option>
<option value="MT">Malta</option>
<option value="MH">Marshall Islands</option>
<option value="MQ">Martinique</option>
<option value="MR">Mauritania</option>
<option value="MU">Mauritius</option>
<option value="YT">Mayotte</option>
<option value="MX">Mexico</option>
<option value="FM">Micronesia, Federated States of</option>
<option value="MD">Moldova, Republic of</option>
<option value="MC">Monaco</option>
<option value="MN">Mongolia</option>
<option value="ME">Montenegro</option>
<option value="MS">Montserrat</option>
<option value="MA">Morocco</option>
<option value="MZ">Mozambique</option>
<option value="MM">Myanmar</option>
<option value="NA">Namibia</option>
<option value="NR">Nauru</option>
<option value="NP">The Federal Democratic Republic of Nepal</option>
<option value="NL">Netherlands</option>
<option value="NC">New Caledonia</option>
<option value="NZ">New Zealand</option>
<option value="NI">Nicaragua</option>
<option value="NE">Niger</option>
<option value="NG">Nigeria</option>
<option value="NU">Niue</option>
<option value="NF">Norfolk Island</option>
<option value="MP">Northern Mariana Islands</option>
<option value="NO">Norway</option>
<option value="OM">Oman</option>
<option value="PK">Pakistan</option>
<option value="PW">Palau</option>
<option value="PA">Panama</option>
<option value="PG">Papua New Guinea</option>
<option value="PY">Paraguay</option>
<option value="PE">Peru</option>
<option value="PH">Philippines</option>
<option value="PN">Pitcairn</option>
<option value="PL">Poland</option>
<option value="PT">Portugal</option>
<option value="PR">Puerto Rico</option>
<option value="QA">Qatar</option>
<option value="RE">Reunion</option>
<option value="RO">Romania</option>
<option value="RU">Russian Federation</option>
<option value="RW">Rwanda</option>
<option value="BL">Saint Barthelemy</option>
<option value="SH">Saint Helena, Ascension and Tristan da Cunha</option>
<option value="KN">Saint Kitts and Nevis</option>
<option value="LC">Saint Lucia</option>
<option value="MF">Saint Martin</option>
<option value="PM">Saint Pierre and Miquelon</option>
<option value="VC">Saint Vincent and the Grenadines</option>
<option value="WS">Samoa</option>
<option value="SM">San Marino</option>
<option value="ST">Sao Tome and Principe</option>
<option value="SA">Saudi Arabia</option>
<option value="SN">Senegal</option>
<option value="RS">Serbia</option>
<option value="SC">Seychelles</option>
<option value="SL">Sierra leone</option>
<option value="SG">Singapore</option>
<option value="SX">Sint Maarten (Dutch Part)</option>
<option value="SK">Slovakia</option>
<option value="SI">Slovenia</option>
<option value="SB">Solomon Islands</option>
<option value="SO">Somalia</option>
<option value="ZA">South Africa</option>
<option value="GS">South Georgia and the South Sandwich Islands</option>
<option value="ES">Spain</option>
<option value="LK">Sri Lanka</option>
<option value="SD">Sudan</option>
<option value="SS">South Sudan</option>
<option value="SR">Suriname</option>
<option value="SJ">Svalbard and Jan Mayen</option>
<option value="SZ">Swaziland</option>
<option value="SE">Sweden</option>
<option value="CH">Switzerland</option>
<option value="SY">Syrian Arab Republic</option>
<option value="TW">Taiwan</option>
<option value="TJ">Tajikistan</option>
<option value="TZ">Tanzania, United Republic of</option>
<option value="TH">Thailand</option>
<option value="TL">Timor-Leste</option>
<option value="TG">Togo</option>
<option value="TK">Tokelau</option>
<option value="TO">Tonga</option>
<option value="TT">Trinidad and Tobago</option>
<option value="TN">Tunisia</option>
<option value="TR">Turkey</option>
<option value="TM">Turkmenistan</option>
<option value="TC">Turks and Caicos Islands</option>
<option value="TV">Tuvalu</option>
<option value="UG">Uganda</option>
<option value="UA">Ukraine</option>
<option value="AE">United Arab Emirates</option>
<option value="GB">United Kingdom</option>
<option value="UM">United States Minor Outlying Islands</option>
<option value="US">United States</option>
<option value="UY">Uruguay</option>
<option value="UZ">Uzbekistan</option>
<option value="VU">Vanuatu</option>
<option value="VE">Venezuela</option>
<option value="VN">Viet Nam</option>
<option value="VG">Virgin Islands, British</option>
<option value="VI">Virgin Islands, U.S.</option>
<option value="WF">Wallis and Futuna</option>
<option value="EH">Western Sahara</option>
<option value="YE">Yemen</option>
<option value="ZM">Zambia</option>
<option value="ZW">Zimbabwe</option>
</select>
                    </div>
                  </div>
                    

                <div class="form-group">
                    <label class="col-sm-3 control-label" for="inputEmail3">Address</label>
                    <div class="col-sm-9">
                      <% String address = now.getAddress(); %>
 <td>                <textarea rows="3" name="address" class="col-sm-12" value="<% out.print(address); %>">  <%if(address!="")out.print(address);%> 
                    </textarea>
                    </div>
                </div>

                    
               <div class="form-group">
                    <label class="col-sm-3 control-label" for="inputwebsite">Website</label>
                    <div class="col-sm-9">
                       <input type="text" name="website"class="form-control" value="<%out.print(now.getWebsite());%>">
                    </div>
               </div>
                    
                    
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="inputaboutme">About Me</label>
                    <div class="col-sm-9">
                      <% String aboutme = now.getAboutme(); %>
 <td>                <textarea rows="3" name="aboutme" class="col-sm-12" value="<% out.print(aboutme); %>">  <%if(aboutme!="")out.print(aboutme);%> 
                    </textarea>
                    </div>
                </div>

                  <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                      <button class="btn btn-primary" type="submit">Update</button>
                      <button class="btn btn-default">Reset</button>
                    </div>
                  </div>
              </form>
                    <!--
              <div id="crop-image" class="md-modal colored-header md-effect-1">
                <div class="md-content">
                  <div class="modal-header">
                    <h3>Crop Image</h3>
                    <button aria-hidden="true" data-dismiss="modal" class="close md-close" type="button">×</button>
                  </div>
                  <div class="modal-body">
                    <div class="text-center crop-image">
                    </div>
                    <form action="http://foxypixel.net/cleanzone/crop.php" method="post" onSubmit="return checkCoords();">
                      <input type="hidden" id="x" name="x" />
                      <input type="hidden" id="y" name="y" />
                      <input type="hidden" id="w" name="w" />
                      <input type="hidden" id="h" name="h" />
                    </form>
                  </div>
                  <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-default btn-flat md-close" type="button">Cancel</button>
                    <button id="save-image" class="btn btn-primary btn-flat" type="button">Save Image</button>
                  </div>
                </div>
              </div>
                    
              <div class="md-overlay"></div>
              -->
             <%     
         
         
         }
             
   catch(Exception e){}
  finally{
         factory.close();
         }  

    
%>
              
            </div>
<%

 }
  %>
          </div>
        </div>    
        
        
      </div>
      
      <div class="col-sm-3 side-right">
       <%
       int c = 0,python = 0,jva=0,tot=0,cplus = 0;
       try{
           if(hm.containsKey("C++"))     
                cplus = (int)hm.get("C++");
           if(hm.containsKey("C"))
                c = (int)hm.get("C");
           if(hm.containsKey("Python2.7"))
                python = (int)hm.get("Python2.7");
           if(hm.containsKey("Python3"))             
                python += (int)hm.get("Python3");
           if(hm.containsKey("Java"))
                jva = (int)hm.get("Java");
           //out.print(cplus+" "+c+" "+python+" "+jva);
                   
           tot = cplus + c + python + jva;
       }catch(Exception e){out.print(e.getMessage());}
       %>   
          
              
        <div class="block-flat bars-widget">
              <table class="no-border no-strip skills">
                <tbody class="no-border-x no-border-y">
                  <tr>
                    <td style="width:45%;">C</td>
                    <td><div class="progress"><div style="width: <%=((c*1.0)/tot)*100%>%" class="progress-bar progress-bar-info"></div></div></td>
                  </tr>
                  <tr>
                    <td>C++</td>
                    <td><div class="progress"><div style="width: <%=((cplus*1.0)/tot)*100%>%" class="progress-bar progress-bar-info"></div></div></td>
                  </tr>
                  <tr>
                    <td>Java</td>
                    <td><div class="progress"><div style="width: <%=((jva*1.0)/tot)*100%>%" class="progress-bar progress-bar-info"></div></div></td>
                  </tr>
                  <tr>
                    <td>Python</td>
                    <td><div class="progress"><div style="width: <%=((python*1.0)/tot)*100%>%" class="progress-bar progress-bar-info"></div></div></td>
                  </tr>
                </tbody>
              </table>
         
        </div>
          
          
          
     
    
        
      </div>
    </div>

	</div>
	
	</div> 
	
</div>

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
  <script type="text/javascript" src="js/jquery.niftymodals/js/jquery.modalEffects.html"></script>   
  <script type="text/javascript" src="js/masonry.html"></script>
  <script type="text/javascript" src="js/jquery.crop/js/jquery.Jcrop.html"></script>

  <!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
  <script src="js/jquery.upload/js/jquery.iframe-transport.html"></script>
  <!-- The basic File Upload plugin -->
  <script src="js/jquery.upload/js/jquery.fileupload.html"></script>
	<script type="text/javascript" src="js/behaviour/general.js"></script>

    <script type="text/javascript">
      $(document).ready(function(){
        //initialize the javascript
        App.init();
        
        $(".spk4").sparkline([2,4,3,6,7,5,8,9,4,2,10,], { type: 'bar', width: '200px', barWidth: 6, height: '50px',barColor: '#19B698'});
        $(".spk5").sparkline([5,3,5,6,5,7,4,8,6,9,8,], { type: 'bar', width: '80px', barWidth: 6, height: '50px',barColor: '#E85647'});
        
        //Profile Image Upload
          'use strict';
        // Change this to the location of your server-side upload handler:
        var url =  'js/jquery.upload/server/php/index.html';
        var jcrop;
        var timg;
        
        $('#fileupload').fileupload({
            url: url,
            dataType: 'json',
            done: function (e, data) {
                $.each(data.result.files, function (index, file) {
                    timg = file.name;
                    $(".crop-image").html('<img src="js/jquery.upload/server/php/files/' + file.name + '" />');
                    $('#progress').fadeOut();
                    
                    //Crop Image
                    $(".crop-image img").Jcrop({
                      aspectRatio: 1
                    },function(){
                      jcrop = this;
                    });
                });
                
                $("#crop-image").niftyModal();
            },
            progressall: function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress').fadeIn();
                $('#progress').css(
                    'width',
                    progress + '%'
                );
            }
        }).prop('disabled', !$.support.fileInput).parent().addClass($.support.fileInput ? undefined : 'disabled');
        
        $("#save-image").click(function(){
          var c = jcrop.tellSelect();
          //console.log(jcrop.tellSelect());
          if( c.w != 0 ){
            $(".profile-avatar").attr("src",'js/jquery.upload/server/php/files/cropb6ce.html?src=' + timg + '&x=' + c.x + '&y=' + c.y + '&w=' + c.w + '&h=' + c.h );
            $("#crop-image").niftyModal('hide');
          }else{
            alert("Please select a crop region then press save.");
          }
        });

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

<!-- Mirrored from foxypixel.net/cleanzone/pages-profile.html by HTTrack Website Copier/3.x [XR&CO'2013], Sat, 12 Jul 2014 11:03:49 GMT -->
</html>
