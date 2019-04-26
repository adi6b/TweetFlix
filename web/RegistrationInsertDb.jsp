<%-- 
    Document   : RegistrationInsertDb
    Created on : Nov 25, 2018, 11:03:59 PM
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
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String pass = request.getParameter("pass");
            String screenName = request.getParameter("screenName");

        Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/adic_finaldb","root","");  
        Statement stmt=con.createStatement();
        int num = 3;
        stmt.executeUpdate("insert into userinfo values ("+num+",'"+name+"','"+screenName+"','"+"06/08/1993"+"','"+username+"','"+pass+"') ");

        String redirectURL = "http://localhost:8086/ADIC_Final/LoginPage.jsp";
        response.sendRedirect(redirectURL);

            %>
    </body>
</html>
