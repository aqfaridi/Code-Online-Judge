<%--
    Document   : register
    Created on : Dec 9, 2013, 12:49:49 PM
    Author     : aqfaridi
--%>
<%@page import="pojo.Submissions"%>
<%@page import="java.sql.Timestamp"%>
<%@ page errorPage="error.jsp" %>
<%@page import="java.nio.file.Path"%>
<%@page import="java.nio.file.FileSystems"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.User"%>
<%@page import="org.hibernate.Query"%>
<%@page import="javax.xml.soap.Text"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="pojo.ContestSetter"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.io.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CodeShare</title>
<link rel="shortcut icon" type="image/x-icon" href="assets/favicon.ico"/>
<link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
<link href="assets/css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="assets/js/jquery.js"></script>
		<script type="text/javascript" src="assets/js/jquery-1.7.1.min.js"></script>

</head>

    <body>
            <script type="text/javascript" src="assets/js/bootstrap-tab.js"></script>
            <script type="text/javascript" src="assets/js/jquery.validate.min1.js"></script>
            <script src="assets/js/bootstrap.js" type="text/javascript"></script>
            <script type="text/javascript" src="assets/js/script2.js"></script>

<div class="navbar">
<div class="navbar-inner">
    <div class="container">


<a href="index.jsp" class="brand"> <img src="assets/img/logo.png" alt="CodeShare" width="100px" height="70px"/></a>
<br/>
<h1 class="brand" style="font-weight:bold;">CodeShare</h1>

<form action="logout.jsp" method="post" class="pull-right">
<button class="btn btn-primary " > logout </button>
</form>

        <br/>

        <div class="pull-right" style="color:white;">
        <%
             String username = (String)session.getAttribute("username");
             if(username==null)
                {
                    response.sendRedirect("index.jsp");
                }
            else
            {
                   out.println("<b> Welcome , "+username+"</b>");
            }

             String picture = (String)session.getAttribute("pic");
             //out.println(picture);
             if(picture=="" || picture==null)
                 picture = "profile.png";
%>

&nbsp;&nbsp;
        </div>



</div>
</div>
</div>



<div class="container well">
    <div class="row">

        <div class="span3">

            <div style="border:5px #808080 solid;z-index:-100;height:200px;width:210px;">
                <center><img  src="uploadimg/<%=picture%>" alt="Profile Pic"  style="padding:5px;height:190px;width:200px"/></center>
            </div>

            <br/>
            <ul class="nav nav-tabs nav-stacked nav-justified"  style='background-color:white;'>
                    
                    <li>
                        <a href="#viewprofile" data-toggle="tab">Profile</a>
                    </li>
                    <li>
                        <a href="#profile" data-toggle="tab">Edit Profile</a>
                    </li>
                     <li>
                        <a href="#problemsolved" data-toggle="tab">Solved Problems</a>
                    </li>
                    <li>
                        <a href="#ChangPassword" data-toggle="tab">Change Password</a>
                    </li>
            </ul>
            <br/><br/>
        </div>

   <div id="maincontent" class="span9">
            
 <div id="myTabContent" class="tab-content" style="border:2px solid #a1a1a1;border-radius:10px;">
 <div id="ChangPassword" class="span8 tab-pane " style="padding:20px 10px;">
<form  action ='passchange.jsp' id="contact-form" class="form-horizontal" method="post">

                 <div class="control-group">
                      <label class="control-label" for="passwd">Password</label>
                      <div class="controls">
                          <div class="input-prepend">
                        <span class="add-on"><i class="icon-lock"></i></span>
                        <input type="password" class="input-large" name="password" id="password" placeholder="******"/>
                      </div>
                    </div>
               </div>
 <div class="control-group">
              <label class="control-label" for="passwd">Password</label>
              <div class="controls">
                  <div class="input-prepend">
                <span class="add-on"><i class="icon-lock"></i></span>
                <input type="password" class="input-large" name="passwd" id="passwd" placeholder="******"/>
              </div>
            </div>
       </div>
        <div class="control-group">
              <label class="control-label" for="conpasswd">Confirm Password</label>
              <div class="controls">
                  <div class="input-prepend">
        <span class="add-on"><i class="icon-lock"></i></span>
                <input type="password" class="input-large" name="conpasswd" id="conpasswd" placeholder="******"/>
              </div>
            </div>
        </div>
              <div class="control-group">
              <label class="control-label"></label>
              <div class="controls">
                <button type="submit" class="btn btn-success">Submit</button>
              </div>
              </div>


