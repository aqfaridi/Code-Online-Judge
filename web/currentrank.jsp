<%-- 
    Document   : currentrank
    Created on : 3 Jul, 2014, 6:49:40 PM
    Author     : aqfaridi
--%>



<%@page import="java.util.List"%>
<%@page import="pojo.Submissions"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <div class="span3">
            <table class=" table table-bordered">
                <tr>
                    <td colspan="3" style="background-color: #F4F4F4;"><h1>Successfull Submissions!</h1>
                    </td>
                </tr>
                <tr>
                    <td>Solution Id</td>
                    <td>User Name</td>
                    <td>Language</td>
                    <td>Execution time</td>
                    <td>Memory</td>
                </tr>
         <% HashMap<String ,Integer> hm = new HashMap<String, Integer>();
         
            SessionFactory factory = new ConnectionProvider().getSessionFactory();
            Session s = factory.openSession();
            int len =0;
                    Object[] ob=null;
                    String status = "Accepted";
                    String problemid = (String)session.getAttribute("q");
                    try {
  // Session s3= factory.openSession();
   String st = "FROM Submissions st WHERE st.status = :status AND st.problemid = :problemid ORDER BY st.timelimit ASC";  //ASC//DESC
   
   Query q =  s.createQuery(st);
   q.setParameter("status", status);
   
   q.setParameter("problemid", problemid);
   List <Submissions> setters = q.list();
   ob = setters.toArray();
    len = ob.length ;
  // ContestSetter test = (ContestSetter)ob[0]; ContestSetter test2 = (ContestSetter)ob[1];
   //test.
    //      out.write(test.toString()); out.flush();
          
      //    out.write(test2.toString()); out.flush();
               }catch(Exception ex){ out.print(ex.toString());out.flush(); }
               %> 
                 <%    
               if(len!=0){     
               for(int i=1;i<=len;i++){
                   Submissions test = (Submissions)ob[i-1];
                   if(hm.containsKey(test.getUsername()))continue;
                   out.print("<tr><td>"+i+"</td><td><a href='solutionshow.jsp?id="+test.getCodefilename()+"' class='aa'>"+test.getCodefilename()+"</a> </td><td>"+test.getUsername()+"</td><td>"+ test.getLangdB()+"</td><td>"+test.getTimelimit()+"</td><td>"+test.getMemory()+"</td></tr>");
                   hm.put(test.getUsername(), 1);
               }
               }else out.print("No Submission Till Now");out.flush();
               s.clear();
               s.close();
              %>
   
         
                 
            </table> 
   </div>
    </body>
</html>
