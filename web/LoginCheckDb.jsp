<%-- 
    Document   : LoginCheckDb
    Created on : Nov 26, 2018, 6:07:54 PM
    Author     : Akshay
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/adic_finaldb","root","");  
        Statement stmt=con.createStatement();

        ResultSet rs1 = stmt.executeQuery("select username, pass,TwitterScreenName  from userinfo");
        
        int loginflg = 0;
        String twitterName = "";
        while(rs1.next())
        {
            if(rs1.getString(1).equals(username) && rs1.getString(2).equals(pass))
            {
                loginflg = 1;
                twitterName = rs1.getString(3);
            }
        }
        
        if(loginflg == 1){
                String redirectURL = "http://localhost:8086/ADIC_Final/index.jsp?screenName="+twitterName;
                response.sendRedirect(redirectURL);
        }else{
            out.print("Login information incorrect please Login again");
        }
        %>
    </body>
</html>
