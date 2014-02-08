  <%-- 
    Document   : deleteaction
    Created on : Aug 26, 2014, 2:22:10 PM
    Author     : Pankaj Chaudhary
--%>
<%@page import="java.sql.*"%>
<%@page import="connection.Config" %>
<%@page import="org.hibernate.Transaction"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="pojo.User"%>
<%@page import="pojo.Comment"%>
<%@page import="pojo.Problems"%>
<%@page import="pojo.ContestInfo"%>
        <%

    String contestcode = request.getParameter("contestcode");

    Config c = new Config();
    Connection con = c.getcon();
    Statement stmt = con.createStatement();
    Statement stmt2 = con.createStatement();
    int[] rate = new int[2010];
    String[] user = new String[2010];
        //out.println("contest "+contest+" problem"+problem+id+cmt);
    if(contestcode!=null)
     {
       try{
        String sql = "Select userid,rating,score,time from "+contestcode+"ranking ORDER BY score DESC , time ASC";
        ResultSet rs = stmt.executeQuery(sql);
        int i = 1;
        while(rs.next())
        {
            rate[i] = Integer.parseInt(rs.getString("rating"));
            user[i] = rs.getString("userid");
            i++;
        }
        
        	//old rating of user 
		//initial rating of unrated user = 1 + n/2
		//where n = number of participants

		int n = i-1; //users fetch from db

		//for each user : fetch old_rating from profile
          double Ra=0,Rb=0,Ea=0,sum=0;      
          for(int u = 1;u<=n;u++)
          {
                if(rate[u] == 0)  
                    Ra = 1.0 + n/2.0;   //user A old rating : if unrated user
                else
                    Ra = rate[u];
                
		sum = 0.0;		
		for(int j=1;j<=n;j++){                       
			Rb = rate[j];//fetch from db : user B old rating
			Ea = 1.0 / (1.0 + Math.pow(10,(Ra-Rb)/400.0)) ; //prob. that A will get higher rating than B : acc. to Elo
			sum += Ea;
		}
		
		double expected_rank = n - sum;
		int k = 1; //constant factor	
		//fetch actual rank from contest leaderboard db
		double actual_rank = u;	
		double new_rating = Ra + k*(expected_rank - actual_rank) ;//new rating=old rating+ k* (ExpectedRank - ActualRank)
		
		//update new_rating for user A in db
		//System.out.println(new_rating);
                String sql2 = "update User set rating="+new_rating+" where username='"+user[u]+"'";
                stmt2.executeUpdate(sql2);

          }
            response.sendRedirect("ratingupdate.jsp");
        }
       catch(Exception e){}
       finally{
       con.close();
       }
    }

%>