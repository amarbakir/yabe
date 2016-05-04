<!DOCTYPE html>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="mindrot.jbcrypt.BCrypt" %>

<% 
  Connection answers_conn = null;
  try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    answers_conn = DriverManager.getConnection("jdbc:mysql://localhost/yabe","yabe","yabe");
  }

  catch(Exception e){
    System.out.println("Could not connect to SQL server");
    e.printStackTrace();
  }

%>

<html>
    <head>
        <title>Question/Answers</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.css" rel="stylesheet">
        <style>
        body {
          padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
          padding-bottom: 40px;
        }
        </style>
        <script src="js/jquery-1.10.2.min.js"></script>
        <script src="js/bootstrap.js"></script>
    </head>
    <body>
        <%@include file="includes/navbar.jsp" %>
        <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>Frequently Asked Questions and Answers</h1>
            </div>
            
             <table border="1" cellpadding="5">
				            <caption><h2>List of Bids</h2></caption>
				            <tr>
				                <th>Question ID:</th>
				                <th>Asker Username:</th>
				                <th>What is the Question?</th>
				                <th>Answer</th>
				                
				                
				                
			</tr>
            <%

           	  Statement answers_stmt = answers_conn.createStatement() ;
              ResultSet answers_resultset;
              answers_resultset = null;
              String answers_query = "SELECT * FROM question q, answer a WHERE q.question_id = a.question_id";
              answers_resultset = answers_stmt.executeQuery(answers_query);
              while(answers_resultset.next()){  %> 
					      
				                <tr>
				                 
				                    <td><%= answers_resultset.getInt("question_id") %></td>
				                    <td><%= answers_resultset.getString("username") %></td>
				                    <td colspan="90"><%= answers_resultset.getString("question") %></td>
				                    <td colspan="90">><%= answers_resultset.getString("answer") %></td>
				                    
				                </tr>
				        </table>
				</div>
				
            </div>  <%}%>
            </div>   
        </div>
        <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
