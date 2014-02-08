
<%@page import="pojo.User"%>
<%@page import="sun.misc.BASE64Encoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.security.MessageDigest" %>
<%@page import="dao.ConnectionProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.io.*"%>
<%@page import="mail.MailVerify"%>
<%@page import="mail.AuthCode"%>
<%@page import="connection.Path"%>

<%      
        String path = Path.getPath() + "users/";
	String name=request.getParameter("fullname");
        String username=request.getParameter("username");
        String password=request.getParameter("passwd");
        String conpassword=request.getParameter("conpasswd");
        String email=request.getParameter("email");
        
 
        
        
        
        
        
        path+=username;
          File dir = new File(path);
        if(!dir.exists()){
    
            dir.mkdir();
        }
        
        SessionFactory factory = new ConnectionProvider().getSessionFactory();
        Session s = factory.openSession();
        Session ch = factory.openSession(); 
        String qry = "FROM User U WHERE U.username='"+username+"' OR U.emailid='"+username+"' ";
        List<User> users = null;
        try{

            Query q = ch.createQuery(qry);
            users = q.list();     //execute query statment
       }catch(Exception ex){}
       finally
       {
           ch.close();
       }
            
        
        /*       =============  backend validation  =================    */
  
         //full name
        if(name.matches("^\\s+$"))
            response.sendRedirect("register.jsp?name=True"); 
        
        else if (!name.matches("^[a-zA-Z ,.'-]+$"))
            response.sendRedirect("register.jsp?name=True"); 
        
        // Usename min 6 char max 20 char
        else if (!username.matches("^[a-zA-Z\\d_]{6,20}$"))
         response.sendRedirect("register.jsp?uname=True"); 
				 
        // Password min 6 char max 20 char
        else if (!password.matches("^[a-zA-Z0-9_-]{6,20}$"))
            response.sendRedirect("register.jsp?passwd=True");
        
        //confirm password 
        else if(!password.equals(conpassword))
            response.sendRedirect("register.jsp?cpasswd=True");

        // Email
        else if (!email.matches("^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$")) 
            response.sendRedirect("register.jsp?email=True");


        /*******************************************************************/
        
        
             /*     =========  register - verification  =========== */
        
        
        else if(users.size() == 0)
              {
                    MessageDigest MD5=MessageDigest.getInstance("MD5");
                    MD5.update(password.getBytes(),0,password.getBytes().length);
                    byte[] hashvalue=MD5.digest();
                    password=new BASE64Encoder().encode(hashvalue);
                    AuthCode authCode=new AuthCode();
                    String code=authCode.generateCode(); 
                    User newUser = new User(username,password,name,email,true,"set your Institute name","set your Contact no","set your Address","Current city","country","website","aboutme","dd/mm/yyyy",code,1000,0);
                   
                    String msg="Your verification CODE is:"+code+" . \n To verify Click on this link http://www.codeoj.com/Verification.jsp?email="+email+"&authcode="+code+"";
                    System.out.print("msg is" +msg);
                    out.print("msg is" +msg);
                    //MailVerify mv=new MailVerify(email, msg);
                    //mv.verify();
                    out.print("To Login verify yourself.");

                    try
                    {
                        Transaction t = s.beginTransaction();
                        s.save(newUser);
                        t.commit();
                    }
                    catch(Exception e){}
                    finally{factory.close(); s.close();}
                    
                   response.sendRedirect("register.jsp?success=True");     
            }
            else
                response.sendRedirect("register.jsp?exists=True");

%>