</form>

                </div>

     <!-- =================== edit profile ================  -->
     
     
       <div id="profile" class="span8 tab-pane" style="padding:20px 10px;">
      
          <%! public SessionFactory factory = null;%>
  <%
    try{
      
               factory = new ConnectionProvider().getSessionFactory();
               Session s = factory.openSession();
               session.setAttribute("factory", factory);
               String st = "FROM User U WHERE U.username='"+username+"'";
               Query q =  s.createQuery(st);
               List<User> users = q.list();
               Object[] ob=users.toArray();
               User now = (User)ob[0];
       
            s.close();
            
            
  %>

<form action="profilechange.jsp" method="post"  >
<table class="span8 table">
<tr><td style="font-weight:bold;color:#808080;">Full Name</td>
    <td><input type="text" name="fullname" required="true" class="span3" placeholder="First Name" value="<% out.print(now.getFullname()); out.flush(); %>" />
</td></tr>
<tr><td style="font-weight:bold;color:#808080;">Institute Name</td>
    <td><input type="text" name="institute" required="true" class="span3" placeholder="Institute Name" value="<% out.print(now.getInstitute()); out.flush(); %>" />
</td></tr>
<tr><td style="font-weight:bold;color:#808080;">Date Of Birth</td>
<td class="span3">
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

<tr><td style="font-weight:bold;color:#808080;">Mobile</td>
<td><input tabindex="text" class="span3" maxlength="10" name="phoneno" placeholder="Mobile Phones" value="<% out.print(now.getPhoneno()); out.flush(); %>" /></td></tr>
<tr><td style="font-weight:bold;color:#808080;">Current City</td>
    <td><input title="text" class="span3" name="city" placeholder="Current City" value="<% out.print(now.getCity()); out.flush(); %>" />
</td></tr>
<tr><td style="font-weight:bold;color:#808080;">country</td>
<td><select style="width:280px" name="country" >
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
<option value="IN">India</option>
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
</td>
</tr>
<tr><td style="font-weight:bold;color:#808080;">Address</td>
    <% String address = now.getAddress(); %>
<td><textarea rows="3" cols="60" name="address" placeholder="Address" class="span3" value="<% out.print(address); %>">  <%if(address!="")out.print(address);%>  </textarea></td></tr>
<tr><td style="font-weight:bold;color:#808080;">Website</td>
    <td><input type="text" class="span3" name="website" placeholder="Website" value="<% out.print(now.getWebsite()); out.flush(); %>" /></td></tr>
    <tr><td style="font-weight:bold;color:#808080;">About Me</td>
        <% String aboutme = now.getAboutme(); %>
        <td><textarea  rows="3" cols="60" name="aboutme" class="span3" placeholder="About Me" value="<% out.print(aboutme); %>"> <%if(aboutme!="")out.print(aboutme);%></textarea>
        </td></tr>
    <tr><td><button class="btn btn-info" type="submit">Save</button></td>
        <td><button class="btn btn-error" type="submit">Cancel</button></td></tr>


</table> 
</form>
        
<%          }
            
   
    catch(Exception e){}
     

    
%>
 <br/>
</div>

<!-- ======================= view profile process ====================================   -->
 
 
 <div id="viewprofile" class="span8 tab-pane" style="padding:20px 10px;">

    <h1 style='color:#3399FF;'> Personal Details : </h1>


  <%
    try{
      
               factory = new ConnectionProvider().getSessionFactory();
               Session s = factory.openSession();
               session.setAttribute("factory", factory);
               String st = "FROM User U WHERE U.username='"+username+"'";
               Query q =  s.createQuery(st);
               List<User> users = q.list();
               Object[] ob=users.toArray();
               User now = (User)ob[0];
               out.println("<table class='span8 table table-hover' style='background-color:white;color:#808080;' >");
               s.close();
               factory.close();
               
        %>
		     <tr style="font-weight:bold;">
                              <td>Name : </td>
                              <td><% out.print(now.getFullname()); out.flush(); %></td>
                          </tr>
						   <tr style="font-weight:bold;">
                              <td>Institute : </td>
                              <td><% out.print(now.getInstitute()); out.flush(); %></td>
                          </tr>
						   <tr style="font-weight:bold;">
                              <td>Email : </td>
                              <td><% out.print(now.getEmailid()); out.flush(); %></td>
                          </tr>
			<tr style="font-weight:bold;">
                              <td>Mobile: </td>
                              <td><% out.print(now.getPhoneno()); out.flush(); %></td>
                        </tr>
                       <tr style="font-weight:bold;">
                              <td>Date of Birth: </td>
                              <td><% out.print(now.getDateofbirth()); out.flush(); %></td>
                          </tr>


                          <tr style="font-weight:bold;">
                              <td>Address: </td>
                              <td><% out.print(now.getAddress()); out.flush(); %></td>
                          </tr>


                          <tr style="font-weight:bold;">
                              <td>Current City: </td>
                              <td><% out.print(now.getCity()); out.flush(); %></td>
                          </tr>


                          <tr style="font-weight:bold;">
                              <td>Country: </td>
                              <td><% out.print(now.getCountry()); out.flush(); %></td>
                          </tr>

                          <tr style="font-weight:bold;">
                              <td>Website: </td>
                              <td><a href="<% out.print(now.getWebsite()); out.flush(); %>" target="_blank" ><% out.print(now.getWebsite()); out.flush(); %> </a> </td>
                          </tr>


                          <tr style="font-weight:bold;">
                              <td>About Me: </td>
                              <td><% out.print(now.getAboutme()); out.flush(); %></td>
                          </tr>
			   
			<%
			out.println("</table>");
                                }catch(Exception e)
                                        {}
			%>
                        <br/><br/>
            </div>

                        <!-- ===== solved problem ================== ------>
       <div id="solvedproblem" class="span8 tab-pane" style="padding:20px 10px;">
           
     
  <%
    try{
      
               factory = new ConnectionProvider().getSessionFactory();
               Session s = factory.openSession();
               session.setAttribute("factory", factory);
               String st = "FROM Submissions sub WHERE sub.username='"+username+"'";
               Query q =  s.createQuery(st);
               List<Submissions> submissions = q.list();
               Object[] ob=submissions.toArray();
               Submissions sp = (Submissions)ob[0];
               out.println("<table class='span8 table table-hover' style='background-color:white;color:#808080;' >");
               s.close();
               factory.close();
               
        %> 
                <tr style="font-weight:bold;">
                    <td><% out.print(sp.getContestid()); out.flush(); %> : </td>
                    <td><% out.print(sp.getProblemid()); out.flush(); %></td>
                </tr>
                
        <%
			out.println("</table>");
                                }catch(Exception e)
                                        {}
			%>
                        <br/><br/>
      </div>
                        
                        

</div>

   

</div>
</div>
 </div>
  <%@include file="footer.jsp" %>
    </body>
</html>
