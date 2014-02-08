<%-- 
    Document   : practice.jsp
    Created on : 7 Jul, 2014, 11:31:22 PM
    Author     : aqfaridi
--%>


<%@page import="pojo.Setter"%>
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

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="description" content="On-line Exam System is very useful for Educational Institute to prepare an exam, save the time that will take to check the paper and prepare mark sheets. It will help the Institute to testing of students and develop their skills. But the disadvantages for this system, it takes a lot of times when you prepare the exam at the first time for usage. And we are needs number of computers with the same number of students."/>
<meta name="keywords" content="result,profile,quiz,online,exam,contest,codeshare,student,paper,faculty,give,make,delete" />
<meta name="author" content="Abdul Qadir Faridi & Pankaj Chaudhary" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Quiz ExamShow</title>
		<script type="text/javascript" src="assets/js/jquery.js"></script>
		<script type="text/javascript" src="assets/js/jquery-1.7.1.min.js"></script>
</head>
<body>
                  <script type="text/javascript" src="countdown.js"></script>
                  <%@include file="header.jsp" %>
                <%! public SessionFactory factory = null;%>
                  <% 
                      String id = (String)request.getParameter("id");
        
                factory = new ConnectionProvider().getSessionFactory();
   Session s = factory.openSession();
   session.setAttribute("factory", factory);
   
   
   //s.clear();
   //s.close();
  
   %>     
<div class="container-fluid">
<div class="row-fluid">
    <div class="span1">&nbsp; &nbsp;</div>
    <div class="span10" >
    <h1>Practice Here</h1>
        <br/><br/><br/>
            <div class="container-fluid">
    <div class="row-fluid">
    <div class="span8">
        <h3>Problems</h3>
        <% Object[] ob=null;
            String st=null;
            Query q=null;
           
            try{
    //s = factory.openSession();
    st = "FROM Setter S WHERE S.contestcode='"+id+"' ORDER BY S.difficulty ASC";
     q =  s.createQuery(st);
   List<Setter> ques = q.list();
    ob=ques.toArray();
   
  // Setter tmp = (Setter)ob[0];
  // out.print(tmp.toString());out.flush();
   s.clear();
   s.close();
   factory.close();
        }catch(Exception e){out.print(e.getMessage()); }
        
        
        
        
        
        %>
        
      <table id="sortTableExample" class='table'>
           <thead style="background-color: #F4F4F4; height: 40px; border: 2px; border-color: F4F4F4;">
            <tr>
                <th class="header">#</th>
                <th class="sheader">Problem Name</th>
                <th class="blue header">Problem Code</th>
                <th class="green header">Solved By</th>
                <th class="green header headerSortUp">Accuracy</th>
                <th class="green header headerSortUp">Difficulty Level</th>
                </tr>
            </thead>
           <tbody>
            <% 
      
         for(int i=1; i<= ob.length ;i++){  
            Setter tmp = (Setter)ob[i-1];
            double acc = 0;
            if(tmp.getTotal()!=0){
                acc=(1000*tmp.getSuccess())/tmp.getTotal();
                acc/=1000.0;
            }
            
        out.print("<tr><td>"+i+"</td><td><a href='problemshow.jsp?q="+tmp.getProblemcode()+"&c="+id+"' >"+tmp.getProblemname()+"</td><td><a href='previewproblem.jsp?q="+tmp.getProblemcode()+"' >"+tmp.getProblemcode()+"</a></td><td>"+tmp.getSuccess()+" </td><td>"+acc+"</td><td>"+tmp.getDifficulty()+"</td></tr>");
            
        }
            %>
           </tbody>
        </table>
  
    </div>
    
    
        <span align="center" style="margin-left: 100px;">
            <img src='contests/BeginersCorner/img.jpg' alt="Poster" align="center" height="300px" width="600px" />
    
        </span>
    <br/><br/>
        
    
    
    
</div>
</div>
</div>
                  
</body></html>